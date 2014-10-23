using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace ControlExplorer.C1ReportViewer
{
	public partial class ToolBarCustomization : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			HtmlGenericControl toolbar = this.C1ReportViewer1.ToolBar;
			for (int i = toolbar.Controls.Count - 1; i >= 0; i--)
			{
				string className = ((HtmlGenericControl)toolbar.Controls[i]).Attributes["class"];
				if (!string.IsNullOrEmpty(className) && className.Contains("print"))
				{
					// remove "print" button
					toolbar.Controls.RemoveAt(i);
				}
				if (i > 6)
				{
					toolbar.Controls.RemoveAt(i);
				}
			}
		}
	}
}