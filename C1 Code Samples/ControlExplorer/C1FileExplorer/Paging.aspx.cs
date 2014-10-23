using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class Paging : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            this.C1FileExplorer1.AllowPaging = ckxAllowPaging.Checked;
            this.C1FileExplorer1.PageSize = (int)inputPageSize.Value;
        }
    }
}