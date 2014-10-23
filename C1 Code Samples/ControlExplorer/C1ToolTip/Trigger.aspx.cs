using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ToolTip
{
    public partial class Trigger : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void trigger_SelectedIndexChanged(object sender, EventArgs e)
        {
            Tooltip1.Triggers = (C1.Web.Wijmo.Controls.C1ToolTip.Trigger)Enum.Parse(typeof(C1.Web.Wijmo.Controls.C1ToolTip.Trigger), trigger.SelectedValue);
            UpdatePanel1.Update();
        }
    }
}