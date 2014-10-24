using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace wijmoSample1.Controllers
{
	public class HomeController : Controller
	{
		public ActionResult Index()
		{
			ViewBag.Message = "Welcome to ASP.NET MVC!";

			return View();
		}

		public ActionResult About()
		{
			return View();
		}

        public ActionResult Widgets()
        {
            return View();
        }

    [HttpPost]
        public JsonResult GetViewSource()
        {
            string controllerName = Request.Form["controllerName"];
            string actionName = Request.Form["actionName"];

            return Json(Utility.Source.GetViewSource(controllerName, actionName));
        }

        [HttpPost]
        public JsonResult GetControllerSource()
        {
            string controllerName = Request.Form["controllerName"];
            return Json(Utility.Source.GetControllerSource(controllerName));
        }

        [HttpPost]
        public JsonResult SaveThemeSession()
        {
            var themeName = Request.Form["theme"];
            if (themeName != "") {
                Session["Theme"] = themeName;
            }
            return Json("");
        }
	}
}
