using System.Web;
using System.Web.Mvc;

namespace MongoDB.Ajax.Cms
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}