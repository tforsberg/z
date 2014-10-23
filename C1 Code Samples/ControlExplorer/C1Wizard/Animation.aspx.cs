using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class C1Wizard_Animation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void apply_Click(object sender, EventArgs e)
    {
        C1Wizard1.ShowOption.Blind = showblind.Checked;
        C1Wizard1.ShowOption.Fade = showfade.Checked;
        C1Wizard1.ShowOption.Duration = int.Parse(showduration.Text);

        C1Wizard1.HideOption.Blind = hideblind.Checked;
        C1Wizard1.HideOption.Fade = hidefade.Checked;
        C1Wizard1.HideOption.Duration = int.Parse(hideduration.Text);
        UpdatePanel1.Update();
    }
}