using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Gallery
{
	public partial class Animation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void showEffectTypes_SelectedIndexChanged(object sender, EventArgs e)
		{
			Gallery.Transitions.Animated.Effect = showEffectTypes.SelectedValue;
			UpdatePanel1.Update();
		}
	}
}