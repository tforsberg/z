using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class KeyboardSupports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            this.C1FileExplorer1.Shortcuts.FocusFileExplorer = inputFocusFileExplorer.Text;
            this.C1FileExplorer1.Shortcuts.FocusToolBar = inputFocusToolbar.Text;
            this.C1FileExplorer1.Shortcuts.FocusAddressBar = inputFocusAddressBar.Text;
            this.C1FileExplorer1.Shortcuts.FocusTreeView = inputFocusTreeView.Text;
            this.C1FileExplorer1.Shortcuts.FocusGrid = inputFocusGrid.Text;
            this.C1FileExplorer1.Shortcuts.FocusGridPagingSlider = inputFocusPaging.Text;
            this.C1FileExplorer1.Shortcuts.ContextMenu = inputOpenContextMenu.Text;
            this.C1FileExplorer1.Shortcuts.Back = inputBack.Text;
            this.C1FileExplorer1.Shortcuts.Forward = inputForward.Text;
            this.C1FileExplorer1.Shortcuts.Open = inputOpen.Text;
            this.C1FileExplorer1.Shortcuts.Refresh = inputRefresh.Text;
            this.C1FileExplorer1.Shortcuts.NewFolder = inputNewFolder.Text;
            this.C1FileExplorer1.Shortcuts.Delete = inputDelete.Text;
        }
    }
}