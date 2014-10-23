using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ToolTip
{
    public partial class CalloutFilled : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void calloutFilled_CheckedChanged(object sender, EventArgs e)
        {
            Tooltip1.CalloutFilled = calloutFilled.Checked;
            UpdatePanel1.Update();
        }
    }
}