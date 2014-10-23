using System;
using System.Globalization;
using System.Web.Mvc;
using System.Web.Security;

namespace MongoDB.Ajax.Business.Attributes
{
    /// <summary>
    /// Used in conjunction with Html.AntiModelInjection(o=>o.PropertyId) to write an encrypted property and in 
    /// turn validate it in the controller. This is used to help prevent parameter tampering from the user.
    /// A user could for instance change a hidden value on the form named UserId to alter a user that isn't 'theirs'.
    /// Developed by Adam Tuliper
    /// www.secure-coding.com
    /// adam@secure-coding.com
    /// 
    /// </summary>
    public class ValidateAntiModelInjectionAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// The name of the property we are generating a hash for.
        /// </summary>
        private readonly string _propertyName;

        /// <summary>
        /// 
        /// </summary>
        /// <param name="propertyName">The name of the property from the form to validate against the hidden encrypted form version.</param>
        public ValidateAntiModelInjectionAttribute(string propertyName)
        {
            _propertyName = propertyName;
            if (string.IsNullOrEmpty(propertyName))
            {
                throw new ArgumentException("The propertyName value must be a non empty string.");
            }
        }

        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            //The hidden form field that contains our hash - for ex. CustomerId is rendered as a hidden input  id="_CustomerIdToken"
            string encryptedPropertyName = string.Format("_{0}Token", _propertyName);

            //grab the token
            string hashToken = filterContext.HttpContext.Request.Form[encryptedPropertyName];

            //The encrypted form data MUST be there. We do not allow empty strings otherwise this could give
            //an attack vector in our filter as a means to bypass checks by simply passing in an empty validation token.
            if (string.IsNullOrEmpty(hashToken))
            {
                throw new MissingFieldException(string.Format("The hidden form field named value {0} was missing. This is created by the Html.AntiModelInjection methods. Ensure the name used on your [ValidateAntiModelInjectionAttribute(\"!HERE!\")] matches the field name used in Html.AntiModelInjection method. If this attribute is used on a controller method that is meant for HttpGet, then the form value would not yet exist. This attribute is meant to be used on controller methods accessed via HttpPost.", encryptedPropertyName));
            }


            //Get the plain text value
            string formValue = filterContext.HttpContext.Request.Form[_propertyName];

            //Plain text must be available to compare.
            if (string.IsNullOrEmpty(formValue))
            {
                throw new MissingFieldException(string.Format("The form value {0} was missing. If this attribute is used on a controller method that is meant for HttpGet, then the form value would not yet exist. This attribute is meant to be used on controller methods accessed via HttpPost.", _propertyName));
            }

            //Now hash the 'plain text' version so we can compare to the hash originally created by Html.AntiModelInjectionFor
            string hashedFormValue = FormsAuthentication.HashPasswordForStoringInConfigFile(formValue, "SHA1");

            //And compare
            if (string.Compare(hashedFormValue, hashToken, false, CultureInfo.InvariantCulture) != 0)
            {
                throw new HttpAntiModelInjectionException(string.Format("Failed security validation for {0}. It is possible the data was tampered with as the original value used to create the form field does not match the current property value for this field.", _propertyName));
            }

            filterContext.HttpContext.Trace.Write("(Logging Filter)Action Executing: " +
                filterContext.ActionDescriptor.ActionName);

            base.OnActionExecuting(filterContext);
        }


    }

}
