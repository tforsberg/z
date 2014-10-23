using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

public partial class C1LineChart_Legend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        C1LineChart1.Legend.Visible = ckxEnableLegend.Checked;
        C1LineChart1.Legend.Compass = (ChartCompass)Enum.Parse(typeof(ChartCompass), cbxCompass.Text, true);
        C1LineChart1.Legend.Orientation = (ChartOrientation)Enum.Parse(typeof(ChartOrientation), cbxOrientation.Text, true);
    }
}