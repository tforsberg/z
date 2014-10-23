using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Expander
{
	public partial class ExpandDirection : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void rblDirection_SelectedIndexChanged(object sender, EventArgs e)
		{
			var value = rblDirection.SelectedValue;
			switch (value)
			{
				case "Top":
					C1Expander1.ExpandDirection = C1.Web.Wijmo.Controls.C1Expander.ExpandDirection.Top;
					break;
				case "Right":
					C1Expander1.ExpandDirection = C1.Web.Wijmo.Controls.C1Expander.ExpandDirection.Right;
					break;
				case "Bottom":
					C1Expander1.ExpandDirection = C1.Web.Wijmo.Controls.C1Expander.ExpandDirection.Bottom;
					break;
				case "Left":
					C1Expander1.ExpandDirection = C1.Web.Wijmo.Controls.C1Expander.ExpandDirection.Left;
					break;
			}
			UpdatePanel1.Update();
		}
	}
}