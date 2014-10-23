using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;

namespace ControlExplorer.C1PieChart
{
    public partial class Tooltip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //ApplySettings();
        }
        private void ApplySettings()
        {
            C1PieChart1.Hint.Compass = (ChartLabelCompass)Enum.Parse(typeof(ChartLabelCompass), c1cbb1.SelectedValue, true);
            int x, y;
            Int32.TryParse(c1Input1.Text, out x);
            Int32.TryParse(c1Input2.Text, out y);
            C1PieChart1.Hint.OffsetX = x;
            C1PieChart1.Hint.OffsetY = y;
        }
    }
}