using System.Web.Mvc;

namespace MongoDB.Ajax.Business
{
    public enum MetaTag
    {
        Keywords,
        Description,
        Date,
        Copyright,
        Author,
        Generator,
        Robots
    }

    public static class MetaExtensions
    {
        #region Meta


        public static MvcHtmlString Meta(this HtmlHelper helper, string name, object value)
        {
            return MvcHtmlString.Create(string.Format("<meta name=\"{0}\" content=\"{1}\" />", name.ToLower(), helper.Encode(value)));
        }

        public static MvcHtmlString Meta(this HtmlHelper helper, MetaTag name, object value)
        {
            return Meta(helper, name.ToString(), value);
        }

        public static MvcHtmlString BingMetaTag(this HtmlHelper helper, string key)
        {
            return Meta(helper, "msvalidate.01", key);
        }
        
        public static MvcHtmlString GoogleMetaTag(this HtmlHelper helper, string key)
        {
            return Meta(helper, "google-site-verification",key);
        }


        #endregion

    }
}
