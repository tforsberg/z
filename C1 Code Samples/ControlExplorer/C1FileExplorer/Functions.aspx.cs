using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class Functions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.C1FileExplorer1.SearchPatterns = new string[] { };
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            this.C1FileExplorer1.EnableCopy = ckxEnableCopy.Checked;
            this.C1FileExplorer1.EnableCreateNewFolder = ckxEnableCreateFolder.Checked;
            this.C1FileExplorer1.EnableOpenFile = ckxEnableOpenFile.Checked;
            this.C1FileExplorer1.AllowFileExtensionRename = ckxAllowFileExtensionRename.Checked;

            this.C1FileExplorer1.TreePanelWidth = (int)inputTreeWidth.Value;
        }
    }
}