using C1.Web.Wijmo.Controls.C1FileExplorer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class ViewMode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            this.C1FileExplorer1.Mode = (ExplorerMode)Enum.Parse(typeof(ExplorerMode), dplMode.SelectedValue);
            this.C1FileExplorer1.ViewMode = (C1.Web.Wijmo.Controls.C1FileExplorer.ViewMode)Enum.Parse(typeof(C1.Web.Wijmo.Controls.C1FileExplorer.ViewMode), dplViewMode.SelectedValue);
        }
    }
}