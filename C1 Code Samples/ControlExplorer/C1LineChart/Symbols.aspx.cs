using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_Symbols : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        C1LineChart1.SeriesList[0].Markers.Symbol.Add(new LineChartMarkerSymbol() { Width = 30, Height = 30, Url = "Images/hatemo.png", Index = 1 });
        C1LineChart1.SeriesList[0].Markers.Symbol.Add(new LineChartMarkerSymbol() { Width = 30, Height = 30, Url = "Images/wijmo.png", Index = 8 });
    }

    protected void cbxMarkerTypes_SelectedIndexChanged(object sender, EventArgs e)
    {
        string marker = this.cbxMarkerTypes.SelectedValue;

        foreach (var series in this.C1LineChart1.SeriesList)
        {
            series.Markers.Type = (MarkerType)Enum.Parse(typeof(MarkerType), marker, true);
        }
    }
}