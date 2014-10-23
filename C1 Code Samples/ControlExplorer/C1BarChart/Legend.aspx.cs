using System;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1BarChart_Legend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
	    if (!IsPostBack)
	    {
		    UpdateLegend();
	    }
    }

	private void UpdateLegend()
	{
		C1BarChart1.Legend.Visible = LegendVisibleCkb.Checked;
		C1BarChart1.Legend.Compass = (ChartCompass)Enum.Parse(typeof(ChartCompass), CompassDdl.SelectedValue);
		C1BarChart1.Legend.Orientation = (ChartOrientation)Enum.Parse(typeof(ChartOrientation), OrientationDdl.SelectedValue);
	}

	protected void ApplyBtn_Click(object sender, EventArgs e)
	{
		UpdateLegend();
		UpdatePanel1.Update();
	}
}