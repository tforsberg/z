using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Tabs;

public partial class C1Tabs_Alignment : System.Web.UI.Page
{
    

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Alignment align = (Alignment)Enum.Parse(typeof(Alignment), DropDownList1.SelectedValue);
        this.C1Tab1.Alignment = align;
        UpdatePanel1.Update();
    }
}