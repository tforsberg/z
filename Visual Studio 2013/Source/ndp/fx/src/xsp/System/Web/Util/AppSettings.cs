//------------------------------------------------------------------------------
// <copyright file="AppSettings.cs" company="Microsoft">
//     Copyright (c) Microsoft Corporation.  All rights reserved.
// </copyright>
//------------------------------------------------------------------------------

// AppSettings.cs
//

using System;
using System.Collections.Specialized;
using System.Configuration;
using System.Diagnostics.CodeAnalysis;
using System.Security.Permissions;
using System.Web.Configuration;
using System.Web.Hosting;

namespace System.Web.Util {

    internal static class AppSettings
    {
        private static volatile bool _settingsInitialized = false;
        private static object _appSettingsLock = new object();
        private static void EnsureSettingsLoaded() {

            if (!_settingsInitialized) {
                lock (_appSettingsLock) {
                    if (!_settingsInitialized) {

                        NameValueCollection settings = null;

                        try {
                            settings = GetAppSettingsSection();
                        } finally {
            
                            // GetApplicationPathData may throw.  That's fine.  Let the user see the exception
                            // once, but just fall back on default settings for the future.
                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseHostHeaderForRequestUrl"], out _useHostHeaderForRequestUrl))
                                _useHostHeaderForRequestUrl = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:AllowAnonymousImpersonation"], out _allowAnonymousImpersonation))
                                _allowAnonymousImpersonation = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:ScriptResourceAllowNonJsFiles"], out _scriptResourceAllowNonJsFiles))
                                _scriptResourceAllowNonJsFiles = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseLegacyEncryption"], out _useLegacyEncryption))
                                _useLegacyEncryption = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseLegacyMachineKeyEncryption"], out _useLegacyMachineKeyEncryption))
                                _useLegacyMachineKeyEncryption = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseLegacyFormsAuthenticationTicketCompatibility"], out _useLegacyFormsAuthenticationTicketCompatibility))
                                _useLegacyFormsAuthenticationTicketCompatibility = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseLegacyEventValidationCompatibility"], out _useLegacyEventValidationCompatibility))
                                _useLegacyEventValidationCompatibility = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:AllowRelaxedHttpUserName"], out _allowRelaxedHttpUserName))
                                _allowRelaxedHttpUserName = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:JavaScriptDoNotEncodeAmpersand"], out _javaScriptDoNotEncodeAmpersand))
                                _javaScriptDoNotEncodeAmpersand = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseTaskFriendlySynchronizationContext"], out _useTaskFriendlySynchronizationContext))
                                _useTaskFriendlySynchronizationContext = (BinaryCompatibility.Current.TargetsAtLeastFramework45) ? true : false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:AllowAsyncDuringSyncStages"], out _allowAsyncDuringSyncStages))
                                _allowAsyncDuringSyncStages = false;

                            if (settings == null || !int.TryParse(settings["aspnet:MaxHttpCollectionKeys"], out _maxHttpCollectionKeys) || _maxHttpCollectionKeys < 0)
                                _maxHttpCollectionKeys = DefaultMaxHttpCollectionKeys;

                            if (settings == null || !int.TryParse(settings["aspnet:MaxJsonDeserializerMembers"], out _maxJsonDeserializerMembers) || _maxJsonDeserializerMembers < 0)
                                _maxJsonDeserializerMembers = DefaultMaxJsonDeserializerMembers;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:DoNotDisposeSpecialHttpApplicationInstances"], out _doNotDisposeSpecialHttpApplicationInstances))
                                _doNotDisposeSpecialHttpApplicationInstances = false;

                            if (settings != null)
                                _formsAuthReturnUrlVar = settings["aspnet:FormsAuthReturnUrlVar"];
            
                            if (settings == null || !Boolean.TryParse(settings["aspnet:RestrictXmlControls"], out _restrictXmlControls))
                                _restrictXmlControls = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:AllowRelaxedRelativeUrl"], out _allowRelaxedRelativeUrl))
                                _allowRelaxedRelativeUrl = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:UseLegacyRequestUrlGeneration"], out _useLegacyRequestUrlGeneration))
                                _useLegacyRequestUrlGeneration = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:AllowUtf7RequestContentEncoding"], out _allowUtf7RequestContentEncoding))
                                _allowUtf7RequestContentEncoding = false;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:AllowRelaxedUnicodeDecoding"], out _allowRelaxedUnicodeDecoding))
                                _allowRelaxedUnicodeDecoding = false;

                            if (settings == null || !int.TryParse(settings["aspnet:UpdatePanelMaxScriptLength"], out _updatePanelMaxScriptLength) || _updatePanelMaxScriptLength < 0)
                                _updatePanelMaxScriptLength = 0;
                            
                            // AppSettings override allows users to build against 4.5 but run against 4.0 or 4.5
                            if (settings == null || !int.TryParse(settings["aspnet:MaxConcurrentCompilations"], out _maxConcurrentCompilations) || _maxConcurrentCompilations < 0) {
                                CompilationSection config = MTConfigUtil.GetCompilationAppConfig();
                                _maxConcurrentCompilations = config.MaxConcurrentCompilations;
                            }
                            if (_maxConcurrentCompilations <= 0) {
                                _maxConcurrentCompilations = Environment.ProcessorCount;
                            }

                            if (settings == null || !int.TryParse(settings["aspnet:MaxAcceptLanguageFallbackCount"], out _maxAcceptLanguageFallbackCount) || _maxAcceptLanguageFallbackCount <= 0)
                                _maxAcceptLanguageFallbackCount = DefaultMaxAcceptLanguageFallbackCount;

                            if (settings == null || !Boolean.TryParse(settings["aspnet:PortableCompilationOutput"], out _portableCompilationOutput))
                                _portableCompilationOutput = false;

                            if (settings == null || string.IsNullOrWhiteSpace(_portableCompilationOutputSnapshotType = settings["aspnet:PortableCompilationOutputSnapshotType"]))
                                _portableCompilationOutputSnapshotType = null;

                            if (settings == null || string.IsNullOrWhiteSpace(_portableCompilationOutputSnapshotTypeOptions = settings["aspnet:PortableCompilationOutputSnapshotTypeOptions"]))
                                _portableCompilationOutputSnapshotTypeOptions = null;

                            _settingsInitialized = true;
                        }
                    }
                }
            }
        }

