//------------------------------------------------------------------------------
// <copyright file="SqlUtil.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
// <owner current="true" primary="true">[....]</owner>
// <owner current="true" primary="false">[....]</owner>
//------------------------------------------------------------------------------

namespace System.Data.SqlClient {
    using System;
    using System.ComponentModel;
    using System.Data;
    using System.Data.Common;
    using System.Diagnostics;
    using System.Globalization;
    using System.Reflection;
    using System.Runtime.Serialization.Formatters;
    using System.Security;
    using System.Security.Permissions;
    using System.Security.Principal;
    using System.Threading;
    using System.Text;
    using SysTx = System.Transactions;
    using System.Runtime.Versioning;    
    using System.Threading.Tasks;
    using System.Runtime.CompilerServices;
    using System.Runtime.ExceptionServices;

    static internal class AsyncHelper {
        internal static Task CreateContinuationTask(Task task, Action onSuccess, SqlInternalConnectionTds connectionToDoom = null, Action<Exception> onFailure = null) {
            if (task == null) {
                onSuccess();
                return null;
            }
            else {
                TaskCompletionSource<object> completion = new TaskCompletionSource<object>();
                ContinueTask(task, completion,
                    () => { onSuccess(); completion.SetResult(null); },
                    connectionToDoom, onFailure);
                return completion.Task;
            }
        }

        internal static Task CreateContinuationTask<T1, T2>(Task task, Action<T1, T2> onSuccess, T1 arg1, T2 arg2, SqlInternalConnectionTds connectionToDoom = null, Action<Exception> onFailure = null) {
            return CreateContinuationTask(task, () => onSuccess(arg1, arg2), connectionToDoom, onFailure);
        }
        
        internal static void ContinueTask(Task task, 
                TaskCompletionSource<object> completion,
                Action onSuccess,
                SqlInternalConnectionTds connectionToDoom = null,
                Action<Exception> onFailure = null,
                Action onCancellation = null,
                Func<Exception, Exception> exceptionConverter = null,
                SqlConnection connectionToAbort = null
            ) {
            Debug.Assert((connectionToAbort == null) || (connectionToDoom == null), "Should not specify both connectionToDoom and connectionToAbort");
            task.ContinueWith(
                tsk => {
                    if (tsk.Exception != null) {
                        Exception exc = tsk.Exception.InnerException;
                        if (exceptionConverter != null) {
                            exc = exceptionConverter(exc);
                        }
                        try {
                            if (onFailure != null) {
                                onFailure(exc);
                            }
                        }
                        finally {
                            completion.TrySetException(exc);
                        }
                    }
                    else if (tsk.IsCanceled) {
                        try {
                            if (onCancellation != null) {
                                onCancellation();
                            }
                        }
                        finally {
                            completion.TrySetCanceled();
                        }
                    }
                    else {
                        if (connectionToDoom != null || connectionToAbort!=null) {
                            RuntimeHelpers.PrepareConstrainedRegions();
                            try {
#if DEBUG
                                TdsParser.ReliabilitySection tdsReliabilitySection = new TdsParser.ReliabilitySection();
                                RuntimeHelpers.PrepareConstrainedRegions();
                                try {
                                    tdsReliabilitySection.Start();
#endif //DEBUG
                                    onSuccess();
#if DEBUG
                                }
                                finally {
                                    tdsReliabilitySection.Stop();
                                }
#endif //DEBUG
                            }
                            catch (System.OutOfMemoryException e) {
                                if (connectionToDoom != null) {
                                    connectionToDoom.DoomThisConnection();
                                }
                                else {
                                    connectionToAbort.Abort(e);
                                }
                                completion.SetException(e);
                                throw;
                            }
                            catch (System.StackOverflowException e) {
                                if (connectionToDoom != null) {
                                    connectionToDoom.DoomThisConnection();
                                }
                                else {
                                    connectionToAbort.Abort(e);
                                }
                                completion.SetException(e);
                                throw;
                            }
                            catch (System.Threading.ThreadAbortException e) {
                                if (connectionToDoom != null) {
                                    connectionToDoom.DoomThisConnection();
                                }
                                else {
                                    connectionToAbort.Abort(e);
                                }
                                completion.SetException(e);
                                throw;
                            }
                            catch (Exception e) {
                                completion.SetException(e);
                            }
                        }
                        else { // no connection to doom - reliability section not required
                            try {
                                onSuccess();
                            }
                            catch (Exception e) {
                                completion.SetException(e);
                            }
                        }
                    }
                }, TaskScheduler.Default
            );
        }


        internal static void WaitForCompletion(Task task, int timeout, Action onTimeout = null, bool rethrowExceptions=true) {
            try {
                task.Wait(timeout > 0 ? (1000 * timeout) : Timeout.Infinite);                
            }
            catch (AggregateException ae) {
                if (rethrowExceptions) {
                    Debug.Assert(ae.InnerExceptions.Count == 1, "There is more than one exception in AggregateException");
                    ExceptionDispatchInfo.Capture(ae.InnerException).Throw();
                }
            }
            if (!task.IsCompleted) {
                if (onTimeout != null) {
                    onTimeout();
                }
            }
        }

        internal static void SetTimeoutException(TaskCompletionSource<object> completion, int timeout, Func<Exception> exc, CancellationToken ctoken) {
            if (timeout > 0) {
                Task.Delay(timeout * 1000, ctoken).ContinueWith((tsk) => {
                    if (!tsk.IsCanceled && !completion.Task.IsCompleted) {
                        completion.TrySetException(exc());
                    }
                });
            }
        }        
    }

    sealed internal class InOutOfProcHelper {
        private static readonly InOutOfProcHelper SingletonInstance = new InOutOfProcHelper();

        private bool _inProc = false;

