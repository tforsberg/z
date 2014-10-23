using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using WijmoMvcApplication1.Models;

namespace WijmoMvcApplication1.Controllers
{
    [RoutePrefix("TahDoLists")]
    [Route("{action}/{id}")]
    public class TahDoListsController : Controller
    {
        private TahDoContext db = new TahDoContext();

        // GET: TahDoLists
        [Route]
        public ActionResult Index()
        {
            return View(db.TahDoLists.ToList());
        }

        // GET: TahDoLists/Details/5
        public ActionResult Details(int id)
        {
            TahDoList tahDoList = db.TahDoLists.Find(id);
            if (tahDoList == null)
            {
                return HttpNotFound();
            }
            return View(tahDoList);
        }

        // GET: TahDoLists/Create
        [Route("Create")]
        public ActionResult Create()
        {
            return View();
        }

        // POST: TahDoLists/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Route("Create")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Title,CreatedAt,Priority,Cost,Summary,Done,DoneAt")] TahDoList tahDoList)
        {
            if (ModelState.IsValid)
            {
                db.TahDoLists.Add(tahDoList);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(tahDoList);
        }

        // GET: TahDoLists/Edit/5
        public ActionResult Edit(int id)
        {
            TahDoList tahDoList = db.TahDoLists.Find(id);
            if (tahDoList == null)
            {
                return HttpNotFound();
            }
            return View(tahDoList);
        }

        // POST: TahDoLists/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Title,CreatedAt,Priority,Cost,Summary,Done,DoneAt")] TahDoList tahDoList)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tahDoList).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(tahDoList);
        }

        // GET: TahDoLists/Delete/5
        public ActionResult Delete(int id)
        {
            TahDoList tahDoList = db.TahDoLists.Find(id);
            if (tahDoList == null)
            {
                return HttpNotFound();
            }
            return View(tahDoList);
        }

        // POST: TahDoLists/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TahDoList tahDoList = db.TahDoLists.Find(id);
            db.TahDoLists.Remove(tahDoList);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
