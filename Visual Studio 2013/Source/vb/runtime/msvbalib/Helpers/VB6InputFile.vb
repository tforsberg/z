'*****************************************************************************/
'* VB6InputFile.vb
'*
'*  Copyright (C) Microsoft Corporation.  All Rights Reserved.
'*  Information Contained Herein Is Proprietary and Confidential.
'*
'* Purpose:
'*  Represents a read/write file
'*
'*****************************************************************************/

Imports System
Imports System.Security
Imports System.Globalization
Imports System.IO
Imports System.Text

Imports Microsoft.VisualBasic.CompilerServices.ExceptionUtils
Imports Microsoft.VisualBasic.CompilerServices.Utils

Namespace Microsoft.VisualBasic.CompilerServices

#Region " BACKWARDS COMPATIBILITY "

    'WARNING WARNING WARNING WARNING WARNING
    'This code exists to support Everett compiled applications.  Make sure you understand
    'the backwards compatibility ramifications of any edit you make in this region.
    'WARNING WARNING WARNING WARNING WARNING

    <System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)> _
    Friend Class VB6InputFile

        '============================================================================
        ' Declarations
        '============================================================================

        Inherits VB6File

#If 0 Then
        const int rgchFileInTerm[4][5][FIN_NUMTERMCHAR] = {
          // Line input separators
          {
            {CR, 0, 0, 0, 0, 0},    // LIXSBCS
            {CR, 0, 0, 0, 0, 0},    // LIXJapan
            {CR, 0, 0, 0, 0, 0},    // LIXKorea
            {CR, 0, 0, 0, 0, 0},    // LIXTaiwan
            {CR, 0, 0, 0, 0, 0},    // LIXPRC
          },

          // Quoted string separators
          {
            {'"', 0, 0, 0, 0, 0 },			    // LIXSBCS  
            {'"', achQuoteDoubleCloseJapan, 0, 0, 0, 0 },   // LIXJapan 
            {'"', achQuoteDoubleCloseKorea, 0, 0, 0, 0 },   // LIXKorea 
            {'"', achQuoteDoubleCloseTaiwan, 0, 0, 0, 0 },  // LIXTaiwan
            {'"', achQuoteDoubleClosePRC, 0, 0, 0, 0 },	    // LIXPRC   
          },

          // Comma-delimited list separators
          {
            {',', CR, 0, 0, 0, 0 },       // LIXSBCS  
            {',', CR, achCommaJapan, 0, 0, 0 },   // LIXJapan 
            {',', CR, achCommaKorea, 0, 0, 0 },   // LIXKorea 
            {',', CR, achCommaTaiwan, 0, 0, 0 },  // LIXTaiwan
            {',', CR, achCommaPRC, 0, 0, 0 },     // LIXPRC   
          },

          // Number separators
          {
            {' ', ',', '\t', CR, 0, 0 },                // LIXSBCS  
            {' ', ',', '\t', achCommaJapan, achSpaceJapan, CR },    // LIXJapan 
            {' ', ',', '\t', achCommaKorea, achSpaceKorea, CR },    // LIXKorea 
            {' ', ',', '\t', achCommaTaiwan, achSpaceTaiwan, CR },  // LIXTaiwan
            {' ', ',', '\t', achCommaPRC, achSpacePRC, CR }     // LIXPRC   
          }
        };
