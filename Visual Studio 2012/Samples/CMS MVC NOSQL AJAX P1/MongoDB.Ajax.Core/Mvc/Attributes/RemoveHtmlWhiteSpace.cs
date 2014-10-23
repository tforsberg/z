using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Web.Mvc;
using MongoDB.Ajax.Core;

namespace MongoDB.Ajax.Business.Attributes
{
    //https://gist.github.com/1176047
    public sealed class RemoveHtmlWhiteSpace : ActionFilterAttribute
    {

       /* public override void OnResultExecuting(ResultExecutingContext filterContext)
        {

            base.OnResultExecuting(filterContext);

            var response = filterContext.HttpContext.Response;
            response.Filter = new MinifiedStream(response.Filter);
        }
*/

        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {

            base.OnResultExecuted(filterContext);

            var response = filterContext.HttpContext.Response;
            response.Filter = new MinifiedStream(response.Filter);
        }


        public class MinifiedStream : MemoryStream
        {

//            Source = new Regex("(<pre>[^<>]*(((?<Open><)[^<>]*)+((?<Close-Open>>)[^<>]*)+)*(?(Open)(?!))</pre>)|\\s\\s+|[\\t\\n\\r]", RegexOptions.Compiled | RegexOptions.Singleline).Replace(Source, "$1");


            private static readonly Regex _JAVASCRIPT_TAGS = new Regex(@"<script\s[^>]*>([\w\W]*?)</script>", RegexOptions.Compiled | RegexOptions.IgnoreCase);
            private static readonly Regex _REGEX_BETWEEN_TAGS = new Regex(@">\s+<", RegexOptions.Compiled);

            /*
                        private static readonly Regex _END_TAGS = new Regex(@">(?! )\s+", RegexOptions.Compiled);

                        private static readonly Regex _BEGIN_TAGS = new Regex(@"([\n\s])+?(?<= {2,})<", RegexOptions.Compiled);*/

            private static readonly Regex _LINE_BREAKS = //new Regex(@"([\n\s])+?(?<= {2,})",RegexOptions.Compiled);//new Regex(@"/\*([^*]|[\r\n]|(\*+([^*/]|[\r\n])))*\*+/",RegexOptions.Compiled); //
                                                           new Regex(@"(?<=[^])\t{2,}|(?<=[>])\s{2,}(?=[<])|(?<=[>])\s{2,11}(?=[<])|(?=[\n])\s{2,}", RegexOptions.Compiled);
            //new Regex(@"([\r\n])|([\t])|([\n\s])+?(?<= {2,})", RegexOptions.Compiled);
            

            //private static readonly Regex _LINE_BREAKS = new Regex(@"\n\s+", RegexOptions.Compiled);
            //private static readonly Regex _REGEX_TAB_SPACES = new Regex(@"\t*", RegexOptions.Compiled | RegexOptions.IgnoreCase);

            private static readonly Regex _HTML_COMMENT = new Regex(@"<!--([\w\W]*?)-->", RegexOptions.Compiled | RegexOptions.IgnoreCase);

            private static readonly Regex _DISABLE_TAGS = new Regex(@"(<textarea\s[^>]*>([\w\W]*?)</textarea>)|(<pre\s[^>]*>([\w\W]*?)</pre>)", RegexOptions.Compiled | RegexOptions.IgnoreCase);

            private readonly Stream _output;
            public MinifiedStream(Stream stream)
            {
                _output = stream;
            }


            public override void Write(byte[] buffer, int offset, int count)
            {
                var html = Encoding.UTF8.GetString(buffer);

                html = _JAVASCRIPT_TAGS.Replace(html, JavaScriptMatch);

                html = _REGEX_BETWEEN_TAGS.Replace(html, "> <");
                html = _HTML_COMMENT.Replace(html, string.Empty);

                if (!_DISABLE_TAGS.IsMatch(html))
                {
                    html = _LINE_BREAKS.Replace(html, string.Empty);
                }

                _output.Write(Encoding.UTF8.GetBytes(html), offset, Encoding.UTF8.GetByteCount(html));
            }
            private static string JavaScriptMatch(Match _m)
            {

                if (_m.Groups[1].Success && !string.IsNullOrEmpty(_m.Groups[1].Value))
                    return _m.ToString().Replace(_m.Groups[1].Value, string.Format("/*<![CDATA[*/{0}/*]]>*/", new ScriptPacker(ScriptPacker.PackerEncoding.None, true, false).Pack(_m.Groups[1].Value)));
                return _m.ToString();
            }
        }




    }
}
