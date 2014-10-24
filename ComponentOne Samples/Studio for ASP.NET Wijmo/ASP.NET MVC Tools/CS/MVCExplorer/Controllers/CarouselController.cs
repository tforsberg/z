using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace wijmoSample1.Controllers
{
    public class CarouselController : Controller
    {
        //
        // GET: /Carousel/

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
			Html += "http://static.flickr.com/66/199481236_dc98b5abb3_s.jpg|";
			Html += "http://static.flickr.com/75/199481072_b4a0d09597_s.jpg|";
			Html += "http://static.flickr.com/57/199481087_33ae73a8de_s.jpg|";
			Html += "http://static.flickr.com/77/199481108_4359e6b971_s.jpg|";
			Html += "http://static.flickr.com/58/199481143_3c148d9dd3_s.jpg|";
			Html += "http://static.flickr.com/72/199481203_ad4cdcf109_s.jpg|";
			Html += "http://static.flickr.com/58/199481218_264ce20da0_s.jpg|";
			Html += "http://static.flickr.com/69/199481255_fdfe885f87_s.jpg|";
			Html += "http://static.flickr.com/60/199480111_87d4cb3e38_s.jpg|";
			Html += "http://static.flickr.com/70/229228324_08223b70fa_s.jpg";

			return Content(Html);
		}

		public ActionResult Animation()
		{
			return View();
		}

		public ActionResult Content()
		{
			return View();
		}

		public ActionResult CustomControl()
		{
			return View();
		}

		public ActionResult Events()
		{
			return View();
		}

		public ActionResult Flickr()
		{
			return View();
		}
		public ActionResult Lightbox()
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

		public ActionResult Preview()
		{
			return View();
		}

		public ActionResult Thumbnails()
		{
			return View();
		}

		public ActionResult Videos()
		{
			return View();
		}

    }
}
