using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LinearGauge
{
	public partial class Temperature : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnChange_OnClick(object sender, EventArgs e)
        {
            var range = Gauge1.Ranges[0];
            if (range.EndValue >= 50)
            {
                range.StartValue = 0;
                range.EndValue = 10;
                range.RangeStyle.Fill.Type = C1.Web.Wijmo.Controls.C1Chart.ChartStyleFillType.Default;
                range.RangeStyle.Fill.Color = Color.Blue;
            }
            else
            {
                range.StartValue = 0;
                range.EndValue = 98.6;
                range.RangeStyle.Fill.Type = C1.Web.Wijmo.Controls.C1Chart.ChartStyleFillType.Default;
                range.RangeStyle.Fill.Color = Color.Red;
            }
        }
	}
}