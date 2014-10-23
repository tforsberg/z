using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ToolTip
{
	public partial class AjaxCallback : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void Tooltip1_OnAjaxUpdate(C1.Web.Wijmo.Controls.C1ToolTip.C1ToolTipCallBackEventArgs e)
		{
			//e.Title = "Test";
			e.Content = string.Format("This is a tooltip for Anchor{0}", int.Parse(e.Source) + 1);
		}
	}
}