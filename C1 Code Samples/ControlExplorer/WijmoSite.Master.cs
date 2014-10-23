using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer
{
    public partial class WijmoSite : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();

            this.lblColophon.Text = string.Format("© {0} GrapeCity, Inc. All Rights Reserved. All product and company names herein may be trademarks of their respective owners.", DateTime.Today.Year);
        }
    }
}