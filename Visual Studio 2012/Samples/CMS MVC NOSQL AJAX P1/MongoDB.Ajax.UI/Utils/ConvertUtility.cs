using System;

namespace MongoDB.Ajax.Business
{
        public class ConvertUtility
        {
            public static string FormatTimeVn(DateTime dt, string defaultText)
            {
                if (ToDateTime(dt) != new DateTime(1900, 1, 1))
                    return dt.ToString("dd-mm-yy");
                else
                    return defaultText;
            }
            public static double ToDouble1(string obj)
            {
                double retVal;
                try
                {
                    obj = obj.Replace(",", "").Replace(".", ",").Replace(" ", "");

                    retVal = Convert.ToDouble(obj);
                }
                catch
                {
                    retVal = 0;
                }

                return retVal;
            }
            public static int ToInt32(object obj)
            {
                int retVal = 0;

                try
                {
                    retVal = Convert.ToInt32(obj);
                }
                catch
                {
                    retVal = 0;
                }

                return retVal;
            }

            public static decimal ToDecimal(object obj)
            {
                decimal retVal = 0;

                try
                {
                    retVal = Convert.ToDecimal(obj);
                }
                catch
                {
                    retVal = 0;
                }

                return retVal;
            }

            public static int ToInt32(object obj, int defaultValue)
            {
                int retVal = defaultValue;

                try
                {
                    retVal = Convert.ToInt32(obj);
                }
                catch
                {
                    retVal = defaultValue;
                }

                return retVal;
            }

            public static string ToString(object obj)
            {
                string retVal;

                try
                {
                    retVal = Convert.ToString(obj);
                }
                catch
                {
                    retVal = String.Empty;
                }

                return retVal;
            }

            public static DateTime ToDateTime(object obj)
            {
                DateTime retVal;
                try
                {
                    retVal = Convert.ToDateTime(obj);
                }
                catch
                {
                    retVal = DateTime.Now;
                }
                if (retVal == new DateTime(1, 1, 1)) return DateTime.Now;

                return retVal;
            }

            public static DateTime ToDateTime(object obj, DateTime defaultValue)
            {
                DateTime retVal;
                try
                {
                    retVal = Convert.ToDateTime(obj);
                }
                catch
                {
                    retVal = DateTime.Now;
                }
                if (retVal == new DateTime(1, 1, 1)) return defaultValue;

                return retVal;
            }

            public static bool ToBoolean(object obj)
            {
                bool retVal;

                try
                {
                    retVal = Convert.ToBoolean(obj);
                }
                catch
                {
                    retVal = false;
                }

                return retVal;
            }

            public static double ToDouble(object obj)
            {
                double retVal;

                try
                {
                    retVal = Convert.ToDouble(obj);
                }
                catch
                {
                    retVal = 0;
                }

                return retVal;
            }

            public static double ToDouble(object obj, double defaultValue)
            {
                double retVal;

                try
                {
                    retVal = Convert.ToDouble(obj);
                }
                catch
                {
                    retVal = defaultValue;
                }

                return retVal;
            }

            
        }
}
