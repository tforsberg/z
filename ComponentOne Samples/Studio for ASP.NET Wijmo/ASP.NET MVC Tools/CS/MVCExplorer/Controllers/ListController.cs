using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using wijmoSample1.Models;

namespace wijmoSample1.Controllers
{
    public class ListController : Controller
    {
        NorthwindEntities northwind = new NorthwindEntities();
        //
        // GET: /List/

        public ActionResult Overview()
        {
            return View();
        }

        public ActionResult MultipleSelection()
        {
            return View();
        }

        public ActionResult DataBound()
        {
            ViewBag.Message = "Products";
            var products = northwind.Products.ToList();
            return View(products);
        }
    }
}
