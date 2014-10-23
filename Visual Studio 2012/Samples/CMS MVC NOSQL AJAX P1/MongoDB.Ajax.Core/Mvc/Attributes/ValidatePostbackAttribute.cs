using System.Web.Mvc;

namespace MongoDB.Ajax.Business.Attributes
{
    public class ValidatePostbackAttribute : ActionFilterAttribute
    {


        public ValidatePostbackAttribute()
        {
            InSidePostback = true;
        }

        public bool InSidePostback { get; set; }

        public bool AjaxRequest { get; set; }

        public string ValidateInput { get; set; }


        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {


            if (filterContext.HttpContext != null)
            {

                var request = filterContext.HttpContext.Request;

                if (InSidePostback)
                {
                    var _ref = filterContext.HttpContext.Request.UrlReferrer;

                    if (_ref == null || request.Url == null)
                        throw new System.Web.HttpException("Invalid submission");
                    if (_ref.Host != request.Url.Host)
                        throw new System.Web.HttpException("This form wasn’t submitted from this site!");

                }

                if (AjaxRequest && !filterContext.HttpContext.Request.IsAjaxRequest())
                {

                    throw new System.Web.HttpException("Required ajax submission");
                }

                
              //  filterContext.RouteData.Values["captchaValid"] = (!string.IsNullOrWhiteSpace(ValidateInput) && !(request.Params[ValidateInput] == "1" || request.Params[ValidateInput] == "true"));

                
            }



        }

        //public override void OnAuthorization(AuthorizationContext _filterContext)
        //{

        //    if (_filterContext.HttpContext != null)
        //    {
        //        var _ref = _filterContext.HttpContext.Request.UrlReferrer;
        //        var _request = _filterContext.HttpContext.Request;

        //        if (_ref == null || _request.Url == null)
        //            throw new System.Web.HttpException("Invalid submission");
        //        if (_ref.Host != _request.Url.Host)
        //            throw new System.Web.HttpException("This form wasn’t submitted from this site!");


        //    }

        //    //base.OnAuthorization(filterContext);

        //} 
    }
}
