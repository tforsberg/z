using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ComboBox
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
			C1ComboBox1.ShowingAnimation.Animated.Effect = ShowingEffectTypesDdl.SelectedValue;
			int showingDuration;
			if (int.TryParse(ShowingSpeedTxt.Text, out showingDuration))
			{
				C1ComboBox1.ShowingAnimation.Duration = showingDuration;
			}

			C1ComboBox1.HidingAnimation.Animated.Effect = HidingEffectTypesDdl.SelectedValue;
			int hidingDuration;
			if (int.TryParse(HidingSpeedTxt.Text, out hidingDuration))
			{
				C1ComboBox1.HidingAnimation.Duration = hidingDuration;
			}
		}
	}
}