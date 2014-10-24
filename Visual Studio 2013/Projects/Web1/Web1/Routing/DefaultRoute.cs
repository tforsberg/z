// --------------------------------------------------------------------------------------------------------------------
// <copyright file="DefaultRoute.cs" company="Hewlett-Packard Company">
//   Copyright © 2014 Hewlett-Packard Company
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

namespace App.Web1.Routing
{
    using System.Web.Routing;

    public class DefaultRoute : Route
    {
        public DefaultRoute()
            : base("{*path}", new DefaultRouteHandler())
        {
            this.RouteExistingFiles = false;
        }
    }
}
