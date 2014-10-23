using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace MongoDB.Ajax.Core
{
    public static class Utils
    {
        

        public static int ToMonthInt(this DateTime d)
        {
            return int.Parse(string.Format("{0}{1:00}", d.Year, d.Month));
        }

        public static int ToDayInt(this DateTime d)
        {
            return int.Parse(string.Format("{0}{1:00}{2:00}", d.Year, d.Month, d.Day));
        }

        public static int ToHourInt(this DateTime d)
        {
            return int.Parse(string.Format("{0}{1:00}{2:00}{3:00}", d.Year, d.Month, d.Day, d.Hour));
        }

        public static DateTime ShortDayToString(this string d)
        {
            return DateTime.Parse(string.Format("{0}/{1}/{2} 00:00", d.Substring(4, 2), d.Substring(6, 2), d.Substring(0, 4)));
        }

         public static DateTime ShortHourToString(this string d)
         {
             return DateTime.Parse(string.Format("{0}/{1}/{2} {3}:00", d.Substring(4, 2), d.Substring(6, 2), d.Substring(0, 4), d.Substring(8, 2)));
         }

        public static DateTime ToUnixDateTime(this double timestamp)
        {
            var origin = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            return origin.AddSeconds(timestamp);
        }

        public static double ToUnixTimestamp(this DateTime date)
        {
            var origin = new DateTime(1970, 1, 1, 0, 0, 0, 0);
            TimeSpan diff = date - origin;
            return Math.Floor(diff.TotalSeconds);
        }


        #region RandomPassword


        public static string RandomNumber(int length)
        {
            return Random(length, true);
        }

        public static string Random(int length, bool onlyNumber)
        {
            string PASSWORD_CHARS = onlyNumber ? "0123456789" : "123456789ABCDEFGHJKLMNPQRSTWXYZ";
            var s = new StringBuilder();
            char[] chars = PASSWORD_CHARS.ToCharArray();
            var _rd = new Random();
            for (int i = 0; i < length; i++)
            {
                int index = _rd.Next(chars.Length - 1);
                s.Append(chars[index].ToString());
            }
            return s.ToString();

        }

        #endregion


        #region Encrypt & Decrypt

        public static string Encrypt(params object[] _params)
        {

            var _sb = new StringBuilder();

            for (int i = 0; i < _params.Length; i++)
            {

                if (i > 0)
                    _sb.Append(",");
                _sb.Append(_params[i]);
            }

            // More
            //   _sb.AppendFormat(",{0}", SessionID);

            return Encryptor.Encrypt(_sb.ToString());

        }


        public static string[] Decrypt(string _encryptString)
        {

            string _plainText = Encryptor.Decrypt(_encryptString);
            return _plainText.Split(new char[] { ',', ';' }, StringSplitOptions.RemoveEmptyEntries);
        }




        #endregion

        public static string DownloadPageAsString(string url)
        {

            HttpWebRequest request;
            HttpWebResponse response = null;
            StreamReader reader;
            StringBuilder sbSource;

            try
            {
                // Create and initialize the web request  
                request = WebRequest.Create(url) as HttpWebRequest;
                request.UserAgent = "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:14.0) Gecko/20100101 Firefox/14.0.1";
                request.KeepAlive = false;
                request.Timeout = 10 * 1000;

                // Get response  
                response = request.GetResponse() as HttpWebResponse;

                if (request.HaveResponse == true && response != null)
                {
                    // Get the response stream  
                    reader = new StreamReader(response.GetResponseStream());

                    // Read it into a StringBuilder  
                    sbSource = new StringBuilder(reader.ReadToEnd());

                    response.Close();

                    // Console application output  
                    return sbSource.ToString();
                }
                else
                    return "";
            }
            catch (Exception)
            {
                response.Close();
                return "";
            }
        }

        /* public static string GetMeta(string html, string metaName)
         {
             // --- Parse the meta keywords
             Match KeywordMatch = Regex.Match(html, "<meta name=\"" + metaName + "\" content=\"([^<]*)\">", RegexOptions.IgnoreCase | RegexOptions.Multiline);
             return KeywordMatch.Groups[1].Value;

         }*/

        public static string GetMetaContent(this string html, string metaName)
        {

            return Regex.Match(html, "(?<=" + metaName + "\" content=\")(?<val>.*?)(?=\")").Groups["val"].Value;

        }


        public static int[] ToInt(this string[] s)
        {
            var ints = new int[s.Length];

            for (int i = 0; i < s.Length; i++)
            {
                ints[i] = int.Parse(s[i]);
            }

            return ints;
        }

        public static string[] Split(this string input)
        {
            if(!string.IsNullOrWhiteSpace(input))
            {
                return input.Split(new[] {';', ','}, StringSplitOptions.RemoveEmptyEntries);

            }
            return null;
            
        }

        public static string ClientIp
        {
            get
            {
                var _ip = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] ?? HttpContext.Current.Request.UserHostAddress;
                if (_ip == "::1" || string.IsNullOrEmpty(_ip)) _ip = "127.0.0.1";
                return _ip;
            }
        }
    
    }
}
