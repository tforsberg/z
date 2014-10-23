using System;
using System.Collections.Generic;
using System.Web.Mvc;
using MongoDB.Ajax.Core.Extensions;


namespace MongoDB.Ajax.Business
{
    public class jQueryForm : BaseControl, IDisposable
    {
       

        private jQueryAjaxOptions AjaxOptions { get; set; }
        private bool _disposed;
        private FormContext OriginalFormContext { get; set; }


        public string Action
        {
            set { Attributes.Merge("action", value); }
        }

        public FormMethod Method
        {
            set { Attributes.Merge("method", HtmlHelper.GetFormMethodString(value)); }
        }


        public jQueryForm(ViewContext context, string action, FormMethod method, jQueryAjaxOptions ajaxOptions, IDictionary<string, object> htmlAttributes)
            : base("form",TagRenderMode.StartTag)
        {
             
           
            MergeAttributes(htmlAttributes);
            Method = method;
            Action = action;
            ViewContext = context;
            OriginalFormContext = context.FormContext;
            context.FormContext = new FormContext();
            AjaxOptions = ajaxOptions ?? new jQueryAjaxOptions ();

            if (AjaxOptions != null && AjaxOptions.Metadata)
            {
                AddClass("jquery-ajax-form");
                Attributes.Merge("data-jquery-ajax", AjaxOptions.ToJson());
            }

            if (string.IsNullOrWhiteSpace(Id))
            {
                Attributes.Merge("id", string.Format("form{0}", DateTime.UtcNow.Ticks));
            }
            //context.Writer.Write(f.Html(context));
        }

        public void RenderBegin()
        {
           
            ViewContext.Writer.Write(Html());
        }



        public void RenderScript()
        {

            var sb = AjaxOptions.ToJavascript(Id);

            if (IsAjaxRequest)
                ViewContext.Writer.Write(sb);
            else
            {
                ScriptBlock.Register(sb, (AjaxOptions != null && AjaxOptions.Metadata )? "jquery-ajax-form" : null);
            }
        }


        public void Dispose()
        {
            Dispose(true /* disposing */);
            GC.SuppressFinalize(this);
        }

        protected virtual void Dispose(bool disposing)
        {
            if (!_disposed)
            {
                _disposed = true;
                ViewContext.Writer.Write("</form>");
                RenderScript();

                // output client validation and restore the original form context
                if (ViewContext != null)
                {
                    ViewContext.OutputClientValidation();
                    ViewContext.FormContext = OriginalFormContext;
                }
            }
        }

        public void EndForm()
        {
            Dispose(true);
        }
    }
}
