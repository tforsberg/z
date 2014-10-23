using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls;

namespace ControlExplorer.C1Carousel
{
	public partial class Animation : System.Web.UI.Page
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
			C1Carousel1.Animation.Easing = (Easing)Enum.Parse(typeof(Easing), EasingDdl.SelectedValue);

			int duration;
			if (int.TryParse(DurationTxt.Text, out duration))
			{
				C1Carousel1.Animation.Duration = duration;
			}
		}
	}
}