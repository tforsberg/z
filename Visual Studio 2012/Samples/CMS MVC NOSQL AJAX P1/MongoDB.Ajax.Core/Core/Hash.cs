using System;
using System.Linq;
using System.Security.Cryptography;
using System.Text;

namespace MongoDB.Ajax.Core
{
    public enum IEHashAlgorithm
    {
        MD5,
        SHA1,
        SHA256,
        SHA384,
        SHA512
    }

    public static class Hash
    {

        public static string Md5(this string plainText, int hashTime)
        {
            string hash = plainText;
            for (int i = 0; i < hashTime; i++)
            {
                hash = Md5(hash);
            }
            return hash;
        }

        public static string Md5(this string plainText)
        {
            return ComputeHash(plainText, IEHashAlgorithm.MD5, null);
        }

        public static string SHA1(this string plainText, int hashTime)
        {
            string hash = plainText;
            for (int i = 0; i < hashTime; i++)
            {
                hash = SHA1(hash);
            }
            return hash;
        }

        public static string SHA1(this string plainText)
        {
            return ComputeHash(plainText, IEHashAlgorithm.SHA1, null);
        }


        public static string SHA256(this string plainText, int hashTime)
        {
            string hash = plainText;
            for (int i = 0; i < hashTime; i++)
            {
                hash = SHA256(hash);
            }
            return hash;
        }

        public static string SHA256(this string plainText)
        {
            return ComputeHash(plainText, IEHashAlgorithm.SHA256, null);
        }

        public static string SHA384(this string plainText, int hashTime)
        {
            string hash = plainText;
            for (int i = 0; i < hashTime; i++)
            {
                hash = SHA384(hash);
            }
            return hash;
        }

        public static string SHA384(this string plainText)
        {
            return ComputeHash(plainText, IEHashAlgorithm.SHA384, null);
        }


        public static string SHA512(this string plainText, int hashTime)
        {
            string hash = plainText;
            for (int i = 0; i < hashTime; i++)
            {
                hash = SHA512(hash);
            }
            return hash;
        }

        public static string SHA512(this string plainText)
        {
            return ComputeHash(plainText, IEHashAlgorithm.SHA512, null);
        }



        public static string Password(string username, string password)
        {
            return Password(string.Format("{0}@{1}", username, password).ToLower());
        }


        public static string Password(this string password)
        {
            return SHA256(password);
        }

        public static string Password(this string password, int hashtime)
        {

            return SHA256(password, hashtime);
        }


        public static string ComputeHash(string plainText, IEHashAlgorithm hashAlgorithm, byte[] saltBytes)
        {

            //plainText = UTF8Encode(plainText);

            // If salt is not specified, generate it on the fly.
            if (saltBytes == null)
            {
                //// Define min and max salt sizes.
                //const int minSaltSize = 4;
                //const int maxSaltSize = 8;

                //// Generate a random number for the size of the salt.
                //var random = new Random();
                //int saltSize = random.Next(minSaltSize, maxSaltSize);

                //// Allocate a byte array, which will hold the salt.
                //saltBytes = new byte[saltSize];

                //// Initialize a random number generator.
                //var rng = new RNGCryptoServiceProvider();

                //// Fill the salt with cryptographically strong byte values.
                //rng.GetNonZeroBytes(saltBytes);

                return ComputeHash(plainText, hashAlgorithm);
            }

            // Convert plain text into a byte array.
            byte[] plainTextBytes = Encoding.UTF8.GetBytes(plainText);

            // Allocate array, which will hold plain text and salt.
            var plainTextWithSaltBytes = new byte[plainTextBytes.Length + saltBytes.Length];

            // Copy plain text bytes into resulting array.
            for (int i = 0; i < plainTextBytes.Length; i++)
                plainTextWithSaltBytes[i] = plainTextBytes[i];

            // Append salt bytes to the resulting array.
            for (int i = 0; i < saltBytes.Length; i++)
                plainTextWithSaltBytes[plainTextBytes.Length + i] = saltBytes[i];

            // Because we support multiple hashing algorithms, we must define
            // hash object as a common (abstract) base class. We will specify the
            // actual hashing algorithm class later during object creation.
            HashAlgorithm hash;

            // Initialize appropriate hashing algorithm class.
            switch (hashAlgorithm)
            {
                case IEHashAlgorithm.SHA1:
                    hash = new SHA1Managed();
                    break;

                case IEHashAlgorithm.SHA256:
                    hash = new SHA256Managed();
                    break;

                case IEHashAlgorithm.SHA384:
                    hash = new SHA384Managed();
                    break;

                case IEHashAlgorithm.SHA512:
                    hash = new SHA512Managed();
                    break;

                default:
                    hash = new MD5CryptoServiceProvider();
                    break;
            }

            // Compute hash value of our plain text with appended salt.
            byte[] hashBytes = hash.ComputeHash(plainTextWithSaltBytes);

            // Create array which will hold hash and original salt bytes.
            var hashWithSaltBytes = new byte[hashBytes.Length + saltBytes.Length];

            // Copy hash bytes into resulting array.
            for (int i = 0; i < hashBytes.Length; i++)
                hashWithSaltBytes[i] = hashBytes[i];

            // Append salt bytes to the result.
            for (int i = 0; i < saltBytes.Length; i++)
                hashWithSaltBytes[hashBytes.Length + i] = saltBytes[i];

            // Convert result into a base64-encoded string.
            string hashValue = ByteArrayToString(hashWithSaltBytes);// String.Concat(Array.ConvertAll(hashWithSaltBytes, x => x.ToString("x2")));  //Convert.ToBase64String(hashWithSaltBytes);

            // Return the result.
            return hashValue;
        }

