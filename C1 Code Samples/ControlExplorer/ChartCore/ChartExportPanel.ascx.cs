using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.ChartCore
{
	public partial class ChartExportPanel : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		public string ChartType { get; set; }

		public string ChartWidgetType
		{
			get
			{
				if (string.IsNullOrEmpty(ChartType) || ChartType.Length == 1)
					return string.Empty;

				return "wijmo"+ChartType[0] + ChartType.Substring(1).ToLower();
			}
		}
		
		public string C1ChartWidgetName
		{
			get
			{
				if (string.IsNullOrEmpty(ChartType))
					return string.Empty;

				return ChartType.ToLower();
			}
		}
	}
}