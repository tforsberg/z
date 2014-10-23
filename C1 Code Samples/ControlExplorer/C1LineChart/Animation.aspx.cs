using C1.Web.Wijmo.Controls.C1Chart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LineChart
{
	public partial class Animation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                ApplySettings();
                LoadRandomSeriesList();
            }
		}

        private void ApplySettings()
        {
            C1LineChart1.Animation.Enabled = ckxEnableAnimation.Checked;
            C1LineChart1.Animation.Duration = (int)numberAnimationDuration.Value;
            C1LineChart1.Animation.Easing = (ChartEasing)Enum.Parse(typeof(ChartEasing), cbxAnimationEasing.SelectedValue, true);
            C1LineChart1.Animation.Direction = (LineChartDirection)Enum.Parse(typeof(LineChartDirection), cbxAnimationDirection.SelectedValue, true);

            C1LineChart1.SeriesTransition.Enabled = ckxEnableTransition.Checked;
            C1LineChart1.SeriesTransition.Duration = (int)numberTranDuration.Value;
            C1LineChart1.SeriesTransition.Easing = (ChartEasing)Enum.Parse(typeof(ChartEasing), cbxTranEasing.SelectedValue, true);

        }

        private void LoadRandomSeriesList()
        {
            C1LineChart1.SeriesList.Clear();

            LineChartSeries series = new LineChartSeries();
            series.Markers.Visible = true;
            series.Markers.Type = MarkerType.Circle;
            series.FitType = LineChartFitType.Spline;

            C1LineChart1.SeriesList.Add(series);

            series.Data.X = new ChartXAxisList();
            series.Data.X.Add("Jan");
            series.Data.X.Add("Feb");
            series.Data.X.Add("Mar");
            series.Data.X.Add("Apr");
            series.Data.X.Add("May");
            series.Data.X.Add("Jun");
            series.Data.X.Add("Jul");
            series.Data.X.Add("Aug");
            series.Data.X.Add("Sep");
            series.Data.X.Add("Oct");
            series.Data.X.Add("Nov");
            series.Data.X.Add("Dec");

            Random random = new Random(DateTime.Now.Second);

            series.Data.Y = new ChartYAxisList();
            for (int i = 0; i < 12; i++)
            {
                series.Data.Y.Add(random.NextDouble() * 100);
            }
        }

        protected void btnReload_Click(object sender, EventArgs e)
        {
            ApplySettings();
            LoadRandomSeriesList();
        }
	}
}