using C1.Web.Wijmo.Controls.C1FileExplorer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class ServerSideEvents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.C1FileExplorer1.ItemCommand += C1FileExplorer1_ItemCommand;
        }

        void C1FileExplorer1_ItemCommand(object sender, C1FileExplorerEventArgs e)
        {
            if (e.Command == FileCommand.Delete)
            {
                e.Cancel = true;
            }
        }
    }
}