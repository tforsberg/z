using System;
using System.Configuration;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;

namespace MongoDB.Ajax.Business.Attributes
{
    public class ValidateDdosAttack : ActionFilterAttribute
    {

        private HttpContextBase _context;

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            _context = filterContext.HttpContext;

            if (!IsValid())
            {
                _context.Response.Write("Too many requests to the server.");
                _context.Response.End();
                return;
            }

            base.OnActionExecuting(filterContext);
        }

        private bool IsValid()
        {

            var _level = Convert.ToInt32(ConfigurationManager.AppSettings["AntiDdosLevel"]);
            if (_level <= 0)
                return true;

            if (_context.Request.Browser.Crawler || _context.Request.Browser.IsMobileDevice) return true;

            string _key = _level + _context.Request.UserHostAddress;

            var _hit = (int)(_context.Cache[_key] ?? 0);

            if (_hit > _level)
                return false;

            _hit++;

            if (_hit == 1)
                _context.Cache.Add(_key, _hit, null, DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration, CacheItemPriority.Normal, null);

            return true;
        }

    }
}
