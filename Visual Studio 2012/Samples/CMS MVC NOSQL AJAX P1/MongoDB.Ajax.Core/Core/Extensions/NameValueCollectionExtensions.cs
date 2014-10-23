using System;
using System.Collections.Specialized;
using System.ComponentModel;

namespace MongoDB.Ajax.Core.Extensions
{
    public static class NameValueCollectionExtensions
    {

        public static T GetValue<T>(this NameValueCollection collection, string key)
        {
            if (collection == null)
            {
                throw new ArgumentNullException("collection");
            }

            var value = collection[key];
            var type = typeof(T);

            if (value == null)
            {
                if (type.IsGenericType && type.GetGenericTypeDefinition() == typeof(Nullable<>))
                    return default(T);
            }
            else
            {
                var typeConverter = TypeDescriptor.GetConverter(type);
                if (typeConverter != null)
                    return (T)(typeConverter.ConvertFrom(value));
            }

            var m = type.GetMethod("Parse", new Type[] { typeof(string) });
            if (m != null) { return (T)m.Invoke(null, new object[] { value }); }


            throw new ArgumentException(String.Format("Cannot convert '{0}' to {1}", value, type));

           
        }


    }
}
