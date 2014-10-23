using System.Web.Mvc;
using System.Web.Routing;

namespace MongoDB.Ajax.Business
{

    public enum ButtonType
    {
        Submit,
        Button,
        Reset
    }

    public static class ButtonExtensions
    {

        #region Button

        public static MvcHtmlString Button(this HtmlHelper helper, string type, string value, object attributes)
        {

            var tag = new TagBuilder("input");

            tag.MergeAttributes(new RouteValueDictionary(attributes));
            tag.MergeAttribute("value", value);
            tag.MergeAttribute("type", type.ToLower());

            return MvcHtmlString.Create(tag.ToString(TagRenderMode.SelfClosing));
        }

        public static MvcHtmlString Button(this HtmlHelper helper, ButtonType type, string value, object attributes)
        {
            return Button(helper, type.ToString(), value, attributes);
        }

        #endregion
    }
}
