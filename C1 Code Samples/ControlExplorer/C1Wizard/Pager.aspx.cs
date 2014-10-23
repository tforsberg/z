using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Wizard
{
    public partial class Pager : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.Page.IsPostBack) 
            {
                this.C1Pager1.PageCount = this.C1Wizard1.Steps.Count;
                this.C1Pager1.PageIndex = this.C1Wizard1.ActiveIndex;
            }
        }
    }
}