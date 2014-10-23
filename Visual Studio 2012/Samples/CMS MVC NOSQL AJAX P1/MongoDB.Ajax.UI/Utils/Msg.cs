using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace MongoDB.Ajax.Business
{
    public class Msg
    {

        public bool Reload { get; set; }
        public bool Alert { get; set; }
        public string Text { get; set; }
        public string Callback { get; set; }
        public string ReturnUrl { get; set; }
        public string TargetId { get; set; }


        public static Msg Create()
        {
            return Create(null);
        }


        public static Msg Create(string text)
        {
            return new Msg { Alert = true, Text = text };

        }

        private string ReturnUrlScript()
        {

            var _returnUrl = string.Empty;

            if (Reload || !string.IsNullOrWhiteSpace(ReturnUrl))
            {
                _returnUrl = Reload ? "window.location=window.location.href;" : string.Format("window.location='{0}';", ReturnUrl);

            }
            return _returnUrl;
        }

        public string ToJavaScript()
        {
            var _sb = new StringBuilder();

            if (!string.IsNullOrWhiteSpace(Text))
            {

                _sb.AppendFormat("$.KoolBox.alert('{0}',", Text);
                _sb.Append("{");

                _sb.Append("title:'Message Box',");
                _sb.Append("closeCallback:function(){");

                if (!string.IsNullOrWhiteSpace(Callback))
                {
                    _sb.AppendFormat("eval('{0}');", Callback);
                }

                _sb.Append(ReturnUrlScript());

                _sb.Append("}");

                _sb.Append("});");
            }
            else
            {
                if (!string.IsNullOrWhiteSpace(Callback))
                {
                    _sb.AppendFormat("eval('{0}');", Callback);
                }
                _sb.Append(ReturnUrlScript());

            }

            return _sb.ToString();

        }
    }
}
