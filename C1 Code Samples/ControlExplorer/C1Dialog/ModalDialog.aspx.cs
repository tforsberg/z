using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Window
{
	public partial class ModalDialog : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void btnShow_Click(object sender, EventArgs e)
		{
			UpdatePanel1.Update();
		}
	}
}