using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1Orientation = C1.Web.Wijmo.Controls.Orientation;
using C1.Web.Wijmo.Controls;

public partial class C1Calendar_Animation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			SetAnimation();
		}
    }

	protected void ApplyBtn_Click(object sender, EventArgs e)
	{
		SetAnimation();
		UpdatePanel1.Update();
	}

	private void SetAnimation()
	{
		C1Calendar1.Direction = (C1Orientation)Enum.Parse(typeof(C1Orientation), DirectionDdl.SelectedValue);
		C1Calendar1.Easing = (Easing)Enum.Parse(typeof(Easing), EasingDdl.SelectedValue);

		int duration;
		if (int.TryParse(DurationTxt.Text, out duration))
		{
			C1Calendar1.Duration = duration;
		}
	}
}