        [ConfigurationPermission(SecurityAction.Assert, Unrestricted = true)]
        [SuppressMessage("Microsoft.Security", "CA2106:SecureAsserts", Justification = "This assert is safe since we control the callers; they're not leaking information.")]
        private static NameValueCollection GetAppSettingsSection() {
            // DevDiv #353926 - Fall back to reading App.config if System.Web types are being consumed outside an ASP.NET application
            if (!HostingEnvironment.IsHosted) {
                return ConfigurationManager.AppSettings;
            }

            // Check the app-level config. Ignore configuration errors
            CachedPathData appPathData = CachedPathData.GetApplicationPathData();

            if (appPathData != null && appPathData.ConfigRecord != null)
                return appPathData.ConfigRecord.GetSection("appSettings") as NameValueCollection;

            // nothing found
            return null;
        }

        private static  bool _useHostHeaderForRequestUrl;
        internal static bool UseHostHeaderForRequestUrl {
            get {
                EnsureSettingsLoaded();
                return _useHostHeaderForRequestUrl;
            }
        }

        private static  bool _allowAnonymousImpersonation;
        internal static bool AllowAnonymousImpersonation {
            get {
                EnsureSettingsLoaded();
                return _allowAnonymousImpersonation;
            }
        }

        // false [default] to allow ScriptResource.axd to serve static files only if they are *.js; 
        // true to allow ScriptResource.axd to serve any static file (bad practice)
        private static  bool _scriptResourceAllowNonJsFiles;
        internal static bool ScriptResourceAllowNonJsFiles {
            get {
                EnsureSettingsLoaded();
                return _scriptResourceAllowNonJsFiles;
            }
        }

        // false [default] to use encrypt+sign for all except Membership and MachineKey public API
        // true to use encrypt only (dangerous!)
        private static  bool _useLegacyEncryption;
        internal static bool UseLegacyEncryption {
            get {
                EnsureSettingsLoaded();
                return _useLegacyEncryption;
            }
        }

        // false [default] to use encrypt+sign for MachineKey public API
        // true to use encrypt only for MachineKey public API (dangerous!)
        private static  bool _useLegacyMachineKeyEncryption;
        internal static bool UseLegacyMachineKeyEncryption {
            get {
                EnsureSettingsLoaded();
                return _useLegacyMachineKeyEncryption;
            }
        }

