using System;
using System.IO;
using System.IO.Compression;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace MongoDB.Ajax.Business.Handlers
{

    public class TinyMceHandler : IHttpHandler
    {
        private readonly static TimeSpan CACHE_DURATION = TimeSpan.FromDays(30);

        public HttpContext Context;

        public void ProcessRequest(HttpContext context)
        {

            Context = context;

            // Set response headers
            //Context.Response.ContentType = "text/javascript";
            //Context.Response.Charset = "UTF-8";
            //Context.Response.Buffer = false;



            HttpRequest _request = context.Request;

            // Read setName, contentType and version. All are required. They are
            // used as cache key
            bool _core = !string.IsNullOrEmpty(_request["core"]) && bool.Parse(_request["core"]);
            //bool isJS = _request["js"]?false;
            string _plugins = _request["plugins"] ?? string.Empty;
            string _contentType = "text/javascript";
            string _type = _request["t"] ?? string.Empty;
            string _languages = _request["languages"] ?? "en";
            string _themes = _request["themes"] ?? "advanced";
            string _suffix = _request["suffix"] ?? string.Empty;


            if (!string.IsNullOrEmpty(_type) && _type == "css")
            {
                _contentType = "text/css";
            }

            string _version = _request["v"] ?? string.Empty;

            // Decide if browser supports compressed response
            bool _isCompressed = CanGZip(context.Request);

            // Response is written as UTF8 encoding. If you are using languages like
            // Arabic, you should change this to proper encoding 
            //var _encoding = new UTF8Encoding(false);

            if (string.IsNullOrEmpty(_plugins))
            {



                context.Response.WriteFile(context.Server.MapPath("tiny_mce_gzip.js"));
                //_context.Response.Write("tinyMCE_GZ.init({});");
                return;



                //using (var _memoryStream = new MemoryStream(500))
                //{
                //    using (Stream _writer = _isCompressed ? (Stream)(new GZipStream(_memoryStream, CompressionMode.Compress)) : _memoryStream)
                //    {
                //        const string _file = "tiny_mce_gzip.js";
                //        byte[] _fileBytes = GetFileBytes(_context, _file, _encoding);
                //        _writer.Write(_fileBytes, 0, _fileBytes.Length);
                //        _writer.WriteByte(Convert.ToByte('\n'));
                //    }

                //}

            }


            // If the set has already been cached, write the response directly from
            // cache. Otherwise generate the response and cache it


            string eTag = "\"" + (GetCacheKey(_plugins, _version, _isCompressed)).GetHashCode() + "\"";

            if (CheckETag(Context, eTag))
            {
                return;
            }


            var _sb = new StringBuilder();


            string _s;

            if (_core)
            {
                string _file = string.Format("tiny_mce{0}.js", _suffix);
                _s = GetFile(context, _file);
                _sb.AppendLine(_s);
                _sb.AppendLine("tinyMCE_GZ.start();");

            }

            // Languages
            _s = GetFile(context, "langs/" + _languages + ".js");
            _sb.AppendLine(_s);

            // Add themes
            _s = GetFile(context, "themes/" + _themes + "/editor_template" + _suffix + ".js");
            _sb.AppendLine(_s);

            _s = GetFile(context, "themes/" + _themes + "/langs/" + _languages + ".js");
            _sb.AppendLine(_s);




            string[] _pluginNames = _plugins.Split(new char[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);

            foreach (string _plugin in _pluginNames)
            {

                string _file = string.Format("plugins/{0}/editor_plugin.js", _plugin.Trim());

                _s = GetFile(context, _file);
                _sb.AppendLine(_s);

                _file = string.Format("plugins/{0}/langs/{1}.js", _plugin.Trim(), _languages);
                _s = GetFile(context, _file);
                _sb.AppendLine(_s);


                //byte[] _fileBytes = GetFileBytes(_context, _file, _encoding);
                //_writer.Write(_fileBytes, 0, _fileBytes.Length);
                //_writer.WriteByte(Convert.ToByte('\n'));

            }


            if (_core)
                _sb.AppendLine("tinyMCE_GZ.end();");


            byte[] _bytes = Encoding.UTF8.GetBytes(_sb.ToString());

            using (var _memoryStream = new MemoryStream())
            {
                using (
                    Stream _writer = _isCompressed
                                         ? (Stream)(new GZipStream(_memoryStream, CompressionMode.Compress))
                                         : _memoryStream)
                {

                    _writer.Write(_bytes, 0, _bytes.Length);


                }
                byte[] _responseBytes = _memoryStream.ToArray();


                // Generate the response
                WriteBytes(_responseBytes, context, _isCompressed, _contentType, eTag);
            }



            /*
            if (!WriteFromCache(_context, _plugins, _version,_isCompressed, _contentType))
            {

                string _s;

                if (_core)
                {
                    string _file = string.Format("tiny_mce{0}.js", _suffix);
                    _s = GetFile(_context, _file);
                    _sb.AppendLine(_s);
                    _sb.AppendLine("tinyMCE_GZ.start();");

                }

                // Languages
                _s = GetFile(_context, "langs/" + _languages + ".js");
                _sb.AppendLine(_s);

                // Add themes
                _s = GetFile(_context, "themes/" + _themes + "/editor_template" + _suffix + ".js");
                _sb.AppendLine(_s);

                _s = GetFile(_context, "themes/" + _themes + "/langs/" + _languages + ".js");
                _sb.AppendLine(_s);




                string[] _pluginNames = _plugins.Split(new char[] {',', ';'}, StringSplitOptions.RemoveEmptyEntries);

                foreach (string _plugin in _pluginNames)
                {

                    string _file = string.Format("plugins/{0}/editor_plugin.js", _plugin.Trim());

                    _s = GetFile(_context, _file);
                    _sb.AppendLine(_s);

                    _file = string.Format("plugins/{0}/langs/{1}.js", _plugin.Trim(), _languages);
                    _s = GetFile(_context, _file);
                    _sb.AppendLine(_s);


                    //byte[] _fileBytes = GetFileBytes(_context, _file, _encoding);
                    //_writer.Write(_fileBytes, 0, _fileBytes.Length);
                    //_writer.WriteByte(Convert.ToByte('\n'));

                }


                if (_core)
                    _sb.AppendLine("tinyMCE_GZ.end();");


                byte[] _bytes = Encoding.UTF8.GetBytes(_sb.ToString());

                using (var _memoryStream = new MemoryStream())
                {
                    using (
                        Stream _writer = _isCompressed
                                             ? (Stream) (new GZipStream(_memoryStream, CompressionMode.Compress))
                                             : _memoryStream)
                    {

                        _writer.Write(_bytes, 0, _bytes.Length);


                    }
                    byte[] _responseBytes = _memoryStream.ToArray();


                    _context.Cache.Insert(GetCacheKey(_plugins, _version, _isCompressed), _responseBytes, null,
                                          System.Web.Caching.Cache.NoAbsoluteExpiration, CACHE_DURATION);

                    // Generate the response
                    WriteBytes(_responseBytes, _context, _isCompressed, _contentType);
                }


            }

             */


            /*
                using (var _memoryStream = new MemoryStream(5000))
                {
                    // Decide regular stream or GZipStream based on whether the response
                    // can be cached or not
                    using (Stream _writer = _isCompressed ? (Stream)(new GZipStream(_memoryStream, CompressionMode.Compress)) : _memoryStream)
                    {



                        if (_core)
                        {

                            string _file = string.Format("tiny_mce{0}.js", _suffix);

                            byte[] _fileBytes = GetFileBytes(_context, _file, _encoding);
                            _writer.Write(_fileBytes, 0, _fileBytes.Length);

                            //  _writer.Write(Encoding.ASCII.GetBytes("tinyMCE_GZ.start();"));

                        }


                        string[] _pluginNames = _plugins.Split(new char[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);

                        foreach (string _plugin in _pluginNames)
                        {

                            string _file = string.Format("plugins/{0}/editor_plugin.js", _plugin.Trim());

                            byte[] _fileBytes = GetFileBytes(_context, _file, _encoding);
                            _writer.Write(_fileBytes, 0, _fileBytes.Length);
                            _writer.WriteByte(Convert.ToByte('\n'));

                        }

                        _writer.Close();
                    }

                    // Cache the combined response so that it can be directly written
                    // in subsequent calls 
                    byte[] _responseBytes = _memoryStream.ToArray();

                    // string _cacheKey=  GetCacheKey(setName, version, isCompressed);

                    //   CacheWrapper.Add(_cacheKey,responseBytes,);

                    _context.Cache.Insert(GetCacheKey(_plugins, _version, _isCompressed),
                        _responseBytes, null, System.Web.Caching.Cache.NoAbsoluteExpiration,
                        CACHE_DURATION);

                    // Generate the response
                    WriteBytes(_responseBytes, _context, _isCompressed, _contentType);
                
                } * 
                 * */

        }


        private static string GetFile(HttpContext _context, string _virtualPath)
        {

            if (_virtualPath.StartsWith("http://", StringComparison.InvariantCultureIgnoreCase))
            {
                using (var _client = new WebClient())
                {
                    return _client.DownloadString(_virtualPath);
                }
            }
            string _physicalPath = _context.Server.MapPath(_virtualPath);
            return File.Exists(_physicalPath) ? File.ReadAllText(_physicalPath) : string.Empty;
        }


        /*

        private bool WriteFromCache(HttpContext _context, string _setName, string _version, bool _isCompressed, string _contentType)
        {
            if (!_release) return false;

            var _responseBytes = _context.Cache[GetCacheKey(_setName, _version, _isCompressed)] as byte[];

            if (null == _responseBytes || 0 == _responseBytes.Length) return false;

            WriteBytes(_responseBytes, _context, _isCompressed, _contentType);
            return true;
        }
         * */

        private static void WriteBytes(byte[] _bytes, HttpContext _context, bool _isCompressed, string _contentType, string eTag)
        {
            HttpResponse _response = _context.Response;

            _response.AppendHeader("Content-Length", _bytes.Length.ToString());
            _response.ContentType = _contentType;
            if (_isCompressed)
                _response.AppendHeader("Content-Encoding", "gzip");

            _context.Response.Cache.SetCacheability(HttpCacheability.Public);
            _context.Response.Cache.SetExpires(DateTime.Now.Add(CACHE_DURATION));
            _context.Response.Cache.SetMaxAge(CACHE_DURATION);
            _context.Response.Cache.SetETag(eTag);
            _context.Response.ContentType = _contentType;
            _context.Response.Cache.AppendCacheExtension("must-revalidate, proxy-revalidate");
            _response.OutputStream.Write(_bytes, 0, _bytes.Length);
            _response.Flush();
        }


        /*
        private static byte[] GetFileBytes(HttpContext _context, string _virtualPath, Encoding _encoding)
        {
            if (_virtualPath.StartsWith("http://", StringComparison.InvariantCultureIgnoreCase))
            {
                using (var _client = new WebClient())
                {
                    return _client.DownloadData(_virtualPath);
                }
            }
            string _physicalPath = _context.Server.MapPath(_virtualPath);
            byte[] _bytes = File.ReadAllBytes(_physicalPath);
            // TODO: Convert unicode files to specified encoding. For now, assuming
            // files are either ASCII or UTF8
            return _bytes;
        }
         * */


        /// <summary>
        /// Check if the ETag that sent from the client is match to the current ETag.
        /// If so, set the status code to 'Not Modified' and stop the response.
        /// </summary>
        private static bool CheckETag(HttpContext context, string eTagCode)
        {
            string ifNoneMatch = context.Request.Headers["If-None-Match"];
            if (eTagCode.Equals(ifNoneMatch, StringComparison.Ordinal))
            {
                context.Response.AppendHeader("Content-Length", "0");
                context.Response.StatusCode = (int)HttpStatusCode.NotModified;
                context.Response.StatusDescription = "Not modified";
                context.Response.SuppressContent = true;
                context.Response.Cache.SetCacheability(HttpCacheability.Public);
                context.Response.Cache.SetETag(eTagCode);
                context.Response.Cache.SetExpires(DateTime.Now.AddYears(1));
                context.Response.End();
                return true;
            }

            return false;
        }

        private static bool CanGZip(HttpRequest _request)
        {
            string _acceptEncoding = _request.Headers["Accept-Encoding"];
            if (!string.IsNullOrEmpty(_acceptEncoding) && (_acceptEncoding.Contains("gzip") || _acceptEncoding.Contains("deflate")))
                return true;
            return false;
        }

        private static string GetCacheKey(string _setName, string _version, bool _isCompressed)
        {
            return "tinymce." + _setName + "." + _version + "." + _isCompressed;
        }

        private string GetParam(string name, string def)
        {
            string value = Context.Request.QueryString[name] != null ? "" + Context.Request.QueryString[name] : def;

            return Regex.Replace(value, @"[^0-9a-zA-Z\\-_,]+", "");
        }

        /*
        private string MD5(string str)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            byte[] result = md5.ComputeHash(Encoding.ASCII.GetBytes(str));
            str = BitConverter.ToString(result);

            return str.Replace("-", "");
        }

         * */

        public bool IsReusable
        {
            get
            {
                return true;
            }
        }
    }
}