        // InOutOfProcHelper detects whether it's running inside the server or not.  It does this
        //  by checking for the existence of a well-known function export on the current process.
        //  Note that calling conventions, etc. do not matter -- we'll never call the function, so 
        //  only the name match or lack thereof matter.
        [ResourceExposure(ResourceScope.None)]
        [ResourceConsumption(ResourceScope.Process, ResourceScope.Process)]
        private InOutOfProcHelper() {
            // Don't need to close this handle...
            // SxS: we use this method to check if we are running inside the SQL Server process. This call should be safe in SxS environment.
            IntPtr handle = SafeNativeMethods.GetModuleHandle(null);
            if (IntPtr.Zero != handle) {
                // SQLBU 359301: Currently, the server exports different names for x86 vs. AMD64 and IA64.  Supporting both names
                //  for now gives the server time to unify names across platforms without breaking currently-working ones.
                //  We can remove the obsolete name once the server is changed.
                if (IntPtr.Zero != SafeNativeMethods.GetProcAddress(handle, "_______SQL______Process______Available@0")) {
                    _inProc = true;
                }
                else if (IntPtr.Zero != SafeNativeMethods.GetProcAddress(handle, "______SQL______Process______Available")) {
                    _inProc = true;
                }
            }
        }

        internal static bool InProc {
            get {
                return SingletonInstance._inProc;
            }
        }
    }

    static internal class SQL {
        // The class SQL defines the exceptions that are specific to the SQL Adapter.
        // The class contains functions that take the proper informational variables and then construct
        // the appropriate exception with an error string obtained from the resource Framework.txt.
        // The exception is then returned to the caller, so that the caller may then throw from its
        // location so that the catcher of the exception will have the appropriate call stack.
        // This class is used so that there will be compile time checking of error
        // messages.  The resource Framework.txt will ensure proper string text based on the appropriate
        // locale.

        //
        // SQL specific exceptions
        //

        //
        // SQL.Connection
        //

