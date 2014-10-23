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
    [RoutePrefix("TahDoItems")]
    [Route("{action}/{id}")]
    public class TahDoItemsController : Controller
    {
        private TahDoContext db = new TahDoContext();

        // GET: TahDoItems
        [Route]
        public ActionResult Index()
        {
            var tahDoItems = db.TahDoItems.Include(t => t.TahDoList);
            return View(tahDoItems.ToList());
        }

        // GET: TahDoItems/Details/5
        public ActionResult Details(int id)
        {
            TahDoItem tahDoItem = db.TahDoItems.Find(id);
            if (tahDoItem == null)
            {
                return HttpNotFound();
            }
            return View(tahDoItem);
        }

        // GET: TahDoItems/Create
        [Route("Create")]
        public ActionResult Create()
        {
            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title");
            return View();
        }

        // POST: TahDoItems/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [Route("Create")]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include="Id,Title,CreatedAt,Priority,Note,TahDoListId,Done,DoneAt")] TahDoItem tahDoItem)
        {
            if (ModelState.IsValid)
            {
                db.TahDoItems.Add(tahDoItem);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title", tahDoItem.TahDoListId);
            return View(tahDoItem);
        }

        // GET: TahDoItems/Edit/5
        public ActionResult Edit(int id)
        {
            TahDoItem tahDoItem = db.TahDoItems.Find(id);
            if (tahDoItem == null)
            {
                return HttpNotFound();
            }
            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title", tahDoItem.TahDoListId);
            return View(tahDoItem);
        }

        // POST: TahDoItems/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include="Id,Title,CreatedAt,Priority,Note,TahDoListId,Done,DoneAt")] TahDoItem tahDoItem)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tahDoItem).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.TahDoListId = new SelectList(db.TahDoLists, "Id", "Title", tahDoItem.TahDoListId);
            return View(tahDoItem);
        }

        // GET: TahDoItems/Delete/5
        public ActionResult Delete(int id)
        {
            TahDoItem tahDoItem = db.TahDoItems.Find(id);
            if (tahDoItem == null)
            {
                return HttpNotFound();
            }
            return View(tahDoItem);
        }

        // POST: TahDoItems/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TahDoItem tahDoItem = db.TahDoItems.Find(id);
            db.TahDoItems.Remove(tahDoItem);
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