        // false [default] to use secure semantics when generating FormsAuthentication tickets
        // true to allow ticketCompatibilityMode="Framework20" (dangerous!)
        private static bool _useLegacyFormsAuthenticationTicketCompatibility;
        internal static bool UseLegacyFormsAuthenticationTicketCompatibility {
            get {
                EnsureSettingsLoaded();
                return _useLegacyFormsAuthenticationTicketCompatibility;
            }
        }

        // false [default] to use a cryptographic hash algorithm when generating the __EVENTVALIDATION field
        // true to use String.GetHashCode() instead (dangerous!)
        // more info: DevDiv #233564 (http://vstfdevdiv:8080/DevDiv2/web/wi.aspx?id=233564)
        private static bool _useLegacyEventValidationCompatibility;
        internal static bool UseLegacyEventValidationCompatibility {
            get {
                EnsureSettingsLoaded();
                return _useLegacyEventValidationCompatibility;
            }
        }

        // false [default] to restrict dangerous characters in any user name passed to native code
        // true to allow dangerous characters
        private static bool _allowRelaxedHttpUserName;
        internal static bool AllowRelaxedHttpUserName {
            get {
                EnsureSettingsLoaded();
                return _allowRelaxedHttpUserName;
            }
        }

        // false [default] to encode '&' characters in HttpUtility.JavaScriptStringEncode()
        // true to not encode '&' characters (bad practice)
        private static bool _javaScriptDoNotEncodeAmpersand;
        internal static bool JavaScriptDoNotEncodeAmpersand {
            get {
                EnsureSettingsLoaded();
                return _javaScriptDoNotEncodeAmpersand;
            }
        }

        // false [default] to use the updated AspNetSynchronizationContext type (needed for TAP methods)
        // true to use LegacyAspNetSynchronizationContext (needed for some back-compat scenarios)
        private static bool _useTaskFriendlySynchronizationContext ;
        internal static bool UseTaskFriendlySynchronizationContext {
            get {
                EnsureSettingsLoaded();
                return _useTaskFriendlySynchronizationContext ;
            }
        }

        // false [default] if the updated AspNetSynchronizationContext type should throw when it encounters invalid operations
        // true to allow some invalid operations through the system (needed for some back-compat scenarios)
        // more info: see doc on HttpContext.AllowAsyncDuringSyncStages
        private static bool _allowAsyncDuringSyncStages;
        internal static bool AllowAsyncDuringSyncStages {
            get {
                EnsureSettingsLoaded();
                return _allowAsyncDuringSyncStages;
            }
        }

         // maximum number of keys a HttpValueCollection, HttpFileCollection or HttpCookieCollection is allowed to have
         private const int DefaultMaxHttpCollectionKeys = Int32.MaxValue;
         private static int _maxHttpCollectionKeys = DefaultMaxHttpCollectionKeys;
         internal static int MaxHttpCollectionKeys {
             get {
                 EnsureSettingsLoaded();
                 return _maxHttpCollectionKeys;
             }
         }

         // maximum number of entries a Json deserialized dictionary is allowed to have
         private const int DefaultMaxJsonDeserializerMembers = Int32.MaxValue;
         private static int _maxJsonDeserializerMembers = DefaultMaxJsonDeserializerMembers;
         internal static int MaxJsonDeserializerMembers {
             get {
                 EnsureSettingsLoaded();
                 return _maxJsonDeserializerMembers;
             }
         }

        // false [default] to call HttpApplication.Dispose() on all HttpApplication instances instantiated by ASP.NET
        // true to suppress calling HttpApplication.Dispose() on "special" (i.e., associated with App_Start, App_End, etc.) HttpApplication instances
        // see DevDiv #109006 (http://vstfdevdiv:8080/DevDiv2/web/wi.aspx?id=109006): HttpModules attached to the "Special" HttpApplication instance are not disposed
        private static bool _doNotDisposeSpecialHttpApplicationInstances;
        internal static bool DoNotDisposeSpecialHttpApplicationInstances {
            get {
                EnsureSettingsLoaded();
                return _doNotDisposeSpecialHttpApplicationInstances;
            }
        }

