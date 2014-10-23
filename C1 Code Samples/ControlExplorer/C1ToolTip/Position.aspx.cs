using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ToolTip
{
    public partial class Position : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void apply_Click(object sender, EventArgs e)
        {
            Tooltip1.Position.My.Left = (C1.Web.Wijmo.Controls.HPosition)Enum.Parse(typeof(C1.Web.Wijmo.Controls.HPosition), myLeft.SelectedValue);
            Tooltip1.Position.My.Top = (C1.Web.Wijmo.Controls.VPosition)Enum.Parse(typeof(C1.Web.Wijmo.Controls.VPosition), myTop.SelectedValue);
            Tooltip1.Position.At.Left = (C1.Web.Wijmo.Controls.HPosition)Enum.Parse(typeof(C1.Web.Wijmo.Controls.HPosition), atLeft.SelectedValue);
            Tooltip1.Position.At.Top = (C1.Web.Wijmo.Controls.VPosition)Enum.Parse(typeof(C1.Web.Wijmo.Controls.VPosition), atTop.SelectedValue);
            UpdatePanel1.Update();
        }
    }
}