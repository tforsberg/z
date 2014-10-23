using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
	public partial class UploadFile : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (IsPostBack)
			{
				c1Upload1.TargetFolder = HiddenField1.Value;
				UpdatePanel1.Update();
			}
		}
	}
}