        // none [default] to use the existing /loging.aspx?ReturnUrl=
        // <FormsAuthReturnUrlVar> to use /loging.aspx?<FormsAuthReturnUrlVar>=
        private static string _formsAuthReturnUrlVar;
        internal static string FormsAuthReturnUrlVar {
            get {
                EnsureSettingsLoaded();
                return _formsAuthReturnUrlVar;
            }
        }

        // false [default] to use potentially unsafe System.Xml API's that were in use for 1.0 through 4.0
        // true to avoid using vulnerable System.Xml API's.
        private static bool _restrictXmlControls;
        internal static bool RestrictXmlControls {
            get {
                EnsureSettingsLoaded();
                return _restrictXmlControls;
            }
        }

        // false [default] - requires relative url to be more strict
        // true - use less strict policy
        private static bool _allowRelaxedRelativeUrl;
        internal static bool AllowRelaxedRelativeUrl {
            get {
                EnsureSettingsLoaded();
                return _allowRelaxedRelativeUrl;
            }
        }

        // false [default] - attempts to re-encode HttpRequest.Url so that it is equivalent to the actual incoming URL 
        // true - does not attempt to re-encode the Url, which could allow the Uri class to perform double-decoding (dangerous!)
        // See also DevDiv #703232 (http://vstfdevdiv:8080/DevDiv2/DevDiv/_workitems/edit/703232)
        private static bool _useLegacyRequestUrlGeneration;
        internal static bool UseLegacyRequestUrlGeneration {
            get {
                EnsureSettingsLoaded();
                return _useLegacyRequestUrlGeneration;
            }
        }

        // false [default] - disallow UTF-7 as an incoming ContentEncoding
        // true - allow UTF-7 as an incoming ContentEncoding (dangerous!)
        private static bool _allowUtf7RequestContentEncoding;
        internal static bool AllowUtf7RequestContentEncoding {
            get {
                EnsureSettingsLoaded();
                return _allowUtf7RequestContentEncoding;
            }
        }

        // false [default] - disallow invalid UTF-16 (like unpaired surrogates) when deserializing JSON strings and inside UrlDecode
        // true - allow malformed strings like "\ud800" and "%ud800" to be deserialized (dangerous!)
        private static bool _allowRelaxedUnicodeDecoding;
        internal static bool AllowRelaxedUnicodeDecoding {
            get {
                EnsureSettingsLoaded();
                return _allowRelaxedUnicodeDecoding;
            }
        }

        // maximum length for UpdatePanel script block
        private static int _updatePanelMaxScriptLength;
        internal static int UpdatePanelMaxScriptLength {
            get {
                EnsureSettingsLoaded();
                return _updatePanelMaxScriptLength;
            }
        }

       // maximum number of concurrent compilations
       private static int _maxConcurrentCompilations;
       internal static int MaxConcurrentCompilations {
           get {
               EnsureSettingsLoaded();
               return _maxConcurrentCompilations;
           }
       }

        // Controls how deep we look when trying to get a CultureInfo from an Accept-Language header.
        // For example, a value of 3 with Accept-Language: en-us, en, fr-FR, zh-CN will cause us to
        // look for "en-us", "en", and "fr-FR" in order, taking the first hit, but we won't look
        // for "zh-CN" if the first three fail. Setting this value too high could result in DoS.
        private const int DefaultMaxAcceptLanguageFallbackCount = 3;
        private static int _maxAcceptLanguageFallbackCount;
        internal static int MaxAcceptLanguageFallbackCount {
            get {
                EnsureSettingsLoaded();
                return _maxAcceptLanguageFallbackCount;
            }
        }

       // false [default] 
       // true to allow 
       private static bool _portableCompilationOutput;
       internal static bool PortableCompilationOutput {
           get {
               EnsureSettingsLoaded();
               return _portableCompilationOutput;
           }
       }

       // null [default] 
       // complete type name as string
       private static string _portableCompilationOutputSnapshotType;
       internal static string PortableCompilationOutputSnapshotType {
           get {
               EnsureSettingsLoaded();
               return _portableCompilationOutputSnapshotType;
           }
       }

       // null [default] 
       // options
       private static string _portableCompilationOutputSnapshotTypeOptions;
       internal static string PortableCompilationOutputSnapshotTypeOptions {
           get {
               EnsureSettingsLoaded();
               return _portableCompilationOutputSnapshotTypeOptions;
           }
       }
    }
}
