using System;
using System.Web.Mvc;
using MongoDB.Ajax.Business;
using MongoDB.Ajax.Business.Models;
using MongoDB.Ajax.Business.Repo;
using MongoDB.Ajax.Core;
using MongoDB.Ajax.Core.Extensions;
using MongoDB.Bson;

namespace MongoDB.Ajax.Cms.Controllers
{
    [Authorize]
    public class NewsController : Controller
    {
        //
        // GET: /News/

        private readonly NewsRepo _repo = new NewsRepo();

        public ActionResult Index(FormCollection f)
        {

            if (f["act"] == "del")
            {

                _repo.Remove(Utils.Split(f["id"]));

            }
            
            long _totalRows;
            var _data = _repo.Search(f["kwd"], IWebContext.PageIndex, IWebContext.Configuration.PageSize, out _totalRows);

            const string _url = "/News/?P={0}";

            ViewBag.Paging = IWebContext.PageRender(_url, _totalRows);

            if (Request.IsAjaxRequest() && string.IsNullOrWhiteSpace(Request.QueryString["f"]))
            {
                return PartialView("List", _data);
            }


            return View(_data);
        }

        public ActionResult Add()
        {
            string _id = Request.QueryString["id"];
            
            News _o = !string.IsNullOrWhiteSpace(_id) ? _repo.Info(_id) : new News();

            if( Request.QueryString["copy"]=="1")
            {
                _o.Id = ObjectId.Empty;
                _o.Url = string.Empty;

            }

            return View(_o);

        }

        public ActionResult Remove(string id)
        {
            _repo.Remove(id);
            return RedirectToAction("Index");
        }

        
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Save(FormCollection f)
        {

            var _o = !string.IsNullOrWhiteSpace(f["id"]) && !ObjectId.Parse(f["id"]).Equals(ObjectId.Empty) ? _repo.Info(f["id"]) : new News();
           
            TryUpdateModel(_o);

            if (string.IsNullOrWhiteSpace(f["url"]))
            {
                _o.Url = f["title"].ToFriendUrl();
            }
            _repo.Save(_o);

            return RedirectToAction("Index");
        }
    }
}
