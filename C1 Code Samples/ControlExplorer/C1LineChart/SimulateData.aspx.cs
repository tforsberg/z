using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_SimulateData : System.Web.UI.Page
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
		var xValues = new List<double?>();
		var yValues = new List<double?>();
		var randomDataValuesCount = 10;
		var random = new Random();

		for (var i = 0; i < randomDataValuesCount; i++)
		{
			xValues.Add(i);
			yValues.Add(random.Next(0, 100));
		}

		var series = new LineChartSeries();
		this.C1LineChart1.SeriesList.Add(series);
		series.Markers.Visible = true;
		series.Markers.Type = MarkerType.Circle;
		series.Data.X.AddRange(xValues.ToArray<double?>());
		series.Data.Y.AddRange(yValues.ToArray<double?>());
		series.LegendEntry = true;
	}
}