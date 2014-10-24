using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;

namespace wijmoSample1.Utility
{
    public static class Source
    {
        public static string GetViewSource(string controllerName, string actionName)
        {
            string path = HttpContext.Current.Server.MapPath(string.Format("~/Views/{0}/{1}.cshtml", controllerName, actionName));
            StreamReader sr = new StreamReader(path);
            return sr.ReadToEnd().Trim();
        }

        public static string GetModelSource()
        {
            return "";
        }

        public static string GetControllerSource(string controllerName)
        {
            string path = HttpContext.Current.Server.MapPath(string.Format("~/Controllers/{0}Controller.cs", controllerName));
            StreamReader sr = new StreamReader(path);
            return sr.ReadToEnd().Trim();
        }

    }
}