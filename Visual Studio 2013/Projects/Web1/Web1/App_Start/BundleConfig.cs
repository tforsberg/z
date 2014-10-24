// --------------------------------------------------------------------------------------------------------------------
// <copyright file="BundleConfig.cs" company="Hewlett-Packard Company">
//   Copyright © 2014 Hewlett-Packard Company
// </copyright>
// --------------------------------------------------------------------------------------------------------------------

namespace App.Web1
{
    using System.Web;
    using System.Web.Optimization;

    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new StyleBundle("~/content/css/app").Include("~/content/app.css"));

            //bundles.Add(new ScriptBundle("~/js/jquery").Include("~/scripts/vendor/jquery-{version}.js"));

            bundles.Add(new ScriptBundle("~/js/app").Include(
                "~/Scripts/jquery-2.1.1.js",
                "~/Scripts/angular.js",
                "~/scripts/vendor/angular-ui-router.js",
                "~/Scripts/angular-ui.js",
                "~/Scripts/angular-ui/ui-bootstrap-tpls.js",
                "~/Scripts/angular-classy/angular-classy.js",
                "~/scripts/filters.js",
                "~/scripts/services.js",
                "~/scripts/directives.js",
                "~/scripts/controllers.js",
                "~/scripts/app.js",
                "~/Views/index.js"));
        }
    }
}
