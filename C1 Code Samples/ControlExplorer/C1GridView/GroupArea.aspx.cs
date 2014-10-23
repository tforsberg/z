using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1GridView
{
    public partial class GroupArea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void C1GridView2_ColumnGrouping(object sender, C1.Web.Wijmo.Controls.C1GridView.C1GridViewColumnGroupEventArgs e)
        {
            e.Drag.Visible = false;
        }

        protected void C1GridView2_ColumnUngrouping(object sender, C1.Web.Wijmo.Controls.C1GridView.C1GridViewColumnUngroupEventArgs e)
        {
            e.Column.Visible = true;
        }
    }
}