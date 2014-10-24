using System.Web;
using System.Web.Mvc;

namespace ASP.NET_MVC5_with_Bootstrap_3._1._1_LESS1
{
    public class FilterConfig
    {
        public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
        }
    }
}
