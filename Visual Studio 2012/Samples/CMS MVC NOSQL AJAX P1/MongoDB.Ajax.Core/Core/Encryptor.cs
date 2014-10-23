using System;
using System.Configuration;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace MongoDB.Ajax.Core
{
    public sealed class Encryptor
    {
        // private static string _secretKey = "Kaio";


        public static string SecretKey
        {
            get
            {
                string _secretKey = ConfigurationManager.AppSettings["SecretKey"];
                if (!string.IsNullOrEmpty(_secretKey))
                    return _secretKey;
                return "{^^^__^^^}";
            }
        }


        public static byte[] Encrypt(byte[] _input, string password)
        {
            try
            {
                var _service = new TripleDESCryptoServiceProvider();
                var _md5 = new MD5CryptoServiceProvider();

                byte[] _key = _md5.ComputeHash(Encoding.ASCII.GetBytes(password));
                byte[] _iv = _md5.ComputeHash(Encoding.ASCII.GetBytes(password));

                return Transform(_input, _service.CreateEncryptor(_key, _iv));
            }
            catch (Exception e)
            {
                throw new InvalidOperationException(e.ToString());
            }
        }

        public static byte[] Decrypt(byte[] _Input, string _Password)
        {
            try
            {
                var _service = new TripleDESCryptoServiceProvider();
                var _md5 = new MD5CryptoServiceProvider();

                byte[] _key = _md5.ComputeHash(Encoding.ASCII.GetBytes(_Password));
                byte[] _iv = _md5.ComputeHash(Encoding.ASCII.GetBytes(_Password));

                return Transform(_Input, _service.CreateDecryptor(_key, _iv));
            }
            catch (Exception e)
            {
                throw new InvalidOperationException(e.ToString());
            }
        }

        public static string Encrypt(string text, string password)
        {
            byte[] _input = Encoding.UTF8.GetBytes(text);
            byte[] _output = Encrypt(_input, password);
            return Convert.ToBase64String(_output);
        }

        public static string Decrypt(string _Text, string _Password)
        {
            byte[] _input = Convert.FromBase64String(_Text);
            byte[] _output = Decrypt(_input, _Password);
            return Encoding.UTF8.GetString(_output);
        }

        private static byte[] Transform(byte[] input, ICryptoTransform cryptoTransform)
        {
            var _memStream = new MemoryStream();
            var _cryptStream = new CryptoStream(_memStream, cryptoTransform, CryptoStreamMode.Write);

            _cryptStream.Write(input, 0, input.Length);
            _cryptStream.FlushFinalBlock();

            _memStream.Position = 0;
            var _result = new byte[Convert.ToInt32(_memStream.Length)];
            _memStream.Read(_result, 0, Convert.ToInt32(_result.Length));

            _memStream.Close();
            _cryptStream.Close();

            return _result;
        }

        /// <summary>
        /// Encrypt the given value with the Rijndael algorithm.
        /// </summary>
        /// <param name="encryptValue">Value to encrypt</param>
        /// <returns>Encrypted value. </returns>
        public static string Encrypt(string encryptValue)
        {
            try
            {
                if (!string.IsNullOrEmpty(encryptValue))
                {
                    return Encrypt(encryptValue, SecretKey);
                }
            }
            catch (Exception _ex)
            {
                throw new InvalidOperationException(_ex.Message);
            }
            return null;
        }


        /// <summary>
        /// Decrypt the given value with the Rijndael algorithm.
        /// </summary>
        /// <param name="decryptValue">Value to decrypt</param>
        /// <returns>Decrypted value. </returns>
        public static string Decrypt(string decryptValue)
        {
            try
            {
                if (!string.IsNullOrEmpty(decryptValue))
                {
                    return Decrypt(decryptValue, SecretKey);
                }
            }
            catch (Exception _ex)
            {
                throw new InvalidOperationException(_ex.Message);
            }
            return "";
        }


        public static string EncryptPassword(string userName, string password)
        {
            string _pwd = userName.ToLower() + "@" + password;
            return Encrypt(_pwd);
        }

        public static string Password(string userName, string password)
        {
            string _pwd = userName.ToLower() + "@" + password;
            return Encrypt(_pwd, password);
        }

        #region Encode - Decode

        private static readonly char[] _KEY = "@42d4e309add544f9bcd7d3b7f8a44266".ToCharArray();

        #region UseRandomKeyEncypt

        private static bool UseRandomKeyEncypt
        {
            get { return Convert.ToBoolean(ConfigurationManager.AppSettings["UseRandomKeyEncypt"]); }
        }

        #endregion

        public static string Base64Encode(object input)
        {
            try
            {
                if (input == null || string.IsNullOrEmpty(input.ToString()))
                    return "";

                byte[] _b = (new UTF8Encoding()).GetBytes(input.ToString());
                return Convert.ToBase64String(_b);
            }
            catch (Exception _ex)
            {
                throw new Exception("Error in base64Encode " + _ex.Message);
            }
        }

        public static string Base64Decode(object input)
        {
            try
            {
                if (input == null || string.IsNullOrEmpty(input.ToString()))
                    return "";

                byte[] _b = Convert.FromBase64String(input.ToString());
                return (new UTF8Encoding()).GetString(_b);
            }
            catch (Exception _ex)
            {
                throw new Exception("Error in base64Decode" + _ex.Message);
            }
        }

        public static string Encode(object _Input)
        {
            if (_Input == null || string.IsNullOrEmpty(_Input.ToString())) return "";

            char[] _ca = Base64Encode(_Input).ToCharArray();

            StringBuilder _sb;

            if (UseRandomKeyEncypt)
            {
                int _k = new Random().Next(255);

                _sb = _k > 15
                          ? new StringBuilder("" + Convert.ToString(_k, 16))
                          : new StringBuilder("0" + Convert.ToString(_k, 16));
            }
            else
            {
                _sb = new StringBuilder(Convert.ToString(118, 16));
            }

            int _m = Convert.ToInt32(_sb.ToString(), 16);
            for (int _i = 0; _i < _ca.Length; _i++)
            {
                if ((_ca[_i] + _m) > 255)
                {
                    _m = ((_ca[_i] + _m) - 255) ^ _KEY[_i%13];
                }
                else
                {
                    _m = (_ca[_i] + _m) ^ _KEY[_i%13];
                }
                if (_m > 15)
                {
                    _sb.Append(Convert.ToString(_m, 16));
                }
                else
                {
                    _sb.Append("0" + Convert.ToString(_m, 16));
                }
            }
            return _sb.ToString().ToUpper();
        }


        public static string Decode(object _Input)
        {
            try
            {
                if (_Input == null || string.IsNullOrEmpty(_Input.ToString())) return "";

                var _sb = new StringBuilder();
                char[] _ca = _Input.ToString().ToCharArray();
                for (int _i = 0; _i < (_ca.Length - 2); _i += 2)
                {
                    string _s1 = "" + _ca[_i + 2] + _ca[_i + 3];
                    string _s2 = "" + Convert.ToString((byte) _KEY[(_i/2)%13], 16);
                    string _s3 = "" + _ca[_i] + _ca[_i + 1];
                    int _m = (Convert.ToInt32(_s1, 16) ^ Convert.ToInt32(_s2, 16)) - Convert.ToInt32(_s3, 16);
                    if (_m < 0)
                    {
                        _m += 255;
                    }
                    _sb.Append((char) ((short) _m));
                }
                return Base64Decode(_sb);
            }
            catch (Exception _ex)
            {
                throw new InvalidOperationException(_ex.Message);
            }
        }

        #region Encode - Decode With Unicode

        public static string Encode(object _Input, bool _Unicode)
        {
            if (_Unicode)
                return Encode(Base64Encode(_Input));
            return Encode(_Input);
        }

        public static string Decode(object _Input, bool _Unicode)
        {
            if (_Unicode)
                return Base64Decode(Decode(_Input));
            return Decode(_Input);
        }

        #endregion

        #endregion
    }
}