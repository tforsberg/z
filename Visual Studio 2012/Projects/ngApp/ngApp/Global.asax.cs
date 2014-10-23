// --------------------------------------------------------------------------------------------------------------------
// <copyright file="Global.asax.cs" company="Hewlett-Packard Company">
//   Copyright © 2014 Hewlett-Packard Company
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

namespace App.ngApp
{
    using System.Web;
    using System.Web.Optimization;
    using System.Web.Routing;

    public class Application : HttpApplication
    {
        protected void Application_Start()
        {
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}
