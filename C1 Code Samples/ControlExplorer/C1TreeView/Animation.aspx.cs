using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1TreeView
{
    public partial class Animation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void apply_Click(object sender, EventArgs e)
        {
            C1TreeView1.ExpandAnimation.Animated.Disabled = expandAnimationDisabled.Checked;
            C1TreeView1.ExpandAnimation.Animated.Effect = expandAnimationEffect.SelectedValue;
            C1TreeView1.ExpandAnimation.Duration = int.Parse(expandDuration.SelectedValue);
            C1TreeView1.ExpandAnimation.Easing = (C1.Web.Wijmo.Controls.Easing)Enum.Parse(typeof(C1.Web.Wijmo.Controls.Easing), expandEasing.SelectedValue);

            C1TreeView1.CollapseAnimation.Animated.Disabled = collapseAnimationDisabled.Checked;
            C1TreeView1.CollapseAnimation.Animated.Effect = collapseAnimationEffect.SelectedValue;
            C1TreeView1.CollapseAnimation.Duration = int.Parse(collapseDuration.SelectedValue);
            C1TreeView1.CollapseAnimation.Easing = (C1.Web.Wijmo.Controls.Easing)Enum.Parse(typeof(C1.Web.Wijmo.Controls.Easing), collapseEasing.SelectedValue);
            UpdatePanel1.Update();
        }
	}
}