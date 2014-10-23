using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.ComponentModel;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web.Script.Serialization;

namespace MongoDB.Ajax.Core.Extensions
{
    public static class ObjectExtensions
    {

        public static bool IsNullable<T>(this T obj)
        {
            if (!typeof(T).IsGenericType)
                return false;

            return typeof(T).GetGenericTypeDefinition() == typeof(Nullable<>);
        }


        public static bool IsBoolean(this object o)
        {
            try
            {
                bool b = (bool)o;
                return true;
            }
            catch
            {

                return false;
            }
        }

        public static bool IsNumeric(this object o)
        {
            if (o == null)
                return false;

            double number;
            return Double.TryParse(Convert.ToString(o, CultureInfo.InvariantCulture), NumberStyles.Any, NumberFormatInfo.InvariantInfo, out number);
        }

       /* public static string ToJSON(this object o)
        {

            /* var serializer = new JavaScriptSerializer();
             //var serializer =new DataContractSerializer(typeof(obj));
             return serializer.Serialize(obj);#1#


            using (var stream = new MemoryStream())
            {
                var serializer =
                   new DataContractJsonSerializer(o.GetType());
                serializer.WriteObject(stream, o);
                return Encoding.UTF8.GetString(stream.ToArray());
            }


        }*/

        //http://tiredblogger.wordpress.com/2007/10/03/to-and-fromjson-extension-methods/
        public static string ToJSON(this object o, bool useDataContract = false)
        {
            
            if (useDataContract)
            {
                using (var stream = new MemoryStream())
                {
                    var serializer =
                       new DataContractJsonSerializer(o.GetType());
                    serializer.WriteObject(stream, o);
                    return Encoding.UTF8.GetString(stream.ToArray());
                }

            }
            else
            {
                var serializer = new JavaScriptSerializer();
                return serializer.Serialize(o);
            }



        }

        public static T FromJSON<T>(this string str)
        {
            var serializer = new JavaScriptSerializer();
            return serializer.Deserialize<T>(str);
        }

        public static string ToJSON(this object obj, int recursionDepth)
        {
            var serializer = new JavaScriptSerializer { RecursionLimit = recursionDepth };
            return serializer.Serialize(obj);
        }



        static public IDictionary<string, object> ToDictionary(this object o)
        {
            return o.GetType().GetProperties()
                .Select(n => n.Name)
                .ToDictionary(k => k, k => o.GetType().GetProperty(k).GetValue(o, null));
        }

        public static void UpdateFrom(this object value, NameValueCollection values, string objectPrefix)
        {
            Type objType = value.GetType();
            string objName = objType.Name;

            // TODO: Use ComponentModel instead of Reflection to get/set the properties
            PropertyInfo[] fields = objType.GetProperties();

            

            foreach (PropertyInfo property in fields)
            {
                //check the key
                //going to be forgiving here, allowing for full declaration
                //or just propname
                string httpKey = property.Name;

                if (!String.IsNullOrEmpty(objectPrefix))
                    httpKey = objectPrefix + httpKey;

                if (values[httpKey] == null)
                {
                    httpKey = objName + "." + property.Name;
                }

                if (values[httpKey] == null)
                {
                    httpKey = objName + "_" + property.Name;
                }


                if (values[httpKey] != null)
                {
                    TypeConverter conv = TypeDescriptor.GetConverter(property.PropertyType);
                    object thisValue = values[httpKey];

                    if (conv.CanConvertFrom(typeof(string)))
                    {
                        try
                        {
                            thisValue = conv.ConvertFrom(values[httpKey]);
                            property.SetValue(value, thisValue, null);

                        }
                        catch (FormatException e)
                        {
                            string message = property.Name + " is not a valid " + property.PropertyType.Name + "; " + e.Message;
                           
                        }
                    }
                    else
                    {
                        // TODO: Why do we throw an exception here instead of setting "ex"?
                        throw new FormatException("No type converter available for type: " + property.PropertyType);
                    }
                }
            }
          
        }
    }
}
