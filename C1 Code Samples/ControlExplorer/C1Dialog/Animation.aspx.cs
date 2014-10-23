using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.Dialog
{
	public partial class Animation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				dialog.Show = showEffectTypes.SelectedValue.Trim();
				dialog.Hide = hideEffectTypes.SelectedValue.Trim();
				dialog.ExpandingAnimation.Animated.Effect = expandEffectTypes.SelectedValue.Trim();
				dialog.CollapsingAnimation.Animated.Effect = collapseEffectTypes.SelectedValue.Trim();
			}
		}

		protected void btnShow_Click(object sender, EventArgs e)
		{
			dialog.ShowOnLoad = true;
			UpdatePanel1.Update();
		}

		protected void btnHide_Click(object sender, EventArgs e)
		{
			dialog.ShowOnLoad = false;
			UpdatePanel1.Update();
		}

		protected void showEffectTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			dialog.Show = showEffectTypes.SelectedValue.Trim(); 
			UpdatePanel1.Update();
		}

		protected void expandEffectTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			dialog.ExpandingAnimation.Animated.Effect = expandEffectTypes.SelectedValue.Trim();
			UpdatePanel1.Update();
		}

		protected void collapseEffectTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			dialog.CollapsingAnimation.Animated.Effect = collapseEffectTypes.SelectedValue.Trim();
			UpdatePanel1.Update();
		}

		protected void hideEffectTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			dialog.Hide = hideEffectTypes.SelectedValue.Trim();
			UpdatePanel1.Update();
		}
	}
}