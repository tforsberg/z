using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using EventPlanner.Models;

namespace EventPlanner.Controllers
{
    public class CalendarController : Controller
    {
        private EventPlannerEntities db = new EventPlannerEntities();

		public JsonResult GetEvents()
		{
			return Json(db.Events, JsonRequestBehavior.AllowGet);
		}

        //
        // GET: /Calendar/
        public ActionResult Index()
        {
            return View(db.Events.ToList());
        }

        //
        // GET: /Calendar/Details/5

        public ActionResult Details(int id = 0)
        {
            EventObj eventobj = db.Events.Find(id);
            if (eventobj == null)
            {
                return HttpNotFound();
            }
            return View(eventobj);
        }

        //
        // GET: /Calendar/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Calendar/Create

        [HttpPost]
        public ActionResult Create(EventObj eventobj)
        {
            if (ModelState.IsValid)
            {
                db.Events.Add(eventobj);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(eventobj);
        }

        //
        // GET: /Calendar/Edit/5

        public ActionResult Edit(int id = 0)
        {
            EventObj eventobj = db.Events.Find(id);
            if (eventobj == null)
            {
                return HttpNotFound();
            }
            return View(eventobj);
        }

        //
        // POST: /Calendar/Edit/5

        [HttpPost]
        public ActionResult Edit(EventObj eventobj)
        {
            if (ModelState.IsValid)
            {
                db.Entry(eventobj).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(eventobj);
        }

        //
        // GET: /Calendar/Delete/5

        public ActionResult Delete(int id = 0)
        {
            EventObj eventobj = db.Events.Find(id);
            if (eventobj == null)
            {
                return HttpNotFound();
            }
            return View(eventobj);
        }

        //
        // POST: /Calendar/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            EventObj eventobj = db.Events.Find(id);
            db.Events.Remove(eventobj);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}