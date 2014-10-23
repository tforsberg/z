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
				DialogExtender1.Show = showEffectTypes.SelectedValue.Trim();
				DialogExtender1.Hide = hideEffectTypes.SelectedValue.Trim();
				DialogExtender1.ExpandingAnimation.Animated.Effect = expandEffectTypes.SelectedValue.Trim();
				DialogExtender1.CollapsingAnimation.Animated.Effect = collapseEffectTypes.SelectedValue.Trim();
			}
		}
	}
}