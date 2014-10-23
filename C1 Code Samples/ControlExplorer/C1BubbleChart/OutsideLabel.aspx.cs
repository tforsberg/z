using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

namespace ControlExplorer.C1BubbleChart
{
	public partial class OutsideLabel : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				SetLabelCompass();
			}
		}

		private void SetLabelCompass()
		{
			var chartLabel = BubbleChart1.ChartLabel;
			chartLabel.Visible = CbVisible.Checked;
			LabelPosition labelPosition = (LabelPosition)Enum.Parse(typeof(LabelPosition), DdlPosition.SelectedValue);
			chartLabel.Position = labelPosition;
			ChartCompass compass = (ChartCompass)Enum.Parse(typeof(ChartCompass), DdlCompass.SelectedValue);
			chartLabel.Compass = compass;
		}

		protected void ApplyBtn_Click(object sender, EventArgs e)
		{
			SetLabelCompass();
			UpdatePanel1.Update();
		}
	}
}