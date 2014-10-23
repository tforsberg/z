using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_Trendline : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSeries();
        }
    }

    private void LoadSeries()
    {
        string[] months = new string[]{"Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec" };
        C1LineChart1.SeriesList.Clear();

        //add line series
        LineChartSeries series = new LineChartSeries();
        series.Markers.Visible = true;
        series.Markers.Type = MarkerType.Circle;
        series.FitType = LineChartFitType.Spline;

        C1LineChart1.SeriesList.Add(series);

        //add trendline series
        var seriesT = new LineChartSeries();
        seriesT.IsTrendline = true;
        seriesT.Label = "Trendline";
        seriesT.TrendlineSeries.FitType = TrendlineFitType.Polynom;
        seriesT.TrendlineSeries.Order = 4;
        seriesT.TrendlineSeries.SampleCount = 100;

        this.C1LineChart1.SeriesList.Add(seriesT);

        //add X data
        series.Data.X = new ChartXAxisList();
        series.Data.X.AddRange(months);

        seriesT.TrendlineSeries.Data.X.AddRange(months);

        //add Y data
        Random random = new Random(DateTime.Now.Second);
        double valueY = 0;

        series.Data.Y = new ChartYAxisList();

        for (int i = 0; i < 12; i++)
        {
            valueY = random.NextDouble() * 100;
            series.Data.Y.Add(valueY);

            seriesT.TrendlineSeries.Data.Y.Add(valueY);
        }
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        //reload data
        LoadSeries();

        int order = (int)inputOrder.Value;
        int sampleCount = (int)inputSampleCount.Value;
        TrendlineFitType fitType = (TrendlineFitType)Enum.Parse(typeof(TrendlineFitType), dplFitType.SelectedValue);

        foreach (var series in this.C1LineChart1.SeriesList)
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