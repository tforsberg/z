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
    public class TahDoListController : Controller
    {
        private TahDoContext db = new TahDoContext();

        //
        // GET: /TahDoList/

        public ViewResult Index()
        {
            return View(db.TahDoLists.ToList());
        }

        //
        // GET: /TahDoList/Details/5

        public ViewResult Details(int id)
        {
            TahDoList tahdolist = db.TahDoLists.Find(id);
            return View(tahdolist);
        }

        //
        // GET: /TahDoList/Create

        public ActionResult Create()
        {
            return View();
        } 

        //
        // POST: /TahDoList/Create

        [HttpPost]
        public ActionResult Create(TahDoList tahdolist)
        {
            if (ModelState.IsValid)
            {
                db.TahDoLists.Add(tahdolist);
                db.SaveChanges();
                return RedirectToAction("Index");  
            }

            return View(tahdolist);
        }
        
        //
        // GET: /TahDoList/Edit/5
 
        public ActionResult Edit(int id)
        {
            TahDoList tahdolist = db.TahDoLists.Find(id);
            return View(tahdolist);
        }

        //
        // POST: /TahDoList/Edit/5

        [HttpPost]
        public ActionResult Edit(TahDoList tahdolist)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tahdolist).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tahdolist);
        }

        //
        // GET: /TahDoList/Delete/5
 
        public ActionResult Delete(int id)
        {
            TahDoList tahdolist = db.TahDoLists.Find(id);
            return View(tahdolist);
        }

        //
        // POST: /TahDoList/Delete/5

        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {            
            TahDoList tahdolist = db.TahDoLists.Find(id);
            db.TahDoLists.Remove(tahdolist);
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