using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Linq;
using System.Security.Cryptography;
using System.Text;

namespace WijMarket.Models
{
	public class OAuth
	{
		protected const string OAuthVersion = "1.0";
		protected const string OAuthSignatureMethod = "PLAINTEXT";//"PLAINTEXT";//"HMAC-SHA1";//
		protected const string OAuthConsumerKey = "oauth_consumer_key";
		protected const string OAuthVersionKey = "oauth_version";
		protected const string OAuthSignatureMethodKey = "oauth_signature_method";
		protected const string OAuthSignatureKey = "oauth_signature";
		protected const string OAuthTimestampKey = "oauth_timestamp";
		protected const string OAuthNonceKey = "oauth_nonce";
		private const long lLeft = 621355968000000000;

		private static long GetIntFromTime(DateTime dt)
		{
			DateTime dt1 = dt.ToUniversalTime();
			long Sticks = (dt1.Ticks - lLeft) / 10000000;
			return Sticks;
		}

		private static string ParseRequestParameters(Dictionary<String, String> parameters)
		{
			StringBuilder sb = new StringBuilder();
			int i = 0;
			foreach (KeyValuePair<string, string> pair in parameters)
			{
				sb.AppendFormat("{0}={1}", pair.Key, pair.Value);
				if (i < parameters.Count - 1)
				{
					sb.Append("&");
				}
				i++;
			}

			return sb.ToString();
		}

		public static string GetFullUrlPath(string url, string query, string key, string secret)
		{
			string param = "";
			string timeStamp = OAuth.GetIntFromTime(DateTime.Now).ToString();
			string signatureData = OAuth.GenerateSignature("http://query.yahooapis.com", key,
			"GET", timeStamp, OAuth.GetRandomString(16), out param);
			string signature = GenerateSignature(OAuthSignatureMethod, signatureData, secret);
			return string.Format("{0}/v1/yql?{1}&{2}&{3}={4}", url, param, query, OAuthSignatureKey, signature);
		}

		private static string GenerateSignature(string url, string consumerKey, string httpMethod, string timeStamp, string nonce, out string normalizedRequestParameters)
		{
			normalizedRequestParameters = null;

			Dictionary<String, String> parameters = new Dictionary<string, string>();
			parameters.Add(OAuthConsumerKey, consumerKey);
			parameters.Add(OAuthVersionKey, OAuthVersion);
			parameters.Add(OAuthNonceKey, nonce);
			parameters.Add(OAuthTimestampKey, timeStamp);
			parameters.Add(OAuthSignatureMethodKey, OAuthSignatureMethod);

			normalizedRequestParameters = ParseRequestParameters(parameters);

			StringBuilder signatureBase = new StringBuilder();
			signatureBase.AppendFormat("{0}&", httpMethod.ToUpper());
			signatureBase.AppendFormat("{0}&", UrlEncode(url));
			signatureBase.AppendFormat("{0}", UrlEncode(normalizedRequestParameters));

			return signatureBase.ToString();

		}

		private const string unreservedChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.~";

		private static string UrlEncode(string value)
		{
			StringBuilder result = new StringBuilder();

			foreach (char symbol in value)
			{
				if (unreservedChars.IndexOf(symbol) != -1)
				{
					result.Append(symbol);
				}
				else
				{
					result.Append('%' + String.Format("{0:X2}", (int)symbol));
				}
			}

			return result.ToString();
		}

		static Random rnd = new Random();

		private static char GetRandomChar()
		{
			int ret = rnd.Next(122);
			while (ret < 48 || (ret > 57 && ret < 65) || (ret > 90 && ret < 97))
			{
				ret = rnd.Next(122);
			}
			return (char)ret;
		}

		private static string GetRandomString(int length)
		{
			StringBuilder sb = new StringBuilder(length);
			for (int i = 0; i < length; i++)
			{
				sb.Append(GetRandomChar());
			}
			return sb.ToString();
		}

		private static string GenerateSignature(string signatureType, string signatureBase, string consumerSecret)
		{
			switch (signatureType)
			{
				case "PLAINTEXT":
					return HttpUtility.UrlEncode(string.Format("{0}&", consumerSecret));
				case "HMAC-SHA1":
					HMACSHA1 hmacsha1 = new HMACSHA1();
					hmacsha1.Key = Encoding.ASCII.GetBytes(string.Format("{0}&", consumerSecret));

					return ComputeHash(hmacsha1, signatureBase);
				default:
					throw new ArgumentException("Unknown signature type", "signatureType");
			}
		}


		private static string ComputeHash(HashAlgorithm hashAlgorithm, string data)
		{
			if (hashAlgorithm == null)
			{
				throw new ArgumentNullException("hashAlgorithm");
			}

			if (string.IsNullOrEmpty(data))
			{
				throw new ArgumentNullException("data");
			}

			byte[] dataBuffer = System.Text.Encoding.ASCII.GetBytes(data);
			byte[] hashBytes = hashAlgorithm.ComputeHash(dataBuffer);

			return Convert.ToBase64String(hashBytes);
		}
	}
}