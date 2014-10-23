using System;
using System.Collections.Generic;
using System.Data.Linq;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;
using System.Web.Security;

namespace MongoDB.Ajax.Business
{

    public class SelectItem : SelectListItem
    {
        public string CssClass { get; set; }
    }


    public static class HtmlExtensions
    {

       /* public static IEnumerable<SelectListItem> SelectList(params TEnum[] values)
        {


            foreach (Type t in values)
            {
                var item = new SelectListItem { Value = t.ToString(), Text = Enum.GetName(t, t) };    
            }
        }*/

       /* public static IEnumerable<SelectListItem> ToSelectList<TEnum>(params Type[] fillerValues)
        {
            /*return (Enum.GetValues(typeof(TEnum)).Cast<TEnum>().Select(
                enu => new SelectListItem() { Text = Enum.GetName(typeof(TEnum), enu), Value = enu.ToString() })).ToList();#1#

            foreach (Type _fillerValue in fillerValues)
            {
                
            }

            foreach (var v in Enum.GetValues(typeof(TEnum)))
            {
                

            }
           

            return (from int value in Enum.GetValues(typeof(TEnum)) select new SelectListItem { Value = value.ToString(), Text = Enum.GetName(typeof(TEnum), value) }).ToList();


        }*/

        public static IEnumerable<SelectListItem> ToSelectList<TEnum>()
        {
            /*return (Enum.GetValues(typeof(TEnum)).Cast<TEnum>().Select(
                enu => new SelectListItem() { Text = Enum.GetName(typeof(TEnum), enu), Value = enu.ToString() })).ToList();*/

            return (from int value in Enum.GetValues(typeof(TEnum)) select new SelectListItem { Value = value.ToString(), Text = Enum.GetName(typeof(TEnum), value) }).ToList();


        }

        public static SelectList ToSelectList<TEnum>(object valuesSelected)
        {
            return new SelectList(ToSelectList<TEnum>(), "Value", "Text", valuesSelected);
        }


        public static ViewComponentFactory Kaio(this HtmlHelper helper)
        {
            return new ViewComponentFactory(helper);
        }

        public static ViewComponentFactory<TModel> Kaio<TModel>(this HtmlHelper<TModel> helper)
        {
            return new ViewComponentFactory<TModel>(helper);
        }


        #region Enums DropdownList
        public static MvcHtmlString DropDownList(this HtmlHelper helper, string name, Type type)
        {
            return DropDownList(helper, name, type, null);
        }


        public static MvcHtmlString DropDownList(this HtmlHelper helper, string name, Type type, object selected)
        {
            if (!type.IsEnum)
                throw new ArgumentException("Type is not an enum.");

            if (selected != null && selected.GetType() != type)
                throw new ArgumentException("Selected object is not " + type);

            var enums = new List<SelectListItem>();
            foreach (int value in Enum.GetValues(type))
            {
                var item = new SelectListItem { Value = value.ToString(), Text = Enum.GetName(type, value).Replace("_", " ") };

                if (selected != null)
                    item.Selected = (int)selected == value;

                enums.Add(item);
            }

            return helper.DropDownList(name, enums);
        }


        /* public static IHtmlString DropDownList(this HtmlHelper helper, string name, List<SelectItem> values , object selected)
         {
            
         }
 */
        #endregion



        #region ToSelectList

        /// <summary>
        /// Returns an IEnumerable&lt;SelectListItem&gt; by using the specified items for data value field.
        /// </summary>
        /// <param name="enumerable">The items.</param>
        /// <param name="value">The data value field.</param>
        public static IEnumerable<SelectListItem> ToSelectList<T>(this IEnumerable<T> enumerable, Func<T, string> value)
        {
            return enumerable.ToSelectList(value, value, null);
        }

        /// <summary>
        /// Returns an IEnumerable&lt;SelectListItem&gt; by using the specified items for data value field and a selected value.
        /// </summary>
        /// <param name="enumerable">The items.</param>
        /// <param name="value">The data value field.</param>
        /// <param name="selectedValue">The selected value.</param>
        public static IEnumerable<SelectListItem> ToSelectList<T>(this IEnumerable<T> enumerable, Func<T, string> value, object selectedValue)
        {
            return enumerable.ToSelectList(value, value, selectedValue);
        }

