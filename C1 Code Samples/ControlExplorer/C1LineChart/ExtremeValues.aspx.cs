using C1.Web.Wijmo.Controls.C1Chart;
using C1.Web.Wijmo.Controls.C1ComboBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class C1LineChart_ExtremeValues : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        C1LineChart1.Axis.X.AutoMin = ckxEnableAutoMinX.Checked;
        C1LineChart1.Axis.X.Min = numberXMin.Value;
        C1LineChart1.Axis.X.AutoMax = ckxEnableAutoMaxX.Checked;
        C1LineChart1.Axis.X.Max = numberXMax.Value;

        C1LineChart1.Axis.Y.AutoMin = ckxEnableAutoMinY.Checked;
        C1LineChart1.Axis.Y.Min = numberYMin.Value;
        C1LineChart1.Axis.Y.AutoMax = ckxEnableAutoMaxY.Checked;
        C1LineChart1.Axis.Y.Max = numberYMax.Value;
    }
}
