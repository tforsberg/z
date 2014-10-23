using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ControlExplorer
{
    public partial class GetSourceCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BuildCodeView();
            }
        }

        private void BuildCodeView()
        {
            string pagePath = "";
            if (Request != null && Request.UrlReferrer.AbsolutePath != null)
            {
                pagePath = Page.MapPath(Request.UrlReferrer.AbsolutePath);
                string codePath = pagePath + ".cs";

                LblASPX.Text = File.ReadAllText(pagePath);
                LblCS.Text = File.ReadAllText(codePath);
            }
        }
    }
}