using System.IO;
using System.Text;

namespace MongoDB.Ajax.Core
{

    public class FileHelper
    {
        public static byte[] Read(string filePath)
        {

            return File.Exists(filePath) ? File.ReadAllBytes(filePath) : null;
        }

        #region File

        public static bool Delete(string filePath)
        {

            if(File.Exists(filePath))
            {
                File.Delete(filePath);
                return true;
            }

            return false;

        }


        public static string ReadText(string filePath)
        {
            return File.ReadAllText(filePath, Encoding.UTF8);

        }

        public static void Write(string filePath, string content)
        {
            using (StreamWriter w = File.AppendText(filePath))
            {

                try
                {
                    w.Write(content);
                    w.Flush();
                }
                finally
                {
                    w.Close();
                }

            }

        }

        #endregion
    }

}