        static internal Exception CannotGetDTCAddress() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_CannotGetDTCAddress));
        }
        
        static internal Exception InvalidOptionLength(string key) {
            return ADP.Argument(Res.GetString(Res.SQL_InvalidOptionLength, key));
        }
        static internal Exception InvalidInternalPacketSize (string str) {
            return ADP.ArgumentOutOfRange (str);
        }
        static internal Exception InvalidPacketSize() {
            return ADP.ArgumentOutOfRange (Res.GetString(Res.SQL_InvalidTDSPacketSize));
        }
        static internal Exception InvalidPacketSizeValue() {
            return ADP.Argument(Res.GetString(Res.SQL_InvalidPacketSizeValue));
        }
        static internal Exception InvalidSSPIPacketSize() {
            return ADP.Argument(Res.GetString(Res.SQL_InvalidSSPIPacketSize));
        }
        static internal Exception NullEmptyTransactionName() {
            return ADP.Argument(Res.GetString(Res.SQL_NullEmptyTransactionName));
        }
        static internal Exception SnapshotNotSupported(IsolationLevel level) {
            return ADP.Argument(Res.GetString(Res.SQL_SnapshotNotSupported, typeof(IsolationLevel), level.ToString()));
        }
        static internal Exception UserInstanceFailoverNotCompatible() {
            return ADP.Argument(Res.GetString(Res.SQL_UserInstanceFailoverNotCompatible));
        }
        static internal Exception InvalidSQLServerVersionUnknown() {
            return ADP.DataAdapter(Res.GetString(Res.SQL_InvalidSQLServerVersionUnknown));
        }
        static internal Exception SynchronousCallMayNotPend() {
            return new Exception(Res.GetString(Res.Sql_InternalError));
        }
        static internal Exception ConnectionLockedForBcpEvent() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ConnectionLockedForBcpEvent));
        }
        static internal Exception AsyncConnectionRequired() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_AsyncConnectionRequired));
        }
        static internal Exception FatalTimeout() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_FatalTimeout));
        }
        static internal Exception InstanceFailure() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_InstanceFailure));
        }
        static internal Exception ChangePasswordArgumentMissing(string argumentName) {
            return ADP.ArgumentNull(Res.GetString(Res.SQL_ChangePasswordArgumentMissing, argumentName));
        }
        static internal Exception ChangePasswordConflictsWithSSPI() {
            return ADP.Argument(Res.GetString(Res.SQL_ChangePasswordConflictsWithSSPI));
        }
        static internal Exception ChangePasswordRequiresYukon() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ChangePasswordRequiresYukon));
        }
        static internal Exception UnknownSysTxIsolationLevel(SysTx.IsolationLevel isolationLevel) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_UnknownSysTxIsolationLevel, isolationLevel.ToString()));
        }
        static internal Exception ChangePasswordUseOfUnallowedKey (string key) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ChangePasswordUseOfUnallowedKey, key));
        }
        static internal Exception InvalidPartnerConfiguration (string server, string database) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_InvalidPartnerConfiguration, server, database));
        }
        static internal Exception MARSUnspportedOnConnection() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_MarsUnsupportedOnConnection));
        }

        static internal Exception CannotModifyPropertyAsyncOperationInProgress(string property) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_CannotModifyPropertyAsyncOperationInProgress, property));
        }
        static internal Exception NonLocalSSEInstance() {
            return ADP.NotSupported(Res.GetString(Res.SQL_NonLocalSSEInstance));
        }
        //
        // SQL.DataCommand
        //
        static internal Exception NotificationsRequireYukon() {
            return ADP.NotSupported(Res.GetString(Res.SQL_NotificationsRequireYukon));
        }

        static internal ArgumentOutOfRangeException NotSupportedEnumerationValue(Type type, int value) {
            return ADP.ArgumentOutOfRange(Res.GetString(Res.SQL_NotSupportedEnumerationValue, type.Name, value.ToString(System.Globalization.CultureInfo.InvariantCulture)), type.Name);
        }

        static internal ArgumentOutOfRangeException NotSupportedCommandType(CommandType value) {
#if DEBUG
            switch(value) {
            case CommandType.Text:
            case CommandType.StoredProcedure:
                Debug.Assert(false, "valid CommandType " + value.ToString());
                break;
            case CommandType.TableDirect:
                break;
            default:
                Debug.Assert(false, "invalid CommandType " + value.ToString());
                break;
            }
#endif
            return NotSupportedEnumerationValue(typeof(CommandType), (int)value);
        }
        static internal ArgumentOutOfRangeException NotSupportedIsolationLevel(IsolationLevel value) {
#if DEBUG
            switch(value) {
            case IsolationLevel.Unspecified:
            case IsolationLevel.ReadCommitted:
            case IsolationLevel.ReadUncommitted:
            case IsolationLevel.RepeatableRead:
            case IsolationLevel.Serializable:
            case IsolationLevel.Snapshot:
                Debug.Assert(false, "valid IsolationLevel " + value.ToString());
                break;
            case IsolationLevel.Chaos:
                break;
            default:
                Debug.Assert(false, "invalid IsolationLevel " + value.ToString());
                break;
            }
#endif
            return NotSupportedEnumerationValue(typeof(IsolationLevel), (int)value);
        }

        static internal Exception OperationCancelled() {
            Exception exception = ADP.InvalidOperation(Res.GetString(Res.SQL_OperationCancelled));
            return exception;
        }

        static internal Exception PendingBeginXXXExists() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_PendingBeginXXXExists));
        }

        static internal ArgumentOutOfRangeException InvalidSqlDependencyTimeout(string param) {
            return ADP.ArgumentOutOfRange(Res.GetString(Res.SqlDependency_InvalidTimeout), param);
        }

        static internal Exception NonXmlResult() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_NonXmlResult));
        }

        //
        // SQL.DataParameter
        //
        static internal Exception InvalidUdt3PartNameFormat() {
            return ADP.Argument(Res.GetString(Res.SQL_InvalidUdt3PartNameFormat));
        }
        static internal Exception InvalidParameterTypeNameFormat() {
            return ADP.Argument(Res.GetString(Res.SQL_InvalidParameterTypeNameFormat));
        }
        static internal Exception InvalidParameterNameLength(string value) {
            return ADP.Argument(Res.GetString(Res.SQL_InvalidParameterNameLength, value));
        }
        static internal Exception PrecisionValueOutOfRange(byte precision) {
            return ADP.Argument(Res.GetString(Res.SQL_PrecisionValueOutOfRange, precision.ToString(CultureInfo.InvariantCulture)));
        }
        static internal Exception ScaleValueOutOfRange(byte scale) {
            return ADP.Argument(Res.GetString(Res.SQL_ScaleValueOutOfRange, scale.ToString(CultureInfo.InvariantCulture)));
        }
        static internal Exception TimeScaleValueOutOfRange(byte scale) {
            return ADP.Argument(Res.GetString(Res.SQL_TimeScaleValueOutOfRange, scale.ToString(CultureInfo.InvariantCulture)));
        }
        static internal Exception InvalidSqlDbType(SqlDbType value) {
            return ADP.InvalidEnumerationValue(typeof(SqlDbType), (int) value);
        }
        static internal Exception UnsupportedTVPOutputParameter(ParameterDirection direction, string paramName) {
            return ADP.NotSupported(Res.GetString(Res.SqlParameter_UnsupportedTVPOutputParameter, 
                        direction.ToString(), paramName));
        }
        static internal Exception DBNullNotSupportedForTVPValues(string paramName) {
            return ADP.NotSupported(Res.GetString(Res.SqlParameter_DBNullNotSupportedForTVP, paramName));
        }
        static internal Exception InvalidTableDerivedPrecisionForTvp(string columnName, byte precision) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlParameter_InvalidTableDerivedPrecisionForTvp, precision, columnName, System.Data.SqlTypes.SqlDecimal.MaxPrecision));
        }
        static internal Exception UnexpectedTypeNameForNonStructParams(string paramName) {
            return ADP.NotSupported(Res.GetString(Res.SqlParameter_UnexpectedTypeNameForNonStruct, paramName));
        }
        static internal Exception SingleValuedStructNotSupported() {
            return ADP.NotSupported(Res.GetString(Res.MetaType_SingleValuedStructNotSupported));
        }
        static internal Exception ParameterInvalidVariant(string paramName) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ParameterInvalidVariant, paramName));
        }

        static internal Exception MustSetTypeNameForParam(string paramType, string paramName) {
            return ADP.Argument(Res.GetString(Res.SQL_ParameterTypeNameRequired, paramType, paramName));
        }
        static internal Exception NullSchemaTableDataTypeNotSupported(string columnName) {
            return ADP.Argument(Res.GetString(Res.NullSchemaTableDataTypeNotSupported, columnName));
        }
        static internal Exception InvalidSchemaTableOrdinals() {
            return ADP.Argument(Res.GetString(Res.InvalidSchemaTableOrdinals));
        }
        static internal Exception EnumeratedRecordMetaDataChanged(string fieldName, int recordNumber) {
            return ADP.Argument(Res.GetString(Res.SQL_EnumeratedRecordMetaDataChanged, fieldName, recordNumber));
        }
        static internal Exception EnumeratedRecordFieldCountChanged(int recordNumber) {
            return ADP.Argument(Res.GetString(Res.SQL_EnumeratedRecordFieldCountChanged, recordNumber));
        }

        //
        // SQL.SqlDataAdapter
        //

        //
        // SQL.TDSParser
        //
        static internal Exception InvalidTDSVersion() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_InvalidTDSVersion));
        }
        static internal Exception ParsingError() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ParsingError));
        }
        static internal Exception MoneyOverflow(string moneyValue) {
            return ADP.Overflow(Res.GetString(Res.SQL_MoneyOverflow, moneyValue));
        }
        static internal Exception SmallDateTimeOverflow(string datetime) {
            return ADP.Overflow(Res.GetString(Res.SQL_SmallDateTimeOverflow, datetime));
        }
        static internal Exception SNIPacketAllocationFailure() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_SNIPacketAllocationFailure));
        }
        static internal Exception TimeOverflow(string time) {
            return ADP.Overflow(Res.GetString(Res.SQL_TimeOverflow, time));
        }

        //
        // SQL.SqlDataReader
        //
        static internal Exception InvalidRead() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_InvalidRead));
        }

        static internal Exception NonBlobColumn(string columnName) {
            return ADP.InvalidCast(Res.GetString(Res.SQL_NonBlobColumn, columnName));
        }

        static internal Exception NonCharColumn(string columnName) {
            return ADP.InvalidCast(Res.GetString(Res.SQL_NonCharColumn, columnName));
        }

        static internal Exception StreamNotSupportOnColumnType(string columnName) {
            return ADP.InvalidCast(Res.GetString(Res.SQL_StreamNotSupportOnColumnType, columnName));
        }

        static internal Exception TextReaderNotSupportOnColumnType(string columnName) {
            return ADP.InvalidCast(Res.GetString(Res.SQL_TextReaderNotSupportOnColumnType, columnName));
        }

        static internal Exception XmlReaderNotSupportOnColumnType(string columnName) {
            return ADP.InvalidCast(Res.GetString(Res.SQL_XmlReaderNotSupportOnColumnType, columnName));
        }

        static internal Exception UDTUnexpectedResult(string exceptionText){
        	return ADP.TypeLoad(Res.GetString(Res.SQLUDT_Unexpected,exceptionText));
        }


        //
        // SQL.SqlDelegatedTransaction
        //
        static internal Exception CannotCompleteDelegatedTransactionWithOpenResults(Guid conId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(TdsEnums.TIMEOUT_EXPIRED, (byte)0x00, TdsEnums.MIN_ERROR_CLASS, null, (Res.GetString(Res.ADP_OpenReaderExists)), "", 0, TdsEnums.SNI_WAIT_TIMEOUT));
            return SqlException.CreateException(errors, null, conId);
        }
        static internal SysTx.TransactionPromotionException PromotionFailed(Exception inner) {
            SysTx.TransactionPromotionException e = new SysTx.TransactionPromotionException(Res.GetString(Res.SqlDelegatedTransaction_PromotionFailed), inner);
            ADP.TraceExceptionAsReturnValue(e);
            return e;
        }

        //
        // SQL.SqlDependency
        //
        static internal Exception SqlCommandHasExistingSqlNotificationRequest(){
            return ADP.InvalidOperation(Res.GetString(Res.SQLNotify_AlreadyHasCommand));
        }

        static internal Exception SqlDepCannotBeCreatedInProc() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlNotify_SqlDepCannotBeCreatedInProc));
        }

        static internal Exception SqlDepDefaultOptionsButNoStart() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_DefaultOptionsButNoStart));
        }

        static internal Exception SqlDependencyDatabaseBrokerDisabled() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_DatabaseBrokerDisabled));
        }

        static internal Exception SqlDependencyEventNoDuplicate() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_EventNoDuplicate));
        }

        static internal Exception SqlDependencyDuplicateStart() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_DuplicateStart));
        }

        static internal Exception SqlDependencyIdMismatch() {
            // do not include the id because it may require SecurityPermission(Infrastructure) permission
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_IdMismatch));
        }
    
        static internal Exception SqlDependencyNoMatchingServerStart() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_NoMatchingServerStart));
        }

        static internal Exception SqlDependencyNoMatchingServerDatabaseStart() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlDependency_NoMatchingServerDatabaseStart));
        }

        static internal Exception SqlNotificationException(SqlNotificationEventArgs notify){
            return ADP.InvalidOperation(Res.GetString(Res.SQLNotify_ErrorFormat, notify.Type,notify.Info,notify.Source));
        }

        //
        // SQL.SqlMetaData
        //
        static internal Exception SqlMetaDataNoMetaData(){
            return ADP.InvalidOperation(Res.GetString(Res.SqlMetaData_NoMetadata));
        }

        static internal Exception MustSetUdtTypeNameForUdtParams(){
            return ADP.Argument(Res.GetString(Res.SQLUDT_InvalidUdtTypeName));
        }

        static internal Exception UnexpectedUdtTypeNameForNonUdtParams(){
            return ADP.Argument(Res.GetString(Res.SQLUDT_UnexpectedUdtTypeName));
        }

        static internal Exception UDTInvalidSqlType(string typeName){
            return ADP.Argument(Res.GetString(Res.SQLUDT_InvalidSqlType, typeName));
        }

        static internal Exception InvalidSqlDbTypeForConstructor(SqlDbType type) {
            return ADP.Argument(Res.GetString(Res.SqlMetaData_InvalidSqlDbTypeForConstructorFormat, type.ToString()));
        }

        static internal Exception NameTooLong(string parameterName) {
            return ADP.Argument(Res.GetString(Res.SqlMetaData_NameTooLong), parameterName);
        }

        static internal Exception InvalidSortOrder(SortOrder order) {
            return ADP.InvalidEnumerationValue(typeof(SortOrder), (int)order);
        }

        static internal Exception MustSpecifyBothSortOrderAndOrdinal(SortOrder order, int ordinal) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlMetaData_SpecifyBothSortOrderAndOrdinal, order.ToString(), ordinal));
        }

        static internal Exception TableTypeCanOnlyBeParameter() {
            return ADP.Argument(Res.GetString(Res.SQLTVP_TableTypeCanOnlyBeParameter));
        }
        static internal Exception UnsupportedColumnTypeForSqlProvider(string columnName, string typeName) {
            return ADP.Argument(Res.GetString(Res.SqlProvider_InvalidDataColumnType, columnName, typeName));
        }
        static internal Exception InvalidColumnMaxLength(string columnName, long maxLength) {
            return ADP.Argument(Res.GetString(Res.SqlProvider_InvalidDataColumnMaxLength, columnName, maxLength));
        }
        static internal Exception InvalidColumnPrecScale() {
            return ADP.Argument(Res.GetString(Res.SqlMisc_InvalidPrecScaleMessage));
        }
        static internal Exception NotEnoughColumnsInStructuredType() {
            return ADP.Argument(Res.GetString(Res.SqlProvider_NotEnoughColumnsInStructuredType));
        }
        static internal Exception DuplicateSortOrdinal(int sortOrdinal) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlProvider_DuplicateSortOrdinal, sortOrdinal));
        }
        static internal Exception MissingSortOrdinal(int sortOrdinal) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlProvider_MissingSortOrdinal, sortOrdinal));
        }
        static internal Exception SortOrdinalGreaterThanFieldCount(int columnOrdinal, int sortOrdinal) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlProvider_SortOrdinalGreaterThanFieldCount, sortOrdinal, columnOrdinal));
        }
        static internal Exception IEnumerableOfSqlDataRecordHasNoRows() {
            return ADP.Argument(Res.GetString(Res.IEnumerableOfSqlDataRecordHasNoRows));
        }
        

        
        //
        //  SqlPipe
        //
        static internal Exception SqlPipeCommandHookedUpToNonContextConnection() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlPipe_CommandHookedUpToNonContextConnection));
        }

        static internal Exception SqlPipeMessageTooLong( int messageLength ) {
            return ADP.Argument(Res.GetString(Res.SqlPipe_MessageTooLong, messageLength));
        }
        
        static internal Exception SqlPipeIsBusy() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlPipe_IsBusy));
        }

        static internal Exception SqlPipeAlreadyHasAnOpenResultSet( string methodName ) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlPipe_AlreadyHasAnOpenResultSet, methodName));
        }

        static internal Exception SqlPipeDoesNotHaveAnOpenResultSet( string methodName ) {
            return ADP.InvalidOperation(Res.GetString(Res.SqlPipe_DoesNotHaveAnOpenResultSet, methodName));
        }

        //
        // : ISqlResultSet
        //
        static internal Exception SqlResultSetClosed(string methodname) {
            if (methodname == null) {
                return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlResultSetClosed2));
            }
            return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlResultSetClosed, methodname));
        }
        static internal Exception SqlResultSetNoData(string methodname) {
            return ADP.InvalidOperation(Res.GetString(Res.ADP_DataReaderNoData, methodname));
        }
        static internal Exception SqlRecordReadOnly(string methodname) {
            if (methodname == null) {
                return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlRecordReadOnly2));
            }
            return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlRecordReadOnly, methodname));
        }

        static internal Exception SqlResultSetRowDeleted(string methodname) {
            if (methodname == null) {
                return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlResultSetRowDeleted2));
            }
            return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlResultSetRowDeleted, methodname));
        }

        static internal Exception SqlResultSetCommandNotInSameConnection() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlResultSetCommandNotInSameConnection));
        }

        static internal Exception SqlResultSetNoAcceptableCursor() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_SqlResultSetNoAcceptableCursor));
        }

        //
        // SQL.BulkLoad
        //
        static internal Exception BulkLoadMappingInaccessible() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadMappingInaccessible));
        }
        static internal Exception BulkLoadMappingsNamesOrOrdinalsOnly() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadMappingsNamesOrOrdinalsOnly));
        }
        static internal Exception BulkLoadCannotConvertValue(Type sourcetype, MetaType metatype, Exception e) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadCannotConvertValue, sourcetype.Name, metatype.TypeName), e);
        }
        static internal Exception BulkLoadNonMatchingColumnMapping() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadNonMatchingColumnMapping));
        }
        static internal Exception BulkLoadNonMatchingColumnName(string columnName) {
            return BulkLoadNonMatchingColumnName(columnName, null);
        }
        static internal Exception BulkLoadNonMatchingColumnName(string columnName, Exception e) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadNonMatchingColumnName, columnName), e);
        }
        static internal Exception BulkLoadStringTooLong() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadStringTooLong));
        }
        static internal Exception BulkLoadInvalidVariantValue() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadInvalidVariantValue));
        }
        static internal Exception BulkLoadInvalidTimeout(int timeout) {
            return ADP.Argument(Res.GetString(Res.SQL_BulkLoadInvalidTimeout, timeout.ToString(CultureInfo.InvariantCulture)));
        }
        static internal Exception BulkLoadExistingTransaction() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadExistingTransaction));
        }
        static internal Exception BulkLoadNoCollation() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadNoCollation));
        }
        static internal Exception BulkLoadConflictingTransactionOption() {
            return ADP.Argument(Res.GetString(Res.SQL_BulkLoadConflictingTransactionOption));
        }
        static internal Exception BulkLoadLcidMismatch(int sourceLcid, string sourceColumnName, int destinationLcid, string destinationColumnName) {
            return ADP.InvalidOperation (Res.GetString (Res.Sql_BulkLoadLcidMismatch, sourceLcid, sourceColumnName, destinationLcid, destinationColumnName));
        }
        static internal Exception InvalidOperationInsideEvent() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadInvalidOperationInsideEvent));
        }
        static internal Exception BulkLoadMissingDestinationTable() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadMissingDestinationTable));
        }
        static internal Exception BulkLoadInvalidDestinationTable(string tableName, Exception inner) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadInvalidDestinationTable, tableName), inner);
        }
        static internal Exception BulkLoadBulkLoadNotAllowDBNull(string columnName) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadNotAllowDBNull, columnName));
        }
        static internal Exception BulkLoadPendingOperation() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BulkLoadPendingOperation));
        }

        //
        // transactions.
        //
        static internal Exception ConnectionDoomed() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ConnectionDoomed));
        }

        static internal Exception OpenResultCountExceeded() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_OpenResultCountExceeded));
        }

        static internal readonly byte[] AttentionHeader = new byte[] {
            TdsEnums.MT_ATTN,               // Message Type
            TdsEnums.ST_EOM,                // Status
            TdsEnums.HEADER_LEN >> 8,       // length - upper byte
            TdsEnums.HEADER_LEN & 0xff,     // length - lower byte
            0,                              // spid
            0,                              // spid
            0,                              // packet (out of band)
            0                               // window
        };

        //
        // MultiSubnetFailover
        //

        /// <summary>
        /// used to block two scenarios if MultiSubnetFailover is true: 
        /// * server-provided failover partner - raising SqlException in this case
        /// * connection string with failover partner and MultiSubnetFailover=true - rasing argument one in this case with the same message
        /// </summary>
        static internal Exception MultiSubnetFailoverWithFailoverPartner(bool serverProvidedFailoverPartner, Guid conId) {
            string msg = Res.GetString(Res.SQLMSF_FailoverPartnerNotSupported);
            if (serverProvidedFailoverPartner) {
                // VSTFDEVDIV\DevDiv2\179041 - replacing InvalidOperation with SQL exception
                SqlErrorCollection errors = new SqlErrorCollection();
                errors.Add(new SqlError(0, (byte)0x00, TdsEnums.FATAL_ERROR_CLASS, null, msg, "", 0));
                SqlException exc = SqlException.CreateException(errors, null, conId);
                exc._doNotReconnect = true; // disable open retry logic on this error
                return exc;
            }
            else {
                return ADP.Argument(msg);
            }
        }

        static internal Exception MultiSubnetFailoverWithMoreThan64IPs() {
            string msg = GetSNIErrorMessage((int)SNINativeMethodWrapper.SniSpecialErrors.MultiSubnetFailoverWithMoreThan64IPs);
            return ADP.InvalidOperation(msg);
        }

        static internal Exception MultiSubnetFailoverWithInstanceSpecified() {
            string msg = GetSNIErrorMessage((int)SNINativeMethodWrapper.SniSpecialErrors.MultiSubnetFailoverWithInstanceSpecified);
            return ADP.Argument(msg);
        }

        static internal Exception MultiSubnetFailoverWithNonTcpProtocol() {
            string msg = GetSNIErrorMessage((int)SNINativeMethodWrapper.SniSpecialErrors.MultiSubnetFailoverWithNonTcpProtocol);
            return ADP.Argument(msg);
        }

        //
        // Read-only routing
        //

        static internal Exception ROR_FailoverNotSupportedConnString() {
            return ADP.Argument(Res.GetString(Res.SQLROR_FailoverNotSupported));            
        }

        static internal Exception ROR_FailoverNotSupportedServer(Guid conId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, (byte)0x00, TdsEnums.FATAL_ERROR_CLASS, null, (Res.GetString(Res.SQLROR_FailoverNotSupported)), "", 0));
            SqlException exc = SqlException.CreateException(errors, null, conId);
            exc._doNotReconnect = true;
            return exc;
        }

        static internal Exception ROR_RecursiveRoutingNotSupported(Guid conId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, (byte)0x00, TdsEnums.FATAL_ERROR_CLASS, null, (Res.GetString(Res.SQLROR_RecursiveRoutingNotSupported)), "", 0));
            SqlException exc=SqlException.CreateException(errors, null, conId);
            exc._doNotReconnect = true;
            return exc;
        }

        static internal Exception ROR_UnexpectedRoutingInfo(Guid conId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, (byte)0x00, TdsEnums.FATAL_ERROR_CLASS, null, (Res.GetString(Res.SQLROR_UnexpectedRoutingInfo)), "", 0));
            SqlException exc = SqlException.CreateException(errors, null, conId);
            exc._doNotReconnect = true;
            return exc;
        }

        static internal Exception ROR_InvalidRoutingInfo(Guid conId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, (byte)0x00, TdsEnums.FATAL_ERROR_CLASS, null, (Res.GetString(Res.SQLROR_InvalidRoutingInfo)), "", 0));
            SqlException exc = SqlException.CreateException(errors, null, conId);
            exc._doNotReconnect = true;
            return exc;
        }

        static internal Exception ROR_TimeoutAfterRoutingInfo(Guid conId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, (byte)0x00, TdsEnums.FATAL_ERROR_CLASS, null, (Res.GetString(Res.SQLROR_TimeoutAfterRoutingInfo)), "", 0));
            SqlException exc = SqlException.CreateException(errors, null, conId);
            exc._doNotReconnect = true;
            return exc;
        }

        //
        // Connection resiliency
        //
        static internal SqlException CR_ReconnectTimeout() {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(TdsEnums.TIMEOUT_EXPIRED, (byte)0x00, TdsEnums.MIN_ERROR_CLASS, null, SQLMessage.Timeout(), "", 0, TdsEnums.SNI_WAIT_TIMEOUT));
            SqlException exc = SqlException.CreateException(errors, "");
            return exc;
        }

        static internal SqlException CR_ReconnectionCancelled() {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.MIN_ERROR_CLASS, null, SQLMessage.OperationCancelled(), "", 0));
            SqlException exc = SqlException.CreateException(errors, "");
            return exc;
        }

        static internal Exception CR_NextAttemptWillExceedQueryTimeout(SqlException innerException, Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.MIN_ERROR_CLASS, null, Res.GetString(Res.SQLCR_NextAttemptWillExceedQueryTimeout), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId, innerException);
            return exc;
        }
        
        static internal Exception CR_EncryptionChanged( Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.FATAL_ERROR_CLASS, null, Res.GetString(Res.SQLCR_EncryptionChanged), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId);
            return exc;
        }

        static internal SqlException CR_AllAttemptsFailed(SqlException innerException, Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.MIN_ERROR_CLASS, null, Res.GetString(Res.SQLCR_AllAttemptsFailed), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId, innerException);
            return exc;
        }

        static internal SqlException CR_NoCRAckAtReconnection(Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.FATAL_ERROR_CLASS, null, Res.GetString(Res.SQLCR_NoCRAckAtReconnection), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId);
            return exc;
        }

        static internal SqlException CR_TDSVersionNotPreserved(Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.FATAL_ERROR_CLASS, null, Res.GetString(Res.SQLCR_TDSVestionNotPreserved), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId);
            return exc;
        }

        static internal SqlException CR_UnrecoverableServer(Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.FATAL_ERROR_CLASS, null, Res.GetString(Res.SQLCR_UnrecoverableServer), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId);
            return exc;
        }

        static internal SqlException CR_UnrecoverableClient(Guid connectionId) {
            SqlErrorCollection errors = new SqlErrorCollection();
            errors.Add(new SqlError(0, 0, TdsEnums.FATAL_ERROR_CLASS, null, Res.GetString(Res.SQLCR_UnrecoverableClient), "", 0));
            SqlException exc = SqlException.CreateException(errors, "", connectionId);
            return exc;
        }

        //
        // Merged Provider
        //
        static internal Exception BatchedUpdatesNotAvailableOnContextConnection() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_BatchedUpdatesNotAvailableOnContextConnection));
        }
        static internal Exception ContextAllowsLimitedKeywords() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ContextAllowsLimitedKeywords));
        } 
        static internal Exception ContextAllowsOnlyTypeSystem2005() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ContextAllowsOnlyTypeSystem2005));
        }         
        static internal Exception ContextConnectionIsInUse() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ContextConnectionIsInUse));
        }
        static internal Exception ContextUnavailableOutOfProc() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ContextUnavailableOutOfProc));
        }
        static internal Exception ContextUnavailableWhileInProc() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_ContextUnavailableWhileInProc));
        }
        static internal Exception NestedTransactionScopesNotSupported() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_NestedTransactionScopesNotSupported));
        }        
        static internal Exception NotAvailableOnContextConnection() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_NotAvailableOnContextConnection));
        }
        static internal Exception NotificationsNotAvailableOnContextConnection() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_NotificationsNotAvailableOnContextConnection));
        }
        static internal Exception UnexpectedSmiEvent(Microsoft.SqlServer.Server.SmiEventSink_Default.UnexpectedEventType eventType) {
            Debug.Assert(false, "UnexpectedSmiEvent: "+eventType.ToString());    // Assert here, because these exceptions will most likely be eaten by the server.
            return ADP.InvalidOperation(Res.GetString(Res.SQL_UnexpectedSmiEvent, (int)eventType));
        }
        static internal Exception UserInstanceNotAvailableInProc() {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_UserInstanceNotAvailableInProc));
        }
        static internal Exception ArgumentLengthMismatch( string arg1, string arg2 ) {
            return ADP.Argument( Res.GetString( Res.SQL_ArgumentLengthMismatch, arg1, arg2 ) );
        }
        static internal Exception InvalidSqlDbTypeOneAllowedType( SqlDbType invalidType, string method, SqlDbType allowedType ) {
            return ADP.Argument( Res.GetString( Res.SQL_InvalidSqlDbTypeWithOneAllowedType, invalidType, method, allowedType ) );
        }
        static internal Exception SqlPipeErrorRequiresSendEnd( ) {
            return ADP.InvalidOperation(Res.GetString(Res.SQL_PipeErrorRequiresSendEnd));
        }
        static internal Exception TooManyValues(string arg) {
            return ADP.Argument(Res.GetString(Res.SQL_TooManyValues), arg);
        }
        static internal Exception StreamWriteNotSupported() {
            return ADP.NotSupported(Res.GetString(Res.SQL_StreamWriteNotSupported));
        }
        static internal Exception StreamReadNotSupported() {
            return ADP.NotSupported(Res.GetString(Res.SQL_StreamReadNotSupported));
        }
        static internal Exception StreamSeekNotSupported() {
            return ADP.NotSupported(Res.GetString(Res.SQL_StreamSeekNotSupported));
        }
        static internal System.Data.SqlTypes.SqlNullValueException SqlNullValue() {
            System.Data.SqlTypes.SqlNullValueException e = new System.Data.SqlTypes.SqlNullValueException();
            ADP.TraceExceptionAsReturnValue(e);
            return e;
        }
        // SQLBU 402363: Exception to prevent Parameter.Size data corruption case from working.
        //  This should be temporary until changing to correct behavior can be safely implemented.
        static internal Exception ParameterSizeRestrictionFailure(int index) {
            return ADP.InvalidOperation(Res.GetString(Res.OleDb_CommandParameterError, index.ToString(CultureInfo.InvariantCulture), "SqlParameter.Size"));
        }
        static internal Exception SubclassMustOverride() {
            return ADP.InvalidOperation(Res.GetString(Res.SqlMisc_SubclassMustOverride));
        }

        /// <summary>
        /// gets a message for SNI error (sniError must be valid, non-zero error code)
        /// </summary>
        static internal string GetSNIErrorMessage(int sniError) {
            Debug.Assert(sniError > 0 && sniError <= (int)SNINativeMethodWrapper.SniSpecialErrors.MaxErrorValue, "SNI error is out of range");

            string errorMessageId = String.Format((IFormatProvider)null, "SNI_ERROR_{0}", sniError);
            return Res.GetString(errorMessageId);
        }

        // BulkLoad
        internal const string WriteToServer = "WriteToServer";

        // Default values for SqlDependency and SqlNotificationRequest
        internal const int SqlDependencyTimeoutDefault = 0;
        internal const int SqlDependencyServerTimeout  = 5 * 24 * 3600; // 5 days - used to compute default TTL of the dependency
        internal const string SqlNotificationServiceDefault         = "SqlQueryNotificationService";
        internal const string SqlNotificationStoredProcedureDefault = "SqlQueryNotificationStoredProcedure";

         // constant strings
        internal const string Transaction= "Transaction";
        internal const string Connection = "Connection";
    }

    sealed internal class SQLMessage {

        // 

        private SQLMessage() { /* prevent utility class from being insantiated*/ }

        // The class SQLMessage defines the error messages that are specific to the SqlDataAdapter
        // that are caused by a netlib error.  The functions will be called and then return the
        // appropriate error message from the resource Framework.txt.  The SqlDataAdapter will then
        // take the error message and then create a SqlError for the message and then place
        // that into a SqlException that is either thrown to the user or cached for throwing at
        // a later time.  This class is used so that there will be compile time checking of error
        // messages.  The resource Framework.txt will ensure proper string text based on the appropriate
        // locale.

        static internal string CultureIdError() {
            return Res.GetString(Res.SQL_CultureIdError);
        }
        static internal string EncryptionNotSupportedByClient() {
            return Res.GetString(Res.SQL_EncryptionNotSupportedByClient);
        }
        static internal string EncryptionNotSupportedByServer() {
            return Res.GetString(Res.SQL_EncryptionNotSupportedByServer);
        }
        static internal string OperationCancelled() {
            return Res.GetString(Res.SQL_OperationCancelled);
        }
        static internal string SevereError() {
            return Res.GetString(Res.SQL_SevereError);
        }
        static internal string SSPIInitializeError() {
            return Res.GetString(Res.SQL_SSPIInitializeError);
        }
        static internal string SSPIGenerateError() {
            return Res.GetString(Res.SQL_SSPIGenerateError);
        }
        static internal string Timeout() {
            return Res.GetString(Res.SQL_Timeout);
        }
        static internal string Timeout_PreLogin_Begin() {
            return Res.GetString(Res.SQL_Timeout_PreLogin_Begin);
        }
        static internal string Timeout_PreLogin_InitializeConnection() {
            return Res.GetString(Res.SQL_Timeout_PreLogin_InitializeConnection);
        }
        static internal string Timeout_PreLogin_SendHandshake() {
            return Res.GetString(Res.SQL_Timeout_PreLogin_SendHandshake);
        }
        static internal string Timeout_PreLogin_ConsumeHandshake() {
            return Res.GetString(Res.SQL_Timeout_PreLogin_ConsumeHandshake);
        }
        static internal string Timeout_Login_Begin() {
            return Res.GetString(Res.SQL_Timeout_Login_Begin);
        }
        static internal string Timeout_Login_ProcessConnectionAuth() {
            return Res.GetString(Res.SQL_Timeout_Login_ProcessConnectionAuth);
        }
        static internal string Timeout_PostLogin() {
            return Res.GetString(Res.SQL_Timeout_PostLogin);
        }
        static internal string Timeout_FailoverInfo() {
            return Res.GetString(Res.SQL_Timeout_FailoverInfo);
        }
        static internal string Timeout_RoutingDestination() {
            return Res.GetString(Res.SQL_Timeout_RoutingDestinationInfo);
        }
        static internal string Duration_PreLogin_Begin(long PreLoginBeginDuration) {
            return Res.GetString(Res.SQL_Duration_PreLogin_Begin, PreLoginBeginDuration);
        }
        static internal string Duration_PreLoginHandshake(long PreLoginBeginDuration, long PreLoginHandshakeDuration) {
            return Res.GetString(Res.SQL_Duration_PreLoginHandshake, PreLoginBeginDuration, PreLoginHandshakeDuration);
        }
        static internal string Duration_Login_Begin(long PreLoginBeginDuration, long PreLoginHandshakeDuration, long LoginBeginDuration) {
            return Res.GetString(Res.SQL_Duration_Login_Begin, PreLoginBeginDuration, PreLoginHandshakeDuration, LoginBeginDuration);
        }
        static internal string Duration_Login_ProcessConnectionAuth(long PreLoginBeginDuration, long PreLoginHandshakeDuration, long LoginBeginDuration, long LoginAuthDuration) {
            return Res.GetString(Res.SQL_Duration_Login_ProcessConnectionAuth, PreLoginBeginDuration, PreLoginHandshakeDuration, LoginBeginDuration, LoginAuthDuration);
        }
        static internal string Duration_PostLogin(long PreLoginBeginDuration, long PreLoginHandshakeDuration, long LoginBeginDuration, long LoginAuthDuration, long PostLoginDuration) {
            return Res.GetString(Res.SQL_Duration_PostLogin, PreLoginBeginDuration, PreLoginHandshakeDuration, LoginBeginDuration, LoginAuthDuration, PostLoginDuration);
        }
        static internal string UserInstanceFailure() {
            return Res.GetString(Res.SQL_UserInstanceFailure);
        }
        static internal string PreloginError() {
            return Res.GetString(Res.Snix_PreLogin);
        }
    }

    /// <summary>
    /// This class holds helper methods to escape Microsoft SQL Server identifiers, such as table, schema, database or other names
    /// </summary>
    static internal class SqlServerEscapeHelper {

        /// <summary>
        /// Escapes the identifier with square brackets. The input has to be in unescaped form, like the parts received from MultipartIdentifier.ParseMultipartIdentifier.
        /// </summary>
        /// <param name="name">name of the identifier, in unescaped form</param>
        /// <returns>escapes the name with [], also escapes the last close bracket with double-bracket</returns>
        static internal string EscapeIdentifier(string name) {
            Debug.Assert(!ADP.IsEmpty(name), "null or empty identifiers are not allowed");
            return "[" + name.Replace("]", "]]") + "]";
        }

        /// <summary>
        /// Same as above EscapeIdentifier, except that output is written into StringBuilder
        /// </summary>
        static internal void EscapeIdentifier(StringBuilder builder, string name) {
            Debug.Assert(builder != null, "builder cannot be null");
            Debug.Assert(!ADP.IsEmpty(name), "null or empty identifiers are not allowed");

            builder.Append("[");
            builder.Append(name.Replace("]", "]]"));
            builder.Append("]");
        }

        /// <summary>
        ///  Escape a string to be used inside TSQL literal, such as N'somename' or 'somename'
        /// </summary>
        static internal string EscapeStringAsLiteral(string input) {
            Debug.Assert(input != null, "input string cannot be null");
            return input.Replace("'", "''");
        }

        /// <summary>
        /// Escape a string as a TSQL literal, wrapping it around with single quotes.
        /// Use this method to escape input strings to prevent SQL injection 
        /// and to get correct behavior for embedded quotes.
        /// </summary>
        /// <param name="input">unescaped string</param>
        /// <returns>escaped and quoted literal string</returns>
        static internal string MakeStringLiteral(string input) {
            if (ADP.IsEmpty(input)) {
                return "''";
            }
            else {
                return "'" + EscapeStringAsLiteral(input) + "'";
            }
        }
    }
}//namespace
