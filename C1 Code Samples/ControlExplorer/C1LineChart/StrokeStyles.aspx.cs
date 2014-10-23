using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_StrokeStyles : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        foreach (var style in C1LineChart1.SeriesStyles)
        {
            style.StrokeWidth = numberStrokeWidth.Value;
            style.StrokeOpacity = numberStrokeOpacity.Value;
            style.StrokeDashArray = cbxStrokePattern.SelectedValue;
        }
    }
}