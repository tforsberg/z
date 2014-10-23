using System;
using System.Diagnostics;
using System.IO;
using System.Text;
using System.Web.Mvc;
using MongoDB.Ajax.Core.Extensions;


namespace MongoDB.Ajax.Business
{
    public abstract class BaseControl:TagBuilder
    {
        protected BaseControl(string tagName) : base(tagName)
        {
        }

        protected BaseControl(string tagName,TagRenderMode mode):base(tagName)
        {
            RenderMode = mode;
        }

        protected ViewContext ViewContext { get; set; }
        
        protected bool IsAjaxRequest
        {
            get { return ViewContext.HttpContext.Request.IsAjaxRequest(); }
        }

        public string Name
        {
            set { Attributes.Merge("name", value); }
            get { return Attributes.GetValue("name"); }
        }

        public string Style
        {
            set { Attributes.Merge("style", value); }
        }

        public string Title
        {
            set { Attributes.Merge("title", value); }
        }

        public string Id
        {
            [DebuggerStepThrough]
            get
            {
                // Return from htmlattributes if user has specified
                // otherwise build it from name
                return Attributes.ContainsKey("id") ?Attributes.GetValue("id") :(!string.IsNullOrEmpty(Name) ? Name.Replace(".", HtmlHelper.IdAttributeDotReplacement) : null);
                                
            }
        }

       

        private TagRenderMode RenderMode { get; set; }
     

		public void AddClass(string className)
		{
			
			string currentClassName;

			if (Attributes.TryGetValue("class", out currentClassName))
			{
				currentClassName = currentClassName.Trim();

				Attributes["class"] = currentClassName + " " + className;
			}
			else
			{
				Attributes["class"] = className;
			}
		}

		public void AddEventScript(string eventKey, string script)
		{
			string newScript = script;

			if (!string.IsNullOrEmpty(newScript))
			{
				newScript = newScript.Trim();

				if (!newScript.EndsWith("}")
					&& !newScript.EndsWith(";"))
				{
					newScript += ";";
				}
			}

			string currentScript;

			if (Attributes.TryGetValue(eventKey, out currentScript))
			{
				currentScript = currentScript.Trim();

				if (!currentScript.EndsWith("}")
					&& !currentScript.EndsWith(";"))
				{
					currentScript += ";";
				}

				Attributes[eventKey] = currentScript + " " + newScript;
			}
			else
			{
				Attributes[eventKey] = newScript;
			}
		}

       

        public string Html()
        {
            if (ViewContext == null)
            {
                throw new ArgumentNullException("ViewContext");
            }

            var html = new StringBuilder();

            Initialise(ViewContext);
            
            using (var writer = new StringWriter(html))
            {
                writer.Write(ToString(RenderMode));

                RenderHtml(writer, ViewContext);
            }

            return html.ToString();
        }

        // Override if the control needs access to the ViewContext.
        protected virtual void Initialise(ViewContext viewContext) { }

        // Override if the control needs to render some custom HTML (e.g. MvcCheckBox).
        protected virtual void RenderHtml(StringWriter writer, ViewContext viewContext) { }

      

    }
}
