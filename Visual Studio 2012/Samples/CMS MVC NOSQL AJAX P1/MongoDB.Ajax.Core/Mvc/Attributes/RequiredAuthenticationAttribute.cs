using System.Web.Mvc;
using System.Web.Security;

namespace MongoDB.Ajax.Business.Attributes
{
    public class RequiredAuthenticationAttribute : AuthorizeAttribute
    {


        //public string LoginUrl { get; set; }
        //public string ReturnUrl { get; set; }

        public string SessionId { get; set; }

        public override void OnAuthorization(AuthorizationContext _filterContext)
        {

            var _context = _filterContext.HttpContext;

            //redirect if not authenticated
            if (!_context.Request.IsAuthenticated || (!string.IsNullOrWhiteSpace(SessionId) && _context.Session[SessionId] == null))
            {
                //use the current url for the redirect
                if (_context.Request.Url != null)
                {
                    string _redirectOnSuccess = _context.Server.UrlEncode( _context.Request.Url.ToString());
                    //send them off to the login page
                    string _redirectUrl = string.Format("?ReturnUrl={0}", _redirectOnSuccess);
                    string _loginUrl = System.Configuration.ConfigurationManager.AppSettings["LoginUrl"];
                    _loginUrl = (!string.IsNullOrWhiteSpace(_loginUrl) ? _loginUrl : FormsAuthentication.LoginUrl) + _redirectUrl;

                    _context.Response.Redirect(_loginUrl, true);
                }
            }

        }
    }
}