using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1SiteMap
{
    public partial class Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void C1SiteMap1_NodeDataBound(object sender, C1.Web.Wijmo.Controls.C1SiteMap.C1SiteMapNodeEventArgs e)
        {
            e.Node.NavigateUrl = "#";
        }
    }
}