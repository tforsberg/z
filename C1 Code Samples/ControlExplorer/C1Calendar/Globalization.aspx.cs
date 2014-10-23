using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Calendar
{
    public partial class Globalization : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            this.C1Calendar1.Culture = new System.Globalization.CultureInfo(this.RadioButtonList1.SelectedValue);
			UpdatePanel1.Update();
        }
    }
}