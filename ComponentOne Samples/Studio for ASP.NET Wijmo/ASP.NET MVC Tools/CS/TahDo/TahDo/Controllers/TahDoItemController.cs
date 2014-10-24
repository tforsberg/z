using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TahDo.Models;

namespace TahDo.Controllers
{ 
    public class TahDoItemController : Controller
    {
        private TahDoContext db = new TahDoContext();

        //
        // GET: /TahDoItem/

        public ViewResult Index()
        {
            var tahdoitems = db.TahDoItems.Include(t => t.TahDoList);
            return View(tahdoitems.ToList());
        }

        //
        // GET: /TahDoItem/Details/5

        public ViewResult Details(int id)
        {
            TahDoItem tahdoitem = db.TahDoItems.Find(id);
            return View(tahdoitem);
        }

        //
        // GET: /TahDoItem/Create

        public ActionResult Create()
        {
            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title");
            return View();
        } 

        //
        // POST: /TahDoItem/Create

        [HttpPost]
        public ActionResult Create(TahDoItem tahdoitem)
        {
            if (ModelState.IsValid)
            {
                db.TahDoItems.Add(tahdoitem);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title", tahdoitem.TahDoListId);
            return View(tahdoitem);
        }
        
        //
        // GET: /TahDoItem/Edit/5
 
        public ActionResult Edit(int id)
        {
            TahDoItem tahdoitem = db.TahDoItems.Find(id);
            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title", tahdoitem.TahDoListId);
            return View(tahdoitem);
        }

        //
        // POST: /TahDoItem/Edit/5

        [HttpPost]
        public ActionResult Edit(TahDoItem tahdoitem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tahdoitem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title", tahdoitem.TahDoListId);
            return View(tahdoitem);
        }

        //
        // GET: /TahDoItem/Delete/5
 
        public ActionResult Delete(int id)
        {
            TahDoItem tahdoitem = db.TahDoItems.Find(id);
            return View(tahdoitem);
        }

        //
        // POST: /TahDoItem/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            TahDoItem tahdoitem = db.TahDoItems.Find(id);
            db.TahDoItems.Remove(tahdoitem);
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