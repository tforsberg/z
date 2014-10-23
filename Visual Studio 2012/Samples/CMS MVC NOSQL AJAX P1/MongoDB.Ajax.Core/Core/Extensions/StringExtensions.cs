using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace MongoDB.Ajax.Core.Extensions
{
    public static class StringExtensions
    {


        #region ToJavaScript

        public static string ToJScriptString(this string value)
        {
            return ToJScriptString(value, false);
        }

        public static string ToJScriptString(this string value, bool forUrl)
        {
            StringBuilder builder = null;
            if (string.IsNullOrEmpty(value))
            {
                return string.Empty;
            }
            int startIndex = 0;
            int count = 0;
            for (int i = 0; i < value.Length; i++)
            {
                switch (value[i])
                {
                    case '%':
                        {
                            if (!forUrl)
                            {
                                break;
                            }
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 6);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append("%25");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                    case '\'':
                        {
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 5);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append(@"\'");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                    case '\\':
                        {
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 5);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append(@"\\");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                    case '\t':
                        {
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 5);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append(@"\t");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                    case '\n':
                        {
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 5);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append(@"\n");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                    case '\r':
                        {
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 5);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append(@"\r");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                    case '"':
                        {
                            if (builder == null)
                            {
                                builder = new StringBuilder(value.Length + 5);
                            }
                            if (count > 0)
                            {
                                builder.Append(value, startIndex, count);
                            }
                            builder.Append("\\\"");
                            startIndex = i + 1;
                            count = 0;
                            continue;
                        }
                }
                count++;
            }
            if (builder == null)
            {
                return value;
            }
            if (count > 0)
            {
                builder.Append(value, startIndex, count);
            }
            return builder.ToString();
        }

        #endregion


        #region ToNameValueCollection

        public static NameValueCollection ToQueryString(this string query)
        {
            return query.ToNameValueCollection('?', '=');
        }

        public static NameValueCollection ToNameValueCollection(this string source, char delimiter, char valueDelimiter)
        {

            if (string.IsNullOrWhiteSpace(source)) return null;

            var nameValues = new NameValueCollection();
            string[] querySegments = source.Split(delimiter);
            foreach (string segment in querySegments)
            {
                string[] parts = segment.Split(valueDelimiter);
                if (parts.Length > 0)
                {
                    string key = parts[0].Trim(new char[] { '?', ' ' });
                    string val = parts[1].Trim();

                    nameValues.Add(key, val);
                }
            }


            return nameValues;

        }

        #endregion


        #region ToAbsoluteUrl

        public static string ToAbsoluteUrl(this string relativeUrl, Uri rootUrl)
        {
            if (string.IsNullOrEmpty(relativeUrl))
                return relativeUrl;

            if (relativeUrl.StartsWith("/"))
                relativeUrl = relativeUrl.Insert(0, "~");
            if (!relativeUrl.StartsWith("~/"))
                relativeUrl = relativeUrl.Insert(0, "~/");

            var url = rootUrl;
            var port = url.Port != 80 ? (":" + url.Port) : String.Empty;

            // return string.Format("{0}://{1}{2}{3}", url.Scheme, url.Host, port, VirtualPathUtility.ToAbsolute(relativeUrl));
            return string.Format("{0}://{1}{2}{3}", url.Scheme, url.Host, port, relativeUrl.Replace("~/", "/"));
        }

        #endregion


        #region Base64 Encode

        public static string FromBase64ToString(this string base64String)
        {
            if (string.IsNullOrEmpty(base64String))
                return "";
            byte[] tempArray = Convert.FromBase64String(base64String);
            return Encoding.UTF8.GetString(tempArray);
        }

        public static string ToBase64String(this string plainText)
        {

            if (string.IsNullOrEmpty(plainText))
                return "";
            byte[] tempArray = Encoding.UTF8.GetBytes(plainText);
            return Convert.ToBase64String(tempArray);
        }

        #endregion


        #region CompareTo

        public static bool Compare(this string _a, string _b)
        {
            return String.Compare(_a, _b, StringComparison.OrdinalIgnoreCase) == 0;
        }

        #endregion


        #region IsBoolean

        public static bool IsBoolean(this string source)
        {
            return !string.IsNullOrEmpty(source) && Regex.IsMatch(source, "yes|y|on|true", RegexOptions.IgnoreCase);
        }

        #endregion

        public static bool IsGraphic(this string _fileName)
        {
            //var Regex = new Regex(@"\.gif$|\.jpg$|\.jpeg$|\.png$|\.bmp$|\.tiff$|\.wmf$|\.ico$", RegexOptions.IgnoreCase);
            var regex = new Regex(@"\.gif$|\.jpg$|\.jpeg$|\.png$|\.bmp$", RegexOptions.IgnoreCase);
            if (regex.IsMatch(_fileName))
            {
                return true;
            }
            return false;
        }

        public static bool IsEmail(this string email)
        {
            const string pattern = @"^[a-z][a-z|0-9|]*([_][a-z|0-9]+)*([.][a-z|" +
                                   @"0-9]+([_][a-z|0-9]+)*)?@[a-z][a-z|0-9|]*\.([a-z]" +
                                   @"[a-z|0-9]*(\.[a-z][a-z|0-9]*)?)$";
            Match match = Regex.Match(email.Trim(), pattern, RegexOptions.IgnoreCase);

            if (match.Success)
                return true;

            return false;
        }


        #region IP Address

        public static bool IsIpAddress(this string ip)
        {
            bool result = true;
            if (!Regex.IsMatch(ip, @"^\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}$"))
            {
                return false;
            }
            string[] ipSeg = ip.Split('.');
            if (ipSeg.Length != 3)
            {
                return false;
            }
            int i = 0;
            do
            {
                if ((int.Parse(ipSeg[i]) > 255) || (int.Parse(ipSeg[i]) < 0))
                {
                    result = false;
                }
                i++;
            } while (i <= 3);
            return result;
        }

        public static long IpAdressToLong(this string ip)
        {
            double num = 0;

            if (!string.IsNullOrEmpty(ip))
            {
                string[] ipBytes = ip.Split('.');

                for (int i = ipBytes.Length - 1; i >= 0; i--)
                {

                    num += ((int.Parse(ipBytes[i]) % 256) * Math.Pow(256, (3 - i)));

                }
            }

            return (long)num;

        }

        public static string ToIpAdress(this long longIP)
        {

            string ip = string.Empty;

            for (int i = 0; i < 4; i++)
            {

                int num = (int)(longIP / Math.Pow(256, (3 - i)));

                longIP = longIP - (long)(num * Math.Pow(256, (3 - i)));

                if (i == 0)

                    ip = num.ToString();

                else

                    ip = ip + "." + num;

            }

            return ip;

        }

        public static bool IsIpAdressBanned(this string ipMask, string clientIp)
        {

            long client = clientIp.IpAdressToLong();

            if (ipMask.IndexOf("*") >= 0)
            {
                String[] ipmask = ipMask.Trim().Split('.');

                for (int i = 0; i < ipmask.Length; i++)
                {
                    if (ipmask[i] == "*")
                    {
                        for (int x = 0; x < 255; x++)
                        {
                            ipmask[i] = x.ToString();

                            string ip = String.Join(".", ipmask);
                            if (client == ip.IpAdressToLong())
                            {
                                return true;
                            }
                        }

                    }

                }

            }

            return (client == ipMask.IpAdressToLong());


        }

        #endregion


        #region ToPlainText


        public static string ToFriendlyUrl(this string urlToEncode)
        {
            urlToEncode = (urlToEncode ?? "").Trim().ToLower();

            var url = new StringBuilder();

            foreach (char ch in urlToEncode)
            {
                switch (ch)
                {
                    case ' ':
                        url.Append('-');
                        break;
                    case '&':
                        url.Append("and");
                        break;
                    case '\'':
                        break;
                    default:
                        if ((ch >= '0' && ch <= '9') ||
                            (ch >= 'a' && ch <= 'z') ||
                            ch == '.')
                        {
                            url.Append(ch);
                        }
                        else
                        {
                            url.Append('-');
                        }
                        break;
                }
            }

            return url.ToString().TrimEnd(new char[] { '.', '-' }).RemoveExtraHyphen();
        }


        public static string RemoveExtraHyphen(this string text)
        {
            const string replace = "--";
            if (text.Contains(replace))
            {
                text = text.Replace(replace, "-");
                return text.RemoveExtraHyphen();
            }

            return text;
        }


        public static string VietNamToPlainText(this string unicode)
        {

            if (string.IsNullOrWhiteSpace(unicode)) return unicode;

            int length = unicode.Length;

            var sb = new StringBuilder(length);

            for (int i = 0; i < length; i++)
            {

                char _char = unicode[i];

                switch (_char)
                {

                    case 'đ':
                        sb.Append('d');
                        break;
                    case 'Đ':
                        sb.Append('D');
                        break;
                    case 'à':
                    case 'á':
                    case 'ạ':
                    case 'ả':
                    case 'ã':
                    case 'ă':
                    case 'ằ':
                    case 'ắ':
                    case 'ẳ':
                    case 'ặ':
                    case 'ẵ':
                    case 'â':
                    case 'ầ':
                    case 'ấ':
                    case 'ẩ':
                    case 'ẫ':
                    case 'ậ':
                        sb.Append('a');
                        break;
                    case 'À':
                    case 'Á':
                    case 'Ạ':
                    case 'Ả':
                    case 'Ã':
                    case 'Ă':
                    case 'Ằ':
                    case 'Ắ':
                    case 'Ẳ':
                    case 'Ặ':
                    case 'Ẵ':
                    case 'Â':
                    case 'Ầ':
                    case 'Ấ':
                    case 'Ẩ':
                    case 'Ẫ':
                    case 'Ậ':
                        sb.Append('A');
                        break;
                    case 'è':
                    case 'é':
                    case 'ẹ':
                    case 'ẻ':
                    case 'ẽ':
                    case 'ê':
                    case 'ề':
                    case 'ế':
                    case 'ể':
                    case 'ệ':
                    case 'ễ':
                        sb.Append('e');
                        break;
                    case 'È':
                    case 'É':
                    case 'Ẹ':
                    case 'Ẻ':
                    case 'Ẽ':
                    case 'Ê':
                    case 'Ề':
                    case 'Ế':
                    case 'Ể':
                    case 'Ệ':
                    case 'Ễ':
                        sb.Append('E');
                        break;

                    case 'ò':
                    case 'ó':
                    case 'ọ':
                    case 'ỏ':
                    case 'õ':
                    case 'ơ':
                    case 'ờ':
                    case 'ớ':
                    case 'ở':
                    case 'ợ':
                    case 'ỡ':
                    case 'ô':
                    case 'ồ':
                    case 'ố':
                    case 'ổ':
                    case 'ộ':
                    case 'ỗ':
                        sb.Append('o');
                        break;
                    case 'Ò':
                    case 'Ó':
                    case 'Ọ':
                    case 'Ỏ':
                    case 'Õ':
                    case 'Ơ':
                    case 'Ờ':
                    case 'Ớ':
                    case 'Ở':
                    case 'Ợ':
                    case 'Ỡ':
                    case 'Ô':
                    case 'Ồ':
                    case 'Ố':
                    case 'Ổ':
                    case 'Ộ':
                    case 'Ỗ':
                        sb.Append('O');
                        break;
                    case 'ù':
                    case 'ú':
                    case 'ụ':
                    case 'ủ':
                    case 'ũ':
                    case 'ư':
                    case 'ừ':
                    case 'ứ':
                    case 'ử':
                    case 'ự':
                    case 'ữ':
                        sb.Append('u');
                        break;
                    case 'Ù':
                    case 'Ú':
                    case 'Ụ':
                    case 'Ủ':
                    case 'Ũ':
                    case 'Ư':
                    case 'Ừ':
                    case 'Ứ':
                    case 'Ử':
                    case 'Ự':
                    case 'Ữ':
                        sb.Append('U');
                        break;
                    case 'ỳ':
                    case 'ý':
                    case 'ỵ':
                    case 'ỷ':
                    case 'ỹ':
                        sb.Append('y');
                        break;
                    case 'Ỳ':
                    case 'Ý':
                    case 'Ỵ':
                    case 'Ỷ':
                    case 'Ỹ':
                        sb.Append('Y');
                        break;
                    case 'ì':
                    case 'í':
                    case 'ị':
                    case 'ỉ':
                    case 'ĩ':
                        sb.Append('i');
                        break;
                    case 'Ì':
                    case 'Í':
                    case 'Ị':
                    case 'Ỉ':
                    case 'Ĩ':
                        sb.Append('I');
                        break;
                    default:
                        sb.Append(_char);
                        break;
                }

            }

            return sb.ToString();

        }

        public static string RemoveBadCharacters(this string source)
        {
            var _sb = new StringBuilder(source.Trim());

            _sb.Replace(" ", "-");
            _sb.Replace("&", "-");
            _sb.Replace("+", "-");
            _sb.Replace("/", "-");
            _sb.Replace(":", "-");
            _sb.Replace(",", "-");
            /*_sb.Replace(".", "-");*/
            _sb.Replace("|", "-");
            _sb.Replace("–", "-");
            _sb.Replace("?", String.Empty);
            _sb.Replace("!", String.Empty);
            _sb.Replace("\"", String.Empty);
            _sb.Replace("~", String.Empty);
            _sb.Replace("^", String.Empty);
            _sb.Replace("*", String.Empty);
            _sb.Replace("%", String.Empty);
            _sb.Replace(">", String.Empty);
            _sb.Replace("<", String.Empty);
            _sb.Replace("`", String.Empty);
            _sb.Replace("'", String.Empty);
            _sb.Replace("#", String.Empty);
            _sb.Replace("”", String.Empty);
            _sb.Replace("“", String.Empty);
            _sb.Replace(")", String.Empty);
            _sb.Replace("(", String.Empty);
            _sb.Replace("}", String.Empty);
            _sb.Replace("{", String.Empty);

            return _sb.ToString().TrimEnd(new char[] { '.', '-' });

        }

        public static string ToFriendUrl(this string _unicodeText)
        {

            _unicodeText = _unicodeText.Trim();
            if (string.IsNullOrEmpty(_unicodeText)) return string.Empty;

            return _unicodeText.VietNamToPlainText().RemoveBadCharacters().RemoveExtraHyphen().ToLower();
        }

        #endregion



        public static string RemoveLineBreaks(this string lines)
        {
            return lines.Replace("\r", "").Replace("\n", " ").Replace("\t", "");
        }

        public static string HtmlToPlainText(this string html)
        {
            var reg = new Regex("<[^>]+>", RegexOptions.IgnoreCase);
            return reg.Replace(html, string.Empty);
        }


        public static string ParseLinks(this string plaintext)
        {

            // const string regex = @"\b((www\.|(http|https|ftp|news|file)+\:\/\/)[&#95;.a-z0-9-]+\.[a-z0-9\/&#95;:@=.+?,##%&~-]*[^.|\'|\# |!|\(|?|,| |>|<|;|\)])";
            const string _p = @"((mailto\:|(news|(ht|f)tp(s?))\://){1}\S+)";
            var r = new Regex(_p, RegexOptions.IgnoreCase | RegexOptions.Singleline);
            return r.Replace(plaintext, "<a href=\"$1\" target=\"_blank\">$1</a>").Replace("href=\"www", "href=\"http://www");

        }


        #region Truncate

        public static string Truncate(this string value, int length)
        {

            return value.Truncate(length, true, true);
        }


        public static string Truncate(this string s, int length, bool atWord, bool addEllipsis)
        {

            //http://nickstips.wordpress.com/2010/02/12/c-truncate-a-string-at-the-end-of-a-word/

            // Return if the string is less than or equal to the truncation length
            if (s == null || s.Length <= length)
                return s;

            // Do a simple tuncation at the desired length
            string s2 = s.Replace("&nbsp;", " ").Substring(0, length);

            // Truncate the string at the word
            if (atWord)
            {
                // List of characters that denote the start or a new word (add to or remove more as necessary)
                var alternativeCutOffs = new List<char> { ' ', ',', '.', '?', '/', ':', ';', '\'', '\"', '\'', '-', '+', '|' };

                // Get the index of the last space in the truncated string
                int lastSpace = s2.LastIndexOf(' ');

                // If the last space index isn't -1 and also the next character in the original
                // string isn't contained in the alternativeCutOffs List (which means the previous
                // truncation actually truncated at the end of a word),then shorten string to the last space
                if (lastSpace != -1 && (s.Length >= length + 1 && !alternativeCutOffs.Contains(s.ToCharArray()[length])))
                    s2 = s2.Remove(lastSpace);
            }

            // Add Ellipsis if desired
            if (addEllipsis)
                s2 += "...";

            return s2;
        }
        #endregion


        #region HighLight Keywords

        public static string HighlightKeywords(this string text, string keywords, bool fullMatch)
        {
            if (string.IsNullOrWhiteSpace(text) || string.IsNullOrWhiteSpace(keywords))
                return text;
            var words = keywords.Split(new[] { ',', ' ', ';' }, StringSplitOptions.RemoveEmptyEntries);
            if (!fullMatch)
                return words.Select(word => word.Trim()).Aggregate(text,
                             (current, pattern) =>
                             Regex.Replace(current,
                                             pattern,
                                               "<span class=\"highlight\">$0</span>",
                                               RegexOptions.IgnoreCase));

            return words.Select(word => "\\b" + word.Trim() + "\\b").Aggregate(text, (current, pattern) => Regex.Replace(current, pattern, "<span class=\"highlight\">$0</span>", RegexOptions.IgnoreCase));

        }



        public static string HighlightKeywords(this string input, string keywords)
        {

            return input.HighlightKeywords(keywords, true);

            /*if (string.IsNullOrEmpty(input) || string.IsNullOrEmpty(keywords))
            {
                return input;
            }

            string[] _kws = keywords.Split(' ');
            return _kws.Aggregate(input, (current, _k) => Regex.Replace(current, _k, string.Format("<span class=\"highlight\">{0}</span>", "$0"), RegexOptions.IgnoreCase));*/
        }


        public static string HighlightKeywords(this string input)
        {

            string _hl = HttpContext.Current.Request.QueryString["highlight"];

            return input.HighlightKeywords(_hl);

        }

        #endregion


        public static string ToXmlString(this bool b)
        {
            return b.ToString().ToLower();
        }

    }
}
