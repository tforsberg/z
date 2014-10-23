using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Extenders.C1ComboBox;

public partial class InputDate_Dropdown : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.Page.IsPostBack)
        {
            C1ComboBoxItem item = new C1ComboBoxItem("Today", DateTime.Now.ToShortDateString());
            this.InputDateExtender1.ComboItems.Add(item);
        }
    }
}