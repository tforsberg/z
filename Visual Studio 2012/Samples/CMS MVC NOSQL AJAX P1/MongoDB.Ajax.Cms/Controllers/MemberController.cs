using System;
using System.Collections;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web.Mvc;
using MongoDB.Ajax.Business;
using MongoDB.Ajax.Business.Enums;
using MongoDB.Ajax.Business.Models;
using MongoDB.Ajax.Business.Repo;
using MongoDB.Ajax.Core;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;

namespace MongoDB.Ajax.Cms.Controllers
{

    [Authorize]
    public class MemberController : Controller
    {
        //
        // GET: /Member/

        private readonly UsersRepo _repo = new UsersRepo();

        public ActionResult Index(FormCollection f)
        {

            var _role = new RoleRepo();

            if (f["act"] == "del")
            {
                _repo.Remove(Utils.Split(f["id"]));
            }

            ViewBag.Roles = _role.List();

            long _totalRows;
            IMongoSortBy _sort = SortBy<User>.Descending(x => x.Created);
            IMongoQuery _query = Query.Null;
            if (f.Count > 0)
            {
                var _kwd = f["kwd"];
                var _dir = f["dir"];
                var _sortBy = f["sort"];
                var _stt = f["stt"];
                var _roleId = f["rid"];

                var _queries =
                    MainDb.Map(
                        Query.And(Query<User>.GTE(x => x.Created, DateTime.Parse(f["from"])),
                                  Query<User>.LTE(x => x.Created, DateTime.Parse(f["to"]))),

                        !string.IsNullOrWhiteSpace(_stt)
                            ? Query<User>.EQ(x => x.Status, int.Parse(_stt))
                            : Query.Null,
                        !string.IsNullOrWhiteSpace(_roleId)
                            ? Query<User>.EQ(x => x.RoleId, ObjectId.Parse(_roleId))
                            : Query.Null,
                        !string.IsNullOrWhiteSpace(_kwd)
                            ? Query.Or(
                                Query<User>.Matches(x => x.UserName,
                                                    BsonRegularExpression.Create(new Regex(_kwd, RegexOptions.IgnoreCase))),
                                Query<User>.Matches(x => x.Address,
                                                    BsonRegularExpression.Create(new Regex(_kwd, RegexOptions.IgnoreCase))),
                                Query<User>.Matches(x => x.FullName,
                                                    BsonRegularExpression.Create(new Regex(_kwd, RegexOptions.IgnoreCase)))
                                  )
                            : Query.Null);

                if (_queries.Count > 0)
                {
                    _query = Query.And(_queries);

                }


                _sort = _dir.ToLower() == "asc" ? SortBy.Ascending(_sortBy) : SortBy.Descending(_sortBy);

            }


            var _data = _repo.Search(_query, _sort, IWebContext.PageIndex, IWebContext.Configuration.PageSize, out _totalRows);

            if (Request.IsAjaxRequest() && string.IsNullOrWhiteSpace(Request.QueryString["f"]))
            {

                return PartialView("List", _data);

            }
            return View(_data);

        }

        public ActionResult Remove(string id)
        {
            _repo.Remove(id);
            return RedirectToAction("Index");
        }
        [AllowAnonymous]
        public ActionResult Logout()
        {
            IWebContext.SignOut();

            if (Request.IsAjaxRequest())
            {
                return JavaScript("$.jump('/')");
            }

            return Redirect("/");
        }

        [AllowAnonymous]
        public ActionResult Login()
        {
            if (IWebContext.IsLogined)
                return Redirect("/");

            return View();
        }

        [AllowAnonymous]
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(FormCollection f)
        {

            var _msg = Msg.Create();
            var _pwd = f["pwd"].Password();
            var _user = f["uid"];
            UserInfo _u = null;
            if (_user.Equals(ConfigurationManager.AppSettings["uid"]) && _pwd.Equals(ConfigurationManager.AppSettings["pwd"]))
            {

                _u = new UserInfo()
                         {
                             IsAdmin = true,
                             UserName = _user,
                             Pwd = _pwd,
                         };
                var _uc = UsersRepo.LogIn(_u.UserName, _u.Pwd, true);
                if (_uc == null)
                {
                    var _userInfo = new User()
                                        {
                                            UserName = _u.UserName,
                                            Pwd = _u.Pwd,
                                            Status = (int)UserStatus.Actived,
                                            FullName = "Administrator",
                                            Email = "user@nha3mien.com"
                                        };
                    new UsersRepo().Save(_userInfo);
                }
            }
            else
            {
                _u = UsersRepo.LogIn(_user, _pwd, true);
            }


            if (_u != null && _u.IsAdmin)
            {

                IWebContext.SetAuthenticationCookie(_user, _pwd, true);
                _msg.ReturnUrl = f["returnUrl"];
            }
            else
            {
                _msg.Text = "Username or Password is incorrect.";
            }

            return JavaScript(_msg.ToJavaScript());
        }

        public ActionResult Info()
        {
            var id = Request.QueryString["id"];
            var model = UsersRepo.Info(id);
            return View(model);
        }


        public ActionResult Status()
        {
            return View();
        }
        public ActionResult Role()
        {
            var _role = new RoleRepo();
            var _data = _role.List();

            return View(_data);
        }
        [HttpPost]
        public ActionResult Role(FormCollection f)
        {

            var rid = f["rid"];
            var id = f["id"];

            if (string.IsNullOrWhiteSpace(rid))
            {
                rid = ObjectId.Empty.ToString();
            }

            _repo.Role(id, rid);

            return JavaScript("");


        }
        public ActionResult ChangePwd()
        {
            return View();
        }
        [HttpPost]
        public ActionResult ChangePwd(FormCollection f)
        {
            //var userName = f["UserName"];
            var pwd = f["pwd"].Password();
            var oldpwd = f["oldpwd"].Password();
            var info = UsersRepo.LogIn(IWebContext.UserInfo.UserName, oldpwd, false);
            if (info != null)
                new UsersRepo().ResetPwd(info.Id, pwd);
            var _msg = info != null ? Msg.Create("Change password success") : Msg.Create("Change password error");
            return JavaScript(_msg.ToJavaScript());
        }
        public ActionResult Add()
        {
            var id = new ObjectId(Request.QueryString["id"]);
            var model = string.IsNullOrWhiteSpace(Request.QueryString["id"]) ? new User() : UsersRepo.Info(id);
            return View(model);
        }

        [HttpPost]
        public ActionResult Add(FormCollection f)
        {
            var info = UsersRepo.Info(ObjectId.Parse(f["id"]));
            TryUpdateModel(info, f.ToValueProvider());
            if (info != null)
            {
                new UsersRepo().Save(info);
            }
            var _msg = info.Id.Equals(ObjectId.Parse(f["id"])) ? Msg.Create("Update success") : Msg.Create("Ad success");
            return JavaScript(_msg.ToJavaScript());
        }
    }
}
