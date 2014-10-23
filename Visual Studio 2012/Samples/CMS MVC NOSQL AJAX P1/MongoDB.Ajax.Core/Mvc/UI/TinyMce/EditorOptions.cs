using System;
using System.ComponentModel;
using System.Configuration;
using System.Runtime.Serialization;
using System.Text;
using MongoDB.Ajax.Core.Extensions;

namespace MongoDB.Ajax.Business
{
    [DataContract]
    public class EditorOptions
    {

        
        [IgnoreDataMember]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public bool Metadata
        {
            get { return Convert.ToBoolean(ConfigurationManager.AppSettings["jQueryMetadataEnabled"]); }
        }

        [IgnoreDataMember]
        public EditorToolbarMode ToolbarMode = EditorToolbarMode.Medium;

        [DataMember(Name = "file_callback")]
        public bool FileBrowserCallback { get; set; }

        [DataMember(Name = "toolbarMode")]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public string Mode
        {
            get
            {
                switch (ToolbarMode)
                {
                    case EditorToolbarMode.Full:
                        return "full";
                    case EditorToolbarMode.Small:
                        return "small";
                    default:
                        return "medium";

                }

            }
            private set { }
        }

        public string ToJson()
        {
            return this.ToJSON(true);
        }

        public string ToJavascript(string id)
        {

            var sb = new StringBuilder();

            sb.Append("<script type=\"text/javascript\">");

            sb.Append("$(function(){");

            if (Metadata)
            {
                sb.Append("$('.tinymce').each(function () {");
                sb.Append("var e=$(this);");

                sb.Append("var o=e.metadata({type:'attr',name:'data-tinymce-editor'});");

                sb.Append("$.Editor.create(e,o);");

                sb.Append("});");
            }
            else
            {
                sb.AppendFormat("$.Editor.create('{0}',{1})", id, this.ToJson());
            }

            sb.Append("});");

            sb.Append("</script>");

            return sb.ToString();


        }

     
    }
}