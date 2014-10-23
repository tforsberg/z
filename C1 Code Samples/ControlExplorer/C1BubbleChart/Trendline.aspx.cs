using C1.Web.Wijmo.Controls.C1Chart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1BubbleChart
{
    public partial class Trendline : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int order = (int)inputOrder.Value;
            int sampleCount = (int)inputSampleCount.Value;
            TrendlineFitType fitType = (TrendlineFitType)Enum.Parse(typeof(TrendlineFitType), dplFitType.SelectedValue);

            foreach (var series in BubbleChart1.SeriesList)
            {
                if (series.IsTrendline)
                {
                    series.TrendlineSeries.FitType = fitType;
                    series.TrendlineSeries.Order = order;
                    series.TrendlineSeries.SampleCount = sampleCount;
                }
            }
        }
	}
}