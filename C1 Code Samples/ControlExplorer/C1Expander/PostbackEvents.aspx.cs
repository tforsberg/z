using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Expander
{
	public partial class PostbackEvents : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void C1Expander1_OnExpandedChanged(object sender, EventArgs e)
		{
			Label1.Text = string.Format("(C1Expander1) Expanded state changed to {0}.", C1Expander1.Expanded);
		}

		protected void C1Expander2_OnExpandedChanged(object sender, EventArgs e)
		{
			Label2.Text = string.Format("(C1Expander2) Expanded state changed to {0}.", C1Expander2.Expanded);
		}
	}
}