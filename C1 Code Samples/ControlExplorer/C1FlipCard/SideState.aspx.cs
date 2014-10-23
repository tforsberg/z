using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FlipCard_SideState : System.Web.UI.Page
{
    private bool _changed;

	protected void Page_Load(object sender, EventArgs e)
	{

	}

    protected void FlipCard1_SideChanged(object sender, EventArgs e)
    {
        _changed = true;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string gender = FlipCard1.CurrentSide == C1.Web.Wijmo.Controls.C1FlipCard.FlipCardSide.Front ? "boy" : "girl";
        Label1.Text = "I am a " + gender + ". ";
        if (_changed)
        {
            Label1.Text += "But just seconds ago I was not.";
        }
    }
}