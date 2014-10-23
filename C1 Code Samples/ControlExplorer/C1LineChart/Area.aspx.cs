using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_Area : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            PrepareSeriesList();
        }
    }

    private void PrepareSeriesList()
    {
        var valuesX = new DateTime?[] { new DateTime(2008, 11, 30), new DateTime(2008, 12, 9), new DateTime(2008, 12, 19), new DateTime(2008, 12, 29), new DateTime(2009, 1, 9), new DateTime(2009, 1, 19), new DateTime(2009, 1, 30), new DateTime(2009, 2, 9), new DateTime(2009, 2, 20), new DateTime(2009, 3, 2), new DateTime(2009, 3, 9), new DateTime(2009, 3, 18), new DateTime(2009, 3, 30), new DateTime(2009, 4, 15), new DateTime(2009, 5, 1), new DateTime(2009, 5, 16), new DateTime(2009, 6, 1), new DateTime(2009, 6, 15), new DateTime(2009, 7, 2), new DateTime(2009, 7, 14), new DateTime(2009, 8, 3), new DateTime(2009, 8, 16), new DateTime(2009, 8, 31), new DateTime(2009, 9, 14), new DateTime(2009, 10, 2), new DateTime(2009, 10, 16), new DateTime(2009, 11, 1), new DateTime(2009, 11, 15), new DateTime(2009, 12, 1), new DateTime(2009, 12, 15), new DateTime(2010, 1, 3), new DateTime(2010, 1, 15), new DateTime(2010, 2, 2), new DateTime(2010, 2, 15), new DateTime(2010, 3, 1), new DateTime(2010, 3, 15), new DateTime(2010, 4, 1), new DateTime(2010, 4, 15), new DateTime(2010, 4, 20), new DateTime(2010, 4, 27), new DateTime(2010, 5, 4), new DateTime(2010, 5, 11), new DateTime(2010, 5, 18), new DateTime(2010, 5, 26), new DateTime(2010, 6, 1), new DateTime(2010, 6, 9), new DateTime(2010, 6, 15), new DateTime(2010, 6, 22), new DateTime(2010, 6, 29), new DateTime(2010, 7, 6), new DateTime(2010, 7, 13), new DateTime(2010, 7, 20), new DateTime(2010, 7, 27), new DateTime(2010, 8, 3), new DateTime(2010, 8, 10), new DateTime(2010, 8, 17), new DateTime(2010, 8, 24), new DateTime(2010, 8, 31), new DateTime(2010, 9, 1), new DateTime(2010, 9, 7), new DateTime(2010, 9, 14), new DateTime(2010, 9, 21), new DateTime(2010, 9, 28), new DateTime(2010, 10, 5), new DateTime(2010, 10, 12), new DateTime(2010, 10, 19), new DateTime(2010, 10, 26), new DateTime(2010, 11, 1), new DateTime(2010, 11, 9), new DateTime(2010, 11, 16), new DateTime(2010, 11, 23), new DateTime(2010, 11, 30), new DateTime(2010, 12, 9), new DateTime(2010, 12, 14), new DateTime(2010, 12, 22), new DateTime(2010, 12, 29), new DateTime(2011, 1, 4), new DateTime(2011, 1, 12), new DateTime(2011, 1, 20), new DateTime(2011, 1, 27), new DateTime(2011, 1, 30), new DateTime(2011, 2, 1), new DateTime(2011, 2, 9), new DateTime(2011, 2, 15), new DateTime(2011, 2, 22), new DateTime(2011, 3, 3), new DateTime(2011, 3, 8), new DateTime(2011, 3, 15), new DateTime(2011, 3, 21), new DateTime(2011, 3, 28), new DateTime(2011, 4, 4), new DateTime(2011, 4, 11), new DateTime(2011, 4, 18), new DateTime(2011, 4, 25), new DateTime(2011, 5, 3), new DateTime(2011, 5, 9), new DateTime(2011, 5, 16), new DateTime(2011, 5, 23), new DateTime(2011, 5, 30), new DateTime(2011, 6, 6), new DateTime(2011, 6, 13), new DateTime(2011, 6, 21), new DateTime(2011, 6, 27), new DateTime(2011, 7, 4), new DateTime(2011, 7, 11), new DateTime(2011, 7, 18), new DateTime(2011, 7, 25), new DateTime(2011, 8, 1), new DateTime(2011, 8, 8), new DateTime(2011, 8, 15), new DateTime(2011, 8, 17), new DateTime(2011, 8, 22), new DateTime(2011, 8, 29), new DateTime(2011, 9, 5), new DateTime(2011, 9, 12), new DateTime(2011, 9, 19), new DateTime(2011, 9, 27), new DateTime(2011, 10, 3), new DateTime(2011, 10, 10), new DateTime(2011, 10, 17) };

        //serieslist 1
        var valuesY = new double?[] { 6.38, 6.54, 6.44, 6.4, 6.36, 6.43, 6.43, 6.07, 6.33, 6.36, 6.65, 6.28, 6.15, 6.14, 5.99, 6.01, 6.12, 6.47, 5.91, 6.14, 6.16, 6.34, 6.36, 6.13, 6.06, 5.88, 5.9, 5.79, 5.61, 5.63, 5.66, 5.58, 5.6, 5.69, 5.6, 5.63, 5.56, 5.5, 5.35, 5.21, 5.27, 5.18, 5.13, 5.19, 5.14, 5.16, 5.15, 5.1, 5.12, 5.06, 5.07, 5.07, 5.11, 5.04, 5.14, 5.29, 5.17, 5.19, 5.25, 5.16, 5.14, 5.11, 5.04, 5, 4.91, 5.03, 4.94, 4.93, 4.82, 4.73, 4.69, 4.69, 4.61, 4.54, 4.67, 4.63, 4.66, 4.58, 4.58, 4.52, 4.57, 4.49, 4.37, 4.29, 4.28, 4.26, 4.25, 4.18, 4.13, 4.12, 4.12, 4.14, 4.07, 4.05, 4.07, 4.07, 4.08, 3.99, 4.05, 4.01, 3.98, 4, 3.93, 3.97, 3.95, 3.93, 3.93, 3.85, 3.81, 3.81, 3.84, 3.82, 3.79, 3.82, 3.82, 3.84, 3.8, 3.8, 3.78, 3.72 };

        var series = new LineChartSeries();
        this.C1LineChart1.SeriesList.Add(series);
        series.Markers.Visible = false;
        series.Data.X.AddRange(valuesX);
        series.Data.Y.AddRange(valuesY);
        series.Label = "Top 10,000";

        series.LegendEntry = true;

        //serieslist 2
        valuesY = new double?[] { 4.83, 4.95, 4.87, 4.84, 4.81, 4.87, 4.87, 4.6, 4.79, 4.82, 5.03, 4.76, 4.65, 4.65, 4.53, 4.55, 4.63, 4.9, 4.47, 4.65, 4.66, 4.8, 4.81, 4.64, 4.59, 4.45, 4.47, 4.38, 4.25, 4.27, 4.28, 4.22, 4.24, 4.31, 4.24, 4.27, 4.21, 4.16, 4.05, 4.05, 4.05, 4.02, 4, 4.04, 4.03, 4.01, 3.99, 4.02, 4.02, 4.01, 4.01, 4.01, 4.02, 4.01, 4.1, 4.1, 4.17, 4.18, 4.16, 4.15, 4.14, 4.13, 4.14, 4.12, 4.11, 4.15, 4.08, 4.1, 4.07, 4.05, 4.03, 4.02, 4.01, 3.98, 4, 3.97, 3.95, 3.93, 3.93, 3.92, 3.92, 3.9, 3.88, 3.87, 3.85, 3.82, 3.83, 3.91, 3.89, 3.88, 3.86, 3.85, 3.82, 3.82, 3.8, 3.79, 3.79, 3.77, 3.77, 3.73, 3.73, 3.68, 3.7, 3.7, 3.67, 3.68, 3.67, 3.68, 3.62, 3.61, 3.64, 3.64, 3.64, 3.63, 3.55, 3.54, 3.53, 3.51, 3.5, 3.59 };

        series = new LineChartSeries();
        this.C1LineChart1.SeriesList.Add(series);
        series.Markers.Visible = false;
        series.Data.X.AddRange(valuesX);
        series.Data.Y.AddRange(valuesY);
        series.Label = "Top 10,000";
        series.LegendEntry = true;

        //serieslist 3
        valuesY = new double?[] { 3.4, 3.48, 3.42, 3.41, 3.38, 3.42, 3.42, 3.23, 3.37, 3.39, 3.54, 3.34, 3.27, 3.27, 3.19, 3.2, 3.25, 3.44, 3.14, 3.27, 3.28, 3.37, 3.38, 3.26, 3.23, 3.13, 3.14, 3.08, 2.99, 3, 3.01, 2.97, 2.98, 3.03, 2.98, 3, 2.96, 2.93, 2.85, 2.88, 2.86, 2.86, 2.87, 2.88, 2.87, 2.9, 2.9, 2.91, 2.91, 2.9, 2.9, 2.91, 2.9, 2.89, 2.89, 2.91, 3.15, 3.14, 3.15, 3.14, 3.14, 3.14, 3.15, 3.15, 3.15, 3.16, 3.12, 3.15, 3.14, 3.13, 3.12, 3.11, 3.11, 3.11, 3.11, 3.13, 3.13, 3.13, 3.13, 3.11, 3.11, 3.1, 3.07, 3.06, 3.05, 3.06, 3.04, 3.06, 3.03, 3.05, 3.02, 3.02, 2.99, 2.99, 2.98, 3, 3, 2.97, 3, 2.98, 2.98, 2.98, 2.98, 2.97, 2.94, 2.93, 2.94, 2.92, 2.87, 2.87, 2.97, 2.97, 2.97, 2.97, 2.97, 2.97, 2.96, 2.95, 2.94, 2.94 };

        series = new LineChartSeries();
        this.C1LineChart1.SeriesList.Add(series);
        series.Markers.Visible = false;
        series.Data.X.AddRange(valuesX);
        series.Data.Y.AddRange(valuesY);
        series.Label = "Top Million";
        series.LegendEntry = true;
    }
}