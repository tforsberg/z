using System;
using System.Linq;
using System.Web.Mvc;

namespace MongoDB.Ajax.Core.Extensions
{
    public static class RequestExtensions
    {
        public static T Request<T>(this Controller controller) where T : class, new()
        {
            T o = new T();
            var request = controller.Request;
            foreach (var property in typeof(T).GetProperties())
            {
                // Check if the object has the appropriate property
                var q = (request.Form.AllKeys
                    .Where(s => s.ToLower() == property.Name.ToLower()))
                    .ToList();

                // if more than one... ignore
                if (q.Count == 1)
                {
                    string datum = request.Form[q[0]];
                    property.SetValue(o,
                                      property.PropertyType == typeof(string)
                                          ? datum
                                          : Convert.ChangeType(datum, property.PropertyType), null);
                }
            }

            return o;
        }
    }
}
