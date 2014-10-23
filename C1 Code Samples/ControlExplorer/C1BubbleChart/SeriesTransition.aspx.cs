using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

namespace ControlExplorer.C1BubbleChart
{
	public partial class SeriesTransition : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				SetAnimation();
			}
		}

		protected void ApplyBtn_Click(object sender, EventArgs e)
		{
			SetAnimation();
			UpdatePanel1.Update();
		}

		private void SetAnimation()
		{
			BubbleChart1.Animation.Enabled = EnabledCk.Checked;
			BubbleChart1.Animation.Easing = (ChartEasing)Enum.Parse(typeof(ChartEasing), EasingDdl.SelectedValue);

			int duration;
			if (int.TryParse(DurationTxt.Text, out duration))
			{
				BubbleChart1.Animation.Duration = duration;
			}
		}
	}
}