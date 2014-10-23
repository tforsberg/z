using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ToolTip
{
    public partial class Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Tooltip1_OnContentCallBack(C1.Web.Wijmo.Controls.C1ToolTip.C1ToolTipCallBackEventArgs e)
        {

        }

        protected void Tooltip1_OnAjaxUpdate(C1.Web.Wijmo.Controls.C1ToolTip.C1ToolTipCallBackEventArgs e)
        {
            if (e.UpdatePanel != null)
            {
                Control c = e.UpdatePanel.FindControl("HyperLink1");
                HyperLink1.Text = e.Source;
            }
        }
    }
}