using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Pager
{
    public partial class Overview : System.Web.UI.Page
    {
        protected void C1Pager1_PageIndexChanged(object sender, EventArgs e)
        {
            GridView1.PageIndex = C1Pager1.PageIndex;
            GridView1.DataBind();
        }

        protected void GridView1_DataBound(object sender, EventArgs e)
        {
            C1Pager1.PageCount = GridView1.PageCount;
        }
    }
}
