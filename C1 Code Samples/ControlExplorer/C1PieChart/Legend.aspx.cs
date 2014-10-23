using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

namespace ControlExplorer.C1PieChart
{
    public partial class Legend : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ApplySettings();
            }
        }

        private void ApplySettings()
        {
            this.C1PieChart1.Legend.Visible = this.cb1.Checked;
            this.C1PieChart1.Legend.Compass = (ChartCompass)Enum.Parse(typeof(ChartCompass), cbbCompass.SelectedValue, true);
            C1PieChart1.Legend.Orientation = (ChartOrientation)Enum.Parse(typeof(ChartOrientation), this.ccbOrientation.SelectedValue, true);
            this.update1.Update();
        }
    }
}