        public static string ComputeHash(string input, IEHashAlgorithm hashAlgorithm)
        {

            Byte[] inputBytes = Encoding.UTF8.GetBytes(input);

            HashAlgorithm hash;

            // Initialize appropriate hashing algorithm class.
            switch (hashAlgorithm)
            {
                case IEHashAlgorithm.SHA1:
                    hash = new SHA1Managed();
                    break;

                case IEHashAlgorithm.SHA256:
                    hash = new SHA256Managed();
                    break;

                case IEHashAlgorithm.SHA384:
                    hash = new SHA384Managed();
                    break;

                case IEHashAlgorithm.SHA512:
                    hash = new SHA512Managed();
                    break;

                default:
                    hash = new MD5CryptoServiceProvider();
                    break;
            }

            Byte[] hashedBytes = hash.ComputeHash(inputBytes);

            return ByteArrayToString(hashedBytes);//BitConverter.ToString(hashedBytes).Replace("-",string.Empty);
        }


        /// <summary>
        /// Compares a hash of the specified plain text value to a given hash
        /// value. Plain text is hashed with the same salt value as the original
        /// hash.
        /// </summary>
        /// <param name="plainText">
        /// Plain text to be verified against the specified hash. The function
        /// does not check whether this parameter is null.
        /// </param>
        /// <param name="hashAlgorithm">
        /// Name of the hash algorithm. Allowed values are: "MD5", "SHA1", 
        /// "SHA256", "SHA384", and "SHA512" (if any other value is specified,
        /// MD5 hashing algorithm will be used). This value is case-insensitive.
        /// </param>
        /// <param name="hashValue">
        /// Base64-encoded hash value produced by ComputeHash function. This value
        /// includes the original salt appended to it.
        /// </param>
        /// <returns>
        /// If computed hash mathes the specified hash the function the return
        /// value is true; otherwise, the function returns false.
        /// </returns>
        public static bool VerifyHash(string plainText, IEHashAlgorithm hashAlgorithm, string hashValue)
        {

            // Convert base64-encoded hash value into a byte array.
            byte[] hashWithSaltBytes = Convert.FromBase64String(hashValue);

            // We must know size of hash (without salt).
            int hashSizeInBits;



            // Size of hash is based on the specified algorithm.
            switch (hashAlgorithm)
            {
                case IEHashAlgorithm.SHA1:
                    hashSizeInBits = 160;
                    break;

                case IEHashAlgorithm.SHA256:
                    hashSizeInBits = 256;
                    break;

                case IEHashAlgorithm.SHA384:
                    hashSizeInBits = 384;
                    break;

                case IEHashAlgorithm.SHA512:
                    hashSizeInBits = 512;
                    break;

                default: // Must be MD5
                    hashSizeInBits = 128;
                    break;
            }

            // Convert size of hash from bits to bytes.
            int hashSizeInBytes = hashSizeInBits / 8;

            // Make sure that the specified hash value is long enough.
            if (hashWithSaltBytes.Length < hashSizeInBytes)
                return false;

            // Allocate array to hold original salt bytes retrieved from hash.
            var saltBytes = new byte[hashWithSaltBytes.Length - hashSizeInBytes];

            // Copy salt from the end of the hash to the new array.
            for (int i = 0; i < saltBytes.Length; i++)
                saltBytes[i] = hashWithSaltBytes[hashSizeInBytes + i];

            // Compute a new hash string.
            string expectedHashString =
                        ComputeHash(plainText, hashAlgorithm, saltBytes);

            // If the computed hash matches the specified hash,
            // the plain text value must be correct.
            return (hashValue == expectedHashString);
        }


        //private static string UTF8Encode(string text)
        //{
        //    var utf8 = new UTF8Encoding();
        //    var bytes = utf8.GetBytes(text);
        //    return bytes.ToString();
        //}

        /*  private static byte[] HexStringToByteArray(string hexString)
          {
              int hexStringLength = hexString.Length;
              byte[] b = new byte[hexStringLength / 2];
              for (int i = 0; i < hexStringLength; i += 2)
              {
                  int topChar = (hexString[i] > 0x40 ? hexString[i] - 0x37 : hexString[i] - 0x30) << 4;
                  int bottomChar = hexString[i + 1] > 0x40 ? hexString[i + 1] - 0x37 : hexString[i + 1] - 0x30;
                  b[i / 2] = Convert.ToByte(topChar + bottomChar);
              }
              return b;
          }*/


        public static string ByteArrayToString(byte[] bytes)
        {

            // concat the bytes into one long string
            return bytes.Aggregate(new StringBuilder(bytes.Length * 2), (sb, b) => sb.Append(b.ToString("x2"))).ToString();
        }


    }
}
