using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class C1Tabs_Animation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void apply_Click(object sender, EventArgs e)
    {
        C1Tab1.ShowOption.Blind = showblind.Checked;
        C1Tab1.ShowOption.Fade = showfade.Checked;
        C1Tab1.ShowOption.Duration = int.Parse(showduration.SelectedValue);

        C1Tab1.HideOption.Blind = hideblind.Checked;
        C1Tab1.HideOption.Fade = hidefade.Checked;
        C1Tab1.HideOption.Duration = int.Parse(hideduration.SelectedValue);
        UpdatePanel1.Update();
    }
}