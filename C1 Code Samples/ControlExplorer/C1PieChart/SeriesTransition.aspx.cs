using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

namespace ControlExplorer.C1PieChart
{
	public partial class SeriesTransition : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int d;
            Int32.TryParse(txtDuration.Text, out d);
            C1PieChart1.SeriesTransition.Duration = d;
            C1PieChart1.SeriesTransition.Enabled = cbEnabled.Checked;
            C1PieChart1.SeriesTransition.Easing = (ChartEasing)Enum.Parse(typeof(ChartEasing), selEasing.SelectedValue, true);
            update1.Update();
        }
	}
}