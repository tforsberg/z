using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer
{
	public partial class Controls : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadData();
			}			
		}

		private void LoadData()
		{
			ControlData data = new ControlData();

			RptWidgets.DataSource = data.GetAllControls();
			RptWidgets.DataBind();
		}
	}
}