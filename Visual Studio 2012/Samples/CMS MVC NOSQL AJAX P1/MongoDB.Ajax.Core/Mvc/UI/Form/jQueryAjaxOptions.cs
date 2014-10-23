using System;
using System.ComponentModel;
using System.Configuration;
using System.Runtime.Serialization;
using System.Text;
using MongoDB.Ajax.Core.Extensions;

namespace MongoDB.Ajax.Business
{
    [DataContract]
    public sealed class jQueryAjaxOptions
    {
        [IgnoreDataMember]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public bool Metadata
        {
            get { return Convert.ToBoolean(ConfigurationManager.AppSettings["jQueryMetadataEnabled"]); }
        }

        [IgnoreDataMember]
        public AjaxRequestDataType Type = AjaxRequestDataType.Script;

        [IgnoreDataMember]
        public AjaxResultInlineMode Mode = AjaxResultInlineMode.Replace;

        [DataMember(Name = "loading")]
        public bool Loading { get; set; }
        [DataMember(Name = "hashPwd")]
        public bool HashPwd { get; set; }

        [DataMember(Name = "target")]
        public string TargetId { get; set; }

        [DataMember(Name = "onRequest",IsRequired = false)]
        public string OnRequest { get; set; }
        [DataMember(Name = "onComplete", IsRequired = false)]
        public string OnComplete { get; set; }

        [DataMember(Name = "onError", IsRequired = false)]
        public string OnError { get; set; }
       

        [DataMember(Name = "resultMode")]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public string ResultMode
        {
            get
            {
                switch (Mode)
                {
                    case AjaxResultInlineMode.Append:
                        return "append";
                    case AjaxResultInlineMode.InsertAfter:
                        return "after";
                    case AjaxResultInlineMode.InsertBefore:
                        return "before";
                    case AjaxResultInlineMode.ReplaceWith:
                        return "replacewith";
                    default:
                        return "replace";

                }

            }
            private set
            {
                
            }
        }

        [DataMember(Name = "dataType")]
        [EditorBrowsable(EditorBrowsableState.Never)]
        public string RequestDataType
        {
            get
            {
                switch (Type)
                {
                    case AjaxRequestDataType.Json:
                        return "json";
                    case AjaxRequestDataType.Script:
                        return "script";

                    case AjaxRequestDataType.Jsonp:
                        return "jsonp";
                    case AjaxRequestDataType.Xml:
                        return "xml";
                    case AjaxRequestDataType.Text:
                        return "text";
                    default:
                        return "html";


                }
            }
            private  set{}
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

            //sb.Append("$('form').bind('form-pre-serialize', function(e) {if (typeof tinyMCE!='undefined') tinyMCE.triggerSave();});");

            if (Metadata)
            {
                sb.Append("$('form.jquery-ajax-form')");
                sb.Append(".unbind('.jquery-ajax').bind('submit.jquery-ajax',function(e){ e.preventDefault();");
                sb.Append("var f=$(this);");
                sb.Append("var o=f.metadata({type:'attr',name:'data-jquery-ajax'});");
                sb.Append("$.Ajax.submit(f,o);");
            }
            else
            {
                sb.AppendFormat("$('#{0}')", id);

                sb.Append(".unbind('.jquery-ajax').bind('submit.jquery-ajax',function(e){ e.preventDefault();");

                sb.AppendFormat("$.Ajax.submit($(this),{0});", ToJson());
            }

            sb.Append("return false;});");

            sb.Append("});");

            sb.AppendLine("</script>");

            return sb.ToString();
        }



        /*

        public string ToJavascript()
        {
            var sb = new StringBuilder();

            sb.Append("{");

            sb.AppendFormat("dataType:'{0}',", DataType.ToString().ToLower());

            sb.AppendFormat("resultMode:'{0}',", ResultMode.ToString().ToLower());

            sb.Append(PropertyStringIfSpecified("hashPwd", HashPwd));

            sb.Append(PropertyStringIfSpecified("loading", Loading));

            if (!string.IsNullOrWhiteSpace(TargetId))
                sb.Append(PropertyStringIfSpecified("targetId", TargetId));

            if (!string.IsNullOrWhiteSpace(OnRequest))
                sb.Append(EventStringIfSpecified("onRequest", OnRequest));
            if (!string.IsNullOrWhiteSpace(OnError))
                sb.Append(EventStringIfSpecified("onError", OnError));
            if (!string.IsNullOrWhiteSpace(OnComplete))
                sb.Append(EventStringIfSpecified("onComplete", OnComplete));

            sb.Length--;

            sb.Append("}");

            return sb.ToString();
        }


        private static string EventStringIfSpecified(string propertyName, string handler)
        {
            if (!String.IsNullOrEmpty(handler))
            {
                return String.Format(CultureInfo.InvariantCulture, " {0}: $.proxy({1},this),", propertyName, handler);
            }
            return String.Empty;
        }

        private static string PropertyStringIfSpecified(string name, object value)
        {

            if (value.IsNumeric() || value.IsBoolean())
            {
                return string.Format( " {0}: {1},", name, value.ToString().ToLower());
            }
            string escapedPropertyValue = value.ToString().Replace("'", @"\'");
            return String.Format(CultureInfo.InvariantCulture, " {0}: '{1}',", name, escapedPropertyValue);
        }*/
    }
}
