// --------------------------------------------------------------------------------------------------------------------
// <copyright file="RouteConfig.cs" company="Hewlett-Packard Company">
//   Copyright © 2014 Hewlett-Packard Company
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

namespace App.Web1
{
    using System.Web.Routing;

    using App.Web1.Routing;

    public class RouteConfig
    {
        public static void RegisterRoutes(RouteCollection routes)
        {
            routes.Add("Default", new DefaultRoute());
        }
    }
}
