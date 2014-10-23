using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Extenders.C1Chart;

public partial class LineChart_Overview : System.Web.UI.Page
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
		var valuesX = new List<DateTime?>(){new DateTime(2010, 10, 27, 11, 48, 0), new DateTime(2010, 10, 27, 13, 47, 0), new DateTime(2010, 10, 27, 15, 46, 0), new DateTime(2010, 10, 27, 17, 45, 0), 
			new DateTime(2010, 10, 27, 19, 44, 0), new DateTime(2010, 10, 27, 21, 43, 0), new DateTime(2010, 10, 27, 23, 41, 0), new DateTime(2010, 10, 28, 1, 40, 0), new DateTime(2010, 10, 28, 3, 39, 0), 
			new DateTime(2010, 10, 28, 5, 38, 0), new DateTime(2010, 10, 28, 7, 37, 0), new DateTime(2010, 10, 28, 9, 36, 0), new DateTime(2010, 10, 28, 11, 35, 0), new DateTime(2010, 10, 28, 13, 34, 0), 
			new DateTime(2010, 10, 28, 15, 33, 0), new DateTime(2010, 10, 28, 17, 32, 0), new DateTime(2010, 10, 28, 19, 31, 0), new DateTime(2010, 10, 28, 21, 30, 0), new DateTime(2010, 10, 28, 23, 38, 0), 
			new DateTime(2010, 10, 29, 1, 27, 0), new DateTime(2010, 10, 29, 3, 26, 0), new DateTime(2010, 10, 29, 5, 25, 0), new DateTime(2010, 10, 29, 7, 24, 0), new DateTime(2010, 10, 29, 9, 23, 0), new DateTime(2010, 10, 29, 11, 22, 0)};
		var valuesY = new List<double?>() { 2665513, 2300921, 1663229, 1622528, 1472847, 1354026, 1348909, 1514946, 1746392, 2020481, 2312976, 2539210, 2657505, 2369938, 1869805, 1648695, 1529983, 1398148, 1389668, 1568134, 1787466, 2101460, 2090771, 2351994, 2537400 };

		//serieslist
		var series = new LineChartSeries();
		this.LineChartExtender1.SeriesList.Add(series);
		series.FitType = LineChartFitType.Spline;
		series.Markers.Visible = true;
		series.Markers.Type = MarkerType.Circle;
		series.Data.X.AddRange(valuesX.ToArray<DateTime?>());
		series.Data.Y.AddRange(valuesY.ToArray<double?>());
		series.Label = "Steam";
		series.LegendEntry = true;
	}
}