#End If



        '============================================================================
        ' Constructor
        '============================================================================
        Public Sub New(ByVal FileName As String, ByVal share As OpenShare)
            MyBase.New(FileName, OpenAccess.Read, share, -1)
        End Sub



        '============================================================================
        ' Operations
        '============================================================================
        Friend Overrides Sub OpenFile()
            Try
                m_file = New FileStream(m_sFullPath, FileMode.Open, CType(m_access, FileAccess), CType(m_share, FileShare))
            Catch ex As FileNotFoundException
                Throw VbMakeException(ex, vbErrors.FileNotFound)
            Catch ex As SecurityException
                Throw VbMakeException(vbErrors.FileNotFound)
            Catch ex As DirectoryNotFoundException
                Throw VbMakeException(ex, vbErrors.PathNotFound)
            Catch ex As IOException
                Throw VbMakeException(ex, vbErrors.PathFileAccess)
            Catch ex As StackOverflowException
                Throw ex
            Catch ex As OutOfMemoryException
                Throw ex
            Catch ex As System.Threading.ThreadAbortException
                Throw ex
            Catch ex As Exception
                Throw VbMakeException(ex, vbErrors.PathNotFound)
            End Try

            m_Encoding = GetFileIOEncoding()
            m_sr = New StreamReader(m_file, m_Encoding, False, 128)
            m_eof = (m_file.Length = 0)  'Don't do a Peek here or it will buffer data, causing side-effects with the Lock function.
        End Sub



        Public Function ReadLine() As String
            Dim s As String
            s = m_sr.ReadLine()
            Diagnostics.Debug.Assert(Not m_Encoding Is Nothing)
            m_position += m_Encoding.GetByteCount(s) + 2
            'It appears that no one is calling this function. It has returned nothing
            ' since it was created, so keep it that way for compatibility reasons.
            Return Nothing
        End Function



        Friend Overrides Function CanInput() As Boolean
            Return True
        End Function



        Friend Overrides Function EOF() As Boolean
            Return m_eof
        End Function



        Public Overrides Function GetMode() As OpenMode
            Return OpenMode.Input
        End Function



        Friend Function ParseInputString(ByRef sInput As String) As Object
            ParseInputString = sInput

            '  variant must have last character as a pound sign
            '  that is different than the first
            If sInput.Chars(0) = CChar("#") AndAlso sInput.Length <> 1 Then
                '  isolate the string between the pound signs
                sInput = sInput.Substring(1, sInput.Length - 2)

                '  test for fixed string values first
                '  VT_EMPTY is not converted
                If sInput = "NULL" Then
                    ParseInputString = DBNull.Value
                ElseIf sInput = "TRUE" Then
                    ParseInputString = CObj(True)
                ElseIf sInput = "FALSE" Then
                    ParseInputString = CObj(False)
                ElseIf Left(sInput, 6) = "ERROR " Then
                    '   parse I4 value after "ERROR " string
                    Dim errValue As Integer

                    If sInput.Length > 6 Then
                        errValue = IntegerType.FromString(Mid(sInput, 7))
                    End If

                    ' error value is assigned to the input string for now
                    ParseInputString = errValue

                    '  test for date variant.  Note, input always uses the
                    '    universal date format; so use english LCID (0x40) for
                    '    coercion.
                    ' CALENDAR_SUPPORT
                Else
                    Try
                        ParseInputString = System.DateTime.Parse(ToHalfwidthNumbers(sInput, GetCultureInfo()))
                    Catch ex As StackOverflowException
                        Throw ex
                    Catch ex As OutOfMemoryException
                        Throw ex
                    Catch ex As System.Threading.ThreadAbortException
                        Throw ex
                    Catch e As Exception
                    End Try
                End If
            End If
        End Function



        '======================================
        ' Input
        '======================================
        <SecurityCritical()> _
        Friend Overloads Overrides Sub Input(ByRef obj As Object)
            Dim lChar As Integer
            Dim sField As String

            lChar = SkipWhiteSpaceEOF() 'Skip over leading whitespace

            If lChar = lchDoubleQuote Then
                lChar = m_sr.Read()
                m_position += 1

                obj = ReadInField(FIN_QSTRING)
                SkipTrailingWhiteSpace()
            ElseIf lChar = lchPound Then
                obj = ParseInputString(InputStr())
            Else
                sField = ReadInField(FIN_NUMBER)
                obj = ParseInputField(sField, VariantType.Empty)
                SkipTrailingWhiteSpace()
            End If
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Boolean)
            Value = BooleanType.FromObject(ParseInputString(InputStr()))
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Byte)
            Value = ByteType.FromObject(InputNum(VariantType.Byte))
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Short)
            Value = ShortType.FromObject(InputNum(VariantType.Short))
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Integer)
            Value = IntegerType.FromObject(InputNum(VariantType.Integer))
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Long)
            Value = LongType.FromObject(InputNum(VariantType.Long))
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Char)
            Dim s As String = InputStr()

            If s.Length > 0 Then
                Value = s.Chars(0)
            Else
                Value = ControlChars.NullChar
            End If
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Single)
            Value = SingleType.FromObject(InputNum(VariantType.Single), GetInvariantCultureInfo().NumberFormat)
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Double)
            Value = DoubleType.FromObject(InputNum(VariantType.Double), GetInvariantCultureInfo().NumberFormat)
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Decimal)
            Value = DecimalType.FromObject(InputNum(VariantType.Decimal), GetInvariantCultureInfo().NumberFormat)
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As String)
            Value = InputStr()
        End Sub



        Friend Overloads Overrides Sub Input(ByRef Value As Date)
            Value = DateType.FromObject(ParseInputString(InputStr()))
        End Sub



        Friend Overrides Function LOC() As Long
            'This calculation depends on the buffersize of the FileStream 
            'object, any changes in the urt classes could screw this up
            ' The FileStream is used by the StreamReader, which reads ahead
            ' into the 128 byte buffer specified when the StreamReader was created
            ' The m_file.Position is where the reader has read to, not the vb user
            'm_position tracks where the vb user has read to.
            Return ((m_position + 127) \ 128)
        End Function

    End Class

#End Region

End Namespace
