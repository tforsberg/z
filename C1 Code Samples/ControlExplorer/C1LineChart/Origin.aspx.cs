using C1.Web.Wijmo.Controls.C1Chart;
using C1.Web.Wijmo.Controls.C1ComboBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LineChart
{
    public partial class Origin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            C1LineChart1.Axis.X.Visible = ckxShowXAxis.Checked;
            C1LineChart1.Axis.X.Origin = numberXOrigion.Value;
            C1LineChart1.Axis.X.TickMajor.Position = (ChartAxisTickPosition)Enum.Parse(typeof(ChartAxisTickPosition), cbxXTickMajorPos.Text, true);
            C1LineChart1.Axis.X.TickMinor.Position = (ChartAxisTickPosition)Enum.Parse(typeof(ChartAxisTickPosition), cbxXTickMinorPos.Text, true);

            C1LineChart1.Axis.Y.Visible = ckxShowYAxis.Checked;
            C1LineChart1.Axis.Y.Origin = numberYOrigion.Value;
            C1LineChart1.Axis.Y.TickMajor.Position = (ChartAxisTickPosition)Enum.Parse(typeof(ChartAxisTickPosition), cbxYTickMajorPos.Text, true);
            C1LineChart1.Axis.Y.TickMinor.Position = (ChartAxisTickPosition)Enum.Parse(typeof(ChartAxisTickPosition), cbxYTickMinorPos.Text, true);
        }
    }
}