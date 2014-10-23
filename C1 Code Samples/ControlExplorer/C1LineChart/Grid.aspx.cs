using C1.Web.Wijmo.Controls.C1Chart;
using C1.Web.Wijmo.Controls.C1ComboBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class C1LineChart_Grid : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnApply_Click(object sender, EventArgs e)
    {
        C1LineChart1.Axis.X.GridMajor.Visible = ckxShowXMajorGid.Checked;
        C1LineChart1.Axis.X.GridMinor.Visible = ckxShowXMinorGid.Checked;

        C1LineChart1.Axis.Y.GridMajor.Visible = ckxShowYMajorGid.Checked;
        C1LineChart1.Axis.Y.GridMinor.Visible = ckxShowYMinorGid.Checked;
    }
}
