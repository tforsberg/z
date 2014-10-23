using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class C1Tabs_AutoPostback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void C1Tab1_SelectedChanged(object sender, EventArgs e)
    {
        Label1.Text = string.Format("(C1Tabs) Selected index is {0}.", C1Tab1.Selected);
    }
}