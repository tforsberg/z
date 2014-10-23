using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolkitExplorer
{
	public partial class Default : System.Web.UI.Page
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
			WidgetData data = new WidgetData();
			RptFavoriteWidgets.DataSource = data.GetFavoriteWidgets();
			RptFavoriteWidgets.DataBind();

			//RptWidgets.DataSource = data.GetAllWidgets();
			//RptWidgets.DataBind();
		}
	}
}