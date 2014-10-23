using C1.Web.Wijmo.Controls.C1Chart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1CandlestickChart
{
    public partial class Trendline : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                LoadTrendlineSeries();
            }
		}

        private void LoadTrendlineSeries()
        {
            string valueString = "8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5,17.8,18.6,19.8,18,16.9,15.6,14.7,14.2,13.9,13.2,12.8,11.7,11.2,10.5,9.4,8.9,8.4,8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2";

            string[] values = valueString.Split(',');

            var series = new CandlestickChartSeries();
            series.IsTrendline = true;
            series.Label = "Trendline";
            series.TrendlineSeries.FitType = TrendlineFitType.Polynom;
            series.TrendlineSeries.Order = 4;
            series.TrendlineSeries.SampleCount = 100;

            foreach (var valueX in this.C1CandlestickChart1.SeriesList[0].Data.X.Values)
            {
                series.TrendlineSeries.Data.X.Add(valueX.DateTimeValue);
            }

            foreach (string valueY in values)
            {
                series.TrendlineSeries.Data.Y.Add(double.Parse(valueY));
            }

            this.C1CandlestickChart1.SeriesList.Add(series);
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int order = (int)inputOrder.Value;
            int sampleCount = (int)inputSampleCount.Value;
            TrendlineFitType fitType = (TrendlineFitType)Enum.Parse(typeof(TrendlineFitType), dplFitType.SelectedValue);

            foreach (var series in this.C1CandlestickChart1.SeriesList)
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