using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace wijmoSample1.Controllers
{
    public class GalleryController : Controller
    {
        //
        // GET: /Gallery/

        public ActionResult Overview()
        {
            return View();
        }

		public ActionResult Ajax()
		{
			return View();
		}

		public ActionResult AjaxDoc()
		{
			string Html = "";
			Html += "http://placekitten.com/g/400/600|";
			Html += "http://placekitten.com/250/600|";
			Html += "http://placekitten.com/g/400/400|";
			Html += "http://placekitten.com/g/350/400|";
			Html += "http://placekitten.com/600/600|";
			Html += "http://placekitten.com/g/500/400|";
			Html += "http://placekitten.com/550/500|";
			Html += "http://placekitten.com/g/475/400";

			return Content(Html);
		}

		public ActionResult Animation()
		{
			return View();
		}

		public ActionResult Flash()
		{
			return View();
		}

		public ActionResult Iframe()
		{
			return View();
		}

		public ActionResult Orientation()
		{
			return View();
		}

		public ActionResult Paging()
		{
			return View();
		}

		public ActionResult Video()
		{
			return View();
		}
    }
}
