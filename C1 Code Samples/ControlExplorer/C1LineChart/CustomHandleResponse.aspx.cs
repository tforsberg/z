using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_CustomHandleResponse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PrepareOptions();
        }
    }

    private void PrepareOptions()
    {
        var valuesX = new List<DateTime?>(){
            DateTime.Parse("1/1/2010"),
            DateTime.Parse("2/1/2010"),
            DateTime.Parse("3/1/2010"),
            DateTime.Parse("4/1/2010"),
            DateTime.Parse("5/1/2010"),
            DateTime.Parse("6/1/2010"),
            DateTime.Parse("7/1/2010"),
            DateTime.Parse("8/1/2010"),
            DateTime.Parse("9/1/2010"),
            DateTime.Parse("10/1/2010"),
            DateTime.Parse("11/1/2010"),
            DateTime.Parse("12/1/2010")};

        //serieslist Domestic
        var valuesY = new List<double?>() { 1983, 2343, 2593, 2283, 2574, 2838, 2382, 2634, 2938, 2739, 2983, 3493 };

        var series = new LineChartSeries();
        this.C1LineChart1.SeriesList.Add(series);
        series.Markers.Visible = true;
        series.Markers.Type = MarkerType.Circle;
        series.Data.X.AddRange(valuesX.ToArray<DateTime?>());
        series.Data.Y.AddRange(valuesY.ToArray<double?>());
        series.Label = "Domestic";

        series.LegendEntry = true;

        //serieslist International
        valuesY = new List<double?>() { 574, 636, 673, 593, 644, 679, 593, 139, 599, 583, 602, 690 };

        series = new LineChartSeries();
        this.C1LineChart1.SeriesList.Add(series);
        series.Markers.Visible = true;
        series.Markers.Type = MarkerType.Circle;
        series.Data.X.AddRange(valuesX.ToArray<DateTime?>());
        series.Data.Y.AddRange(valuesY.ToArray<double?>());
        series.Label = "International";
        series.LegendEntry = true;
    }
}