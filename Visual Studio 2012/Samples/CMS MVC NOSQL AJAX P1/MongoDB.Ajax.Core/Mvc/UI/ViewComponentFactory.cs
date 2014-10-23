using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Diagnostics;
using System.Diagnostics.CodeAnalysis;
using System.Linq.Expressions;
using System.Web.Mvc;
using System.Web.Mvc.Html;
using System.Web.Routing;

namespace MongoDB.Ajax.Business
{


    public class ViewComponentFactory<TModel> : ViewComponentFactory
    {
        [EditorBrowsable(EditorBrowsableState.Never)]
        public new HtmlHelper<TModel> Helper
        {
            get;
            set;
        }


        public ViewComponentFactory(HtmlHelper<TModel> helper)
            : base(helper)
        {
            Helper = helper;
        }


        [SuppressMessage("Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types")]
        public MvcHtmlString EditorFor<TProperty>(Expression<Func<TModel, TProperty>> expression)
        {
            return EditorFor(expression, null, null);
        }

        public MvcHtmlString EditorFor<TProperty>(Expression<Func<TModel, TProperty>> expression, EditorOptions options)
        {
            return EditorFor(expression, options, new RouteValueDictionary());
        }

        [SuppressMessage("Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types")]
        public MvcHtmlString EditorFor<TProperty>(Expression<Func<TModel, TProperty>> expression, EditorOptions options, object htmlAttributes)
        {
            return EditorFor(expression, options, HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes));
        }

        [SuppressMessage("Microsoft.Design", "CA1006:DoNotNestGenericTypesInMemberSignatures", Justification = "This is an appropriate nesting of generic types")]
        public MvcHtmlString EditorFor<TProperty>(Expression<Func<TModel, TProperty>> expression, EditorOptions options, IDictionary<string, object> htmlAttributes)
        {
            if (expression == null)
            {
                throw new ArgumentNullException("expression");
            }

            return CreateEditor(
                                  ModelMetadata.FromLambdaExpression(expression, Helper.ViewData),
                                  ExpressionHelper.GetExpressionText(expression),
                                  options,
                                  htmlAttributes);
        }


    }





    public class ViewComponentFactory
    {
        [EditorBrowsable(EditorBrowsableState.Never)]
        public HtmlHelper Helper { get; set; }

        public ViewComponentFactory(HtmlHelper helper)
        {
            Helper = helper;
        }



        private ViewContext ViewContext
        {
            [DebuggerStepThrough]
            get
            {
                return Helper.ViewContext;
            }
        }


        #region Form

        public jQueryForm BeginForm()
        {
            string action = ViewContext.HttpContext.Request.RawUrl;
            return BeginForm(action, FormMethod.Post, null, new RouteValueDictionary());
        }

        public jQueryForm BeginForm(jQueryAjaxOptions ajaxOptions)
        {
            string formAction = ViewContext.HttpContext.Request.RawUrl;
            return BeginForm(formAction, FormMethod.Post, ajaxOptions, new RouteValueDictionary());
        }

        public jQueryForm BeginForm(jQueryAjaxOptions ajaxOptions, object htmlAttributes)
        {
            string formAction = ViewContext.HttpContext.Request.RawUrl;
            return BeginForm(formAction, FormMethod.Post, ajaxOptions, new RouteValueDictionary(htmlAttributes));
        }


        public jQueryForm BeginForm(string action, FormMethod method, jQueryAjaxOptions options, IDictionary<string, object> htmlAttributes)
        {

            var f = new jQueryForm(ViewContext, action, method, options, htmlAttributes);
            f.RenderBegin();
            return f;
        }


        public jQueryForm BeginForm(string action, FormMethod method, jQueryAjaxOptions options, object htmlAttributes)
        {

            var f = new jQueryForm(ViewContext, action, method, options, new RouteValueDictionary(htmlAttributes));
            f.RenderBegin();
            return f;
        }

        public jQueryForm BeginForm(string action, jQueryAjaxOptions options, object htmlAttributes)
        {
            return BeginForm(action, FormMethod.Post, options, htmlAttributes);
        }

        public jQueryForm BeginForm(string actionName, string controllerName, jQueryAjaxOptions ajaxOptions, IDictionary<string, object> htmlAttributes, RouteValueDictionary routeValues)
        {
            // get target URL
            string formAction = UrlHelper.GenerateUrl(null, actionName, controllerName, routeValues ?? new RouteValueDictionary(), Helper.RouteCollection, Helper.ViewContext.RequestContext, true /* includeImplicitMvcValues */);
            return BeginForm(formAction, FormMethod.Post, ajaxOptions, htmlAttributes);
        }

       /* public MvcForm BeginForm(string actionName, jQueryAjaxOptions ajaxOptions)
        {
            return BeginForm(actionName, null /* controllerName #1#, ajaxOptions);
        }



        public MvcForm BeginForm(string actionName, jQueryAjaxOptions ajaxOptions, RouteValueDictionary routeValues)
        {
            return BeginForm(actionName, null /* controllerName #1#, ajaxOptions, routeValues);
        }
        public MvcForm BeginForm(string actionName, jQueryAjaxOptions ajaxOptions, IDictionary<string, object> htmlAttributes, RouteValueDictionary routeValues)
        {
            return BeginForm(actionName, null /* controllerName #1#, ajaxOptions, htmlAttributes, routeValues);
        }

        public MvcForm BeginForm(string actionName, string controllerName, jQueryAjaxOptions ajaxOptions)
        {
            return BeginForm(actionName, controllerName, ajaxOptions, null /* htmlAttributes #1#, null /* values #1#);
        }



        public MvcForm BeginForm(string actionName, string controllerName, RouteValueDictionary routeValues, jQueryAjaxOptions ajaxOptions)
        {
            return BeginForm(actionName, controllerName, ajaxOptions, null /* htmlAttributes #1#, routeValues);
        }

        public MvcForm BeginForm(string actionName, string controllerName, jQueryAjaxOptions ajaxOptions, object htmlAttributes)
        {

            RouteValueDictionary newAttributes = HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes);
            return BeginForm(actionName, controllerName, ajaxOptions, newAttributes, null);
        }
*/

        public void EndForm()
        {
            Helper.ViewContext.Writer.Write("</form>");
            Helper.ViewContext.OutputClientValidation();
        }



        /*

                public IDisposable BeginForm(string actionName, string controllerName, RouteValueDictionary routeValues, FormMethod method, IDictionary<string, object> htmlAttributes)
                {
                    string formAction = UrlHelper.GenerateUrl(null /* routeName #1#, actionName, controllerName, routeValues, Helper.RouteCollection, ViewContext.RequestContext, true /* includeImplicitMvcValues #1#);
                    return BeginForm(formAction, method, null, htmlAttributes);
                }


                public  IDisposable BeginForm(string actionName, string controllerName, object routeValues, FormMethod method, object htmlAttributes)
                {
                    return BeginForm(actionName, controllerName, new RouteValueDictionary(routeValues), method, HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes));
                }


                public  IDisposable BeginForm(string actionName, string controllerName, FormMethod method, object htmlAttributes)
                {
                    return BeginForm( actionName, controllerName, new RouteValueDictionary(), method, HtmlHelper.AnonymousObjectToHtmlAttributes(htmlAttributes));
                }

                public  IDisposable BeginForm(string actionName, string controllerName, FormMethod method, IDictionary<string, object> htmlAttributes)
                {
                    return BeginForm(actionName, controllerName, new RouteValueDictionary(), method, htmlAttributes);
                }

                public  IDisposable BeginForm( object routeValues)
                {
                    return BeginForm( null, null, new RouteValueDictionary(routeValues), FormMethod.Post, new RouteValueDictionary());
                }

                public  IDisposable BeginForm(RouteValueDictionary routeValues)
                {
                    return BeginForm( null, null, routeValues, FormMethod.Post, new RouteValueDictionary());
                }

                public  IDisposable BeginForm(string actionName, string controllerName)
                {
                    return BeginForm(actionName, controllerName, new RouteValueDictionary(), FormMethod.Post, new RouteValueDictionary());
                }

                public  IDisposable BeginForm(string actionName, string controllerName, object routeValues)
                {
                    return BeginForm( actionName, controllerName, new RouteValueDictionary(routeValues), FormMethod.Post, new RouteValueDictionary());
                }

                public IDisposable BeginForm(string actionName, string controllerName, RouteValueDictionary routeValues)
                {
                    return BeginForm( actionName, controllerName, routeValues, FormMethod.Post, new RouteValueDictionary());
                }

                public IDisposable BeginForm(string actionName, string controllerName, FormMethod method)
                {
                    return BeginForm( actionName, controllerName, new RouteValueDictionary(), method, new RouteValueDictionary());
                }

                public IDisposable BeginForm(string actionName, string controllerName, object routeValues, FormMethod method)
                {
                    return BeginForm( actionName, controllerName, new RouteValueDictionary(routeValues), method, new RouteValueDictionary());
                }

                public  IDisposable BeginForm( string actionName, string controllerName, RouteValueDictionary routeValues, FormMethod method)
                {
                    return BeginForm( actionName, controllerName, routeValues, method, new RouteValueDictionary());
                }
        */


        #endregion
        

        #region Editor


        public MvcHtmlString Editor(string name, string value, EditorOptions options, object htmlAttributes)
        {
            ModelMetadata metadata = ModelMetadata.FromStringExpression(name, ViewContext.ViewData);
            if (value != null)
            {
                metadata.Model = value;
            }

            return CreateEditor(metadata, name, options, new RouteValueDictionary(htmlAttributes));
        }



        public MvcHtmlString Editor(string name, string value, EditorOptions options)
        {
            return Editor(name, value, options, null);
        }


        protected MvcHtmlString CreateEditor(ModelMetadata modelMetadata, string name, EditorOptions options, IDictionary<string, object> htmlAttributes)
        {




            string fullName = Helper.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
            if (String.IsNullOrEmpty(fullName))
            {
                throw new ArgumentException("name");
            }

            options = options ?? new EditorOptions();

            var tagBuilder = new TagBuilder("textarea");
            tagBuilder.GenerateId(fullName);
            tagBuilder.MergeAttributes(htmlAttributes, true);

            tagBuilder.MergeAttribute("name", fullName, true);

            // If there are any errors for a named field, we add the CSS attribute.
            ModelState modelState;
            if (Helper.ViewData.ModelState.TryGetValue(fullName, out modelState) && modelState.Errors.Count > 0)
            {
                tagBuilder.AddCssClass(HtmlHelper.ValidationInputCssClassName);
            }

            tagBuilder.MergeAttributes(Helper.GetUnobtrusiveValidationAttributes(name));

            tagBuilder.AddCssClass("tinymce");

            if (options.Metadata)
            {
                tagBuilder.MergeAttribute("data-tinymce-editor", options.ToJson());
            }

            string value;
            if (modelState != null && modelState.Value != null)
            {
                value = modelState.Value.AttemptedValue;
            }
            else if (modelMetadata.Model != null)
            {
                value = modelMetadata.Model.ToString();
            }
            else
            {
                value = String.Empty;
            }




            // The first newline is always trimmed when a TextArea is rendered, so we add an extra one
            // in case the value being rendered is something like "\r\nHello".
            tagBuilder.SetInnerText(Environment.NewLine + value);


            var html = tagBuilder.ToString(TagRenderMode.Normal);


            var script = options.ToJavascript(tagBuilder.Attributes["id"]);

            if (ViewContext.HttpContext.Request.IsAjaxRequest())
            {
                html = html + script;
            }
            else
            {
                ScriptBlock.Register(script, options.Metadata ? "tinymce-editor" : null);
            }
            

            return MvcHtmlString.Create(html);
        }

        #endregion
    }
}