        /// <summary>
        /// Returns an IEnumerable&lt;SelectListItem&gt; by using the specified items for data value field and the data text field.
        /// </summary>
        /// <param name="enumerable">The items.</param>
        /// <param name="value">The data value field.</param>
        /// <param name="text">The data text field.</param>
        public static IEnumerable<SelectListItem> ToSelectList<T>(this IEnumerable<T> enumerable, Func<T, string> value, Func<T, string> text)
        {
            return enumerable.ToSelectList(value, text, null);
        }

        /// <summary>
        /// Returns an IEnumerable&lt;SelectListItem&gt; by using the specified items for data value field, the data text field, and a selected value.
        /// </summary>
        /// <param name="enumerable">The items.</param>
        /// <param name="value">The data value field.</param>
        /// <param name="text">The data text field.</param>
        /// <param name="selectedValue">The selected value.</param>
        public static IEnumerable<SelectListItem> ToSelectList<T>(this IEnumerable<T> enumerable, Func<T, string> value, Func<T, string> text, object selectedValue)
        {
            return enumerable.Select(f => new SelectListItem
                                              {
                                                  Value = value(f),
                                                  Text = text(f),
                                                  Selected = value(f).Equals(selectedValue)
                                              });
        }

        #endregion



        public static IHtmlString CheckBox(this HtmlHelper helper, string name, bool isChecked, string label, object htmlAttributes)
        {


            var check = new TagBuilder("input");
            if (isChecked)
                check.MergeAttribute("checked", "checked");
            check.MergeAttribute("id", name);
            check.MergeAttributes(new RouteValueDictionary(htmlAttributes));
            check.MergeAttribute("name", name);
            check.MergeAttribute("type", "checkbox");
            var labelTag = new TagBuilder("label");
            labelTag.MergeAttribute("for", name);

            return MvcHtmlString.Create(string.Format("{0} {1}", check.ToString(TagRenderMode.SelfClosing), labelTag.ToString(TagRenderMode.SelfClosing)));


        }


        #region CheckBoxGroup

        public static MvcHtmlString CheckBoxGroup(this HtmlHelper helper, string name, IEnumerable<SelectItem> values, object htmlAttributes)
        {
            return CheckBoxGroup(helper, name, values, null, htmlAttributes);

        }


        public static MvcHtmlString CheckBoxGroup(this HtmlHelper helper, string name, IEnumerable<SelectItem> values, object valuesSelected, object htmlAttributes)
        {
            List<object> _selected = null;

            if (valuesSelected != null)
            {
                _selected = new List<object> { valuesSelected };
            }

            return CheckBoxGroup(helper, name, values, _selected, htmlAttributes);

        }

        public static MvcHtmlString CheckBoxGroup(this HtmlHelper helper, string name, IEnumerable<SelectItem> values, IEnumerable<object> valuesSelected, object htmlAttributes)
        {
            var sb = new StringBuilder();

            if (values != null)
            {
                // Create a radio button for each item in the list
                foreach (var item in values)
                {
                    // Generate an id to be given to the radio button field
                    var _id = string.Format("{0}_{1}", name, !string.IsNullOrWhiteSpace(item.Value) ? item.Value : DateTime.UtcNow.Ticks.ToString()).ToLower();

                    var _selected = valuesSelected != null && valuesSelected.Any(x => x.ToString().ToLower() == item.Value.ToLower());

                    var _checkbox = string.Format("<input type=\"checkbox\" name=\"{0}\" value=\"{1}\" id=\"{2}\"{3} />", name, HttpUtility.HtmlEncode(item.Value), _id, _selected ? " checked=\"checked\"" : string.Empty); // helper.CheckBox(name, _selected, new {id = _id, value = item.Value}).ToHtmlString();

                    var _label = helper.Label(_id, item.Text).ToHtmlString();

                    sb.AppendFormat("<li class=\"{2}\">{0}{1}</li>", _checkbox, _label, item.CssClass);

                }
            }

            var tag = new TagBuilder("ul");
            tag.MergeAttributes(new RouteValueDictionary(htmlAttributes));

            tag.InnerHtml = sb.ToString();
            return MvcHtmlString.Create(tag.ToString(TagRenderMode.Normal));

        }


        #endregion


        #region RadioButtonGroup

        public static MvcHtmlString RadioButtonGroup(this HtmlHelper helper, string name, IEnumerable<SelectItem> values, object htmlAttributes)
        {
            return RadioButtonGroup(helper, name, values, null, htmlAttributes);
        }
        public static MvcHtmlString RadioButtonGroup(this HtmlHelper helper, string name, IEnumerable<SelectItem> values, object valueSelected, object htmlAttributes)
        {
            var sb = new StringBuilder();

            if (values != null)
            {



                // Create a radio button for each item in the list
                foreach (var item in values)
                {
                    // Generate an id to be given to the radio button field
                    var _id = string.Format("{0}_{1}", name, !string.IsNullOrWhiteSpace(item.Value) ? item.Value : DateTime.UtcNow.Ticks.ToString()).ToLower();

                    var _radioButton =
                        helper.RadioButton(name, item.Value,
                                           (valueSelected != null &&
                                            String.Compare(item.Value, valueSelected.ToString(),
                                                           StringComparison.OrdinalIgnoreCase) == 0), new { id = _id }).ToHtmlString();

                    var _label = helper.Label(_id, HttpUtility.HtmlEncode(item.Text)).ToHtmlString();

                    sb.AppendFormat(
                        "<li class=\"{2}\">{0}{1}</li>", _radioButton, _label, item.CssClass);

                }
            }

            var tag = new TagBuilder("ul");
            tag.MergeAttributes(new RouteValueDictionary(htmlAttributes));

            tag.InnerHtml = sb.ToString();
            return MvcHtmlString.Create(tag.ToString(TagRenderMode.Normal));


        }




        public static MvcHtmlString RadioButtonGroupFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression, IEnumerable<SelectListItem> listOfValues)
        {


            var metaData = ModelMetadata.FromLambdaExpression(expression, htmlHelper.ViewData);
            var sb = new StringBuilder();

            if (listOfValues != null)
            {
                // Create a radio button for each item in the list
                foreach (SelectListItem item in listOfValues)
                {
                    // Generate an id to be given to the radio button field


                    var id = string.Format("{0}_{1}", metaData.PropertyName, item.Value);

                    // Create and populate a radio button using the existing html helpers
                    var label = htmlHelper.Label(id, item.Text);
                    var radio = htmlHelper.RadioButtonFor(expression, item.Value, new { id = id }).ToHtmlString();

                    // Create the html string that will be returned to the client
                    // e.g. <input data-val="true" data-val-required="You must select an option" id="TestRadio_1" name="TestRadio" type="radio" value="1" /><label for="TestRadio_1">Line1</label>
                    sb.AppendFormat("<div class=\"radio-button-group\">{0}{1}</div>", radio, label);
                }
            }

            return MvcHtmlString.Create(sb.ToString());
        }

        #endregion



        #region Link & Image Link

        public static MvcHtmlString ImageLink(this HtmlHelper helper, string href, object hrefAttributes, string imageSrc, object imageAttributes)
        {
            var imgHtml = Image(helper, imageSrc, imageAttributes).ToHtmlString();
            var tag = new TagBuilder("a");
            tag.MergeAttributes(new RouteValueDictionary(hrefAttributes));
            tag.MergeAttribute("href", href, true);
            tag.InnerHtml = imgHtml;
            string html = tag.ToString(TagRenderMode.Normal);
            return MvcHtmlString.Create(html);
        }


        public static MvcHtmlString Image(this HtmlHelper helper, string src, object attributes)
        {

            var tag = new TagBuilder("img");
            tag.MergeAttributes(new RouteValueDictionary(attributes));
            tag.MergeAttribute("src", src, true);
            string imgHtml = tag.ToString(TagRenderMode.SelfClosing);
            return MvcHtmlString.Create(imgHtml);
        }


        public static MvcHtmlString Link(this HtmlHelper helper, string href, string text, object attributes)
        {
            var tag = new TagBuilder("a");
            tag.MergeAttributes(new RouteValueDictionary(attributes));
            tag.MergeAttribute("href", href, true);
            tag.InnerHtml = text;
            string html = tag.ToString(TagRenderMode.Normal);
            return MvcHtmlString.Create(html);
        }

        public static MvcHtmlString Link(this HtmlHelper helper, string href, string text)
        {
            return Link(helper, href, text, new { @title = text });
        }




        #endregion

        public static IHtmlString Title(this HtmlHelper helper, string val)
        {
            return MvcHtmlString.Create(string.Format("<title>{0}</title>", helper.Encode(val)));
        }


        #region Anti Model Injection

        /// <summary>
        /// Developed by Adam Tuliper
        /// www.secure-coding.com
        /// adam@secure-coding.com
        /// Uses MvcHtmlString for backwards compatibility. 
        /// </summary>
        /// <param name="html"></param>
        /// <param name="modelPropertyName"></param>
        /// <returns></returns>
        public static MvcHtmlString AntiModelInjection(this HtmlHelper html, string modelPropertyName, object value)
        {
            return GenerateHiddenFormField(modelPropertyName, value);
        }

        /// <summary>
        /// Generates a hidden form field with a hashed value of the value in the model.
        /// This is used in conjunction with [ValidateAntiModelInjection] upon a form post to help ensure
        /// the form fields weren't tampered with.
        /// </summary>
        /// <typeparam name="TModel"></typeparam>
        /// <typeparam name="TProperty"></typeparam>
        /// <param name="htmlHelper"></param>
        /// <param name="expression"></param>
        /// <returns></returns>
        public static MvcHtmlString AntiModelInjectionFor<TModel, TProperty>(this HtmlHelper<TModel> htmlHelper, Expression<Func<TModel, TProperty>> expression)
        {
            //Get the value from the model.
            object modelValue = ModelMetadata.FromLambdaExpression(expression, htmlHelper.ViewData).Model;

            //Get the name of the field from the model.
            string fieldName = ExpressionHelper.GetExpressionText(expression);

            return GenerateHiddenFormField(fieldName, modelValue);
        }

        /// <summary>
        /// Generates a hidden input type string for the given value after hashing the value.
        /// The field for ex. CustomerId would be named _CustomerIdToken
        /// </summary>
        /// <param name="fieldName"></param>
        /// <param name="modelValue"></param>
        /// <returns></returns>
        private static MvcHtmlString GenerateHiddenFormField(string fieldName, object modelValue)
        {
            var builder = new TagBuilder("input");
            builder.Attributes["type"] = "hidden";
            //If we have a field named CustomerId, then the token will be _CustomerIdToken
            builder.Attributes["name"] = string.Format("_{0}Token", fieldName);

            string value = GetValueFromModelValue(modelValue);

            //Now hash the value
            value = FormsAuthentication.HashPasswordForStoringInConfigFile(value, "SHA1");

            builder.Attributes["value"] = value;
            return new MvcHtmlString(builder.ToString(TagRenderMode.SelfClosing));

        }

        /// <summary>
        /// Gets the value from the model as a string. Binary types are converted to base 64 strings.
        /// </summary>
        /// <param name="formValue"></param>
        /// <returns></returns>
        private static string GetValueFromModelValue(object formValue)
        {
            //Test to determine if its binary data. If it is, we need to convert it to a base64 string.
            var binaryValue = formValue as Binary;
            if (binaryValue != null)
            {
                formValue = binaryValue.ToArray();
            }
            //If the above conversion to an array worked, then the following will cast as a byte array and convert.
            var byteArrayValue = formValue as byte[];
            if (byteArrayValue != null)
            {
                formValue = Convert.ToBase64String(byteArrayValue);
            }
            return formValue.ToString();

        }

        #endregion



        #region Google Script Track

        public static MvcHtmlString GoogleAnalyticsTrackingScript(this HtmlHelper helper, string accountId)
        {
            var html = new StringBuilder("<script type=\"text/javascript\">");
            html.Append(Environment.NewLine);
            html.Append("var _gaq = _gaq || [];");
            html.Append(Environment.NewLine);
            html.Append(string.Format("_gaq.push(['_setAccount', '{0}']);", accountId));
            html.Append(Environment.NewLine);
            html.Append("_gaq.push(['_trackPageview']);");
            html.Append(Environment.NewLine);
            html.Append("(function() {");
            html.Append(Environment.NewLine);
            html.Append("var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;");
            html.Append(Environment.NewLine);
            html.Append("ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') ");
            html.Append(Environment.NewLine);
            html.Append("+ '.google-analytics.com/ga.js';");
            html.Append(Environment.NewLine);
            html.Append("var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);");
            html.Append(Environment.NewLine);
            html.Append("})();");
            html.Append(Environment.NewLine);
            html.Append("</script>");
            return MvcHtmlString.Create(html.ToString());
        }

        #endregion
    }
}
