using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MongoDB.Ajax.Core.Extensions
{
    public static class DictionaryExtensions
    {
        public static void Merge(this IDictionary<string, string> collection, string key, object value)
        {
            collection.Merge(key, value, false);
        }

        public static void Merge(this IDictionary<string, string> collection, string key, object value, bool replaceExisting)
        {
            if (string.IsNullOrEmpty(key))
            {
                throw new ArgumentException("Value cannot be null or empty.", "key");
            }

            if (replaceExisting || !collection.ContainsKey(key))
            {
                collection[key] = value.ToString();
            }
        }

        public static string GetValue(this IDictionary<string, string> collection, string key)
        {
            if (collection.ContainsKey(key))
            {
                return collection[key];
            }

            return null;
        }


        public static T Get<T>(this IDictionary<string,object> collection, string key) where T : class
        {
            try
            {
                return (T)collection[key];
            }
            catch
            {
                return null;
            }
        }

      

       /* public static SelectList ToSelectList<TEnum>(this TEnum enumObj)
        {
            var values = from TEnum e in Enum.GetValues(typeof(TEnum))
                         select new { Id = (int)Enum.Parse(typeof(TEnum), e.ToString()), Name = e.ToString() };

            return new SelectList(values, "Id", "Name", (int)Enum.Parse(typeof(TEnum), enumObj.ToString()));
        }
*/


    }
}
