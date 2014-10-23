using C1.Web.Wijmo.Controls.C1FileExplorer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class VisibleControls : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            FileExplorerControls visibleControls = 0;

            if (ckxShowToolbar.Checked)
                visibleControls = visibleControls | FileExplorerControls.Toolbar;

            if (ckxShowAddressBox.Checked)
                visibleControls = visibleControls | FileExplorerControls.AddressBox;

            if (ckxShowFilterTextBox.Checked)
                visibleControls = visibleControls | FileExplorerControls.FilterTextBox;

            if (ckxShowTreeView.Checked)
                visibleControls = visibleControls | FileExplorerControls.TreeView;

            if (ckxShowGrid.Checked)
                visibleControls = visibleControls | FileExplorerControls.Grid;

            if (ckxShowListView.Checked)
                visibleControls = visibleControls | FileExplorerControls.ListView;

            if (ckxShowContextMenu.Checked)
                visibleControls = visibleControls | FileExplorerControls.ContextMenu;

            this.C1FileExplorer1.VisibleControls = visibleControls;

        }
    }
}