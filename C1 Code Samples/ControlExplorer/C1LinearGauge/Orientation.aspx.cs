using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LinearGauge
{
	public partial class GaugeOrientation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void cbxOrientation_SelectedIndexChanged(object sender, EventArgs e)
        {
            Unit width = Gauge1.Width;
            Unit height = Gauge1.Height;

            C1.Web.Wijmo.Controls.Orientation orientation = (C1.Web.Wijmo.Controls.Orientation)Enum.Parse(typeof(C1.Web.Wijmo.Controls.Orientation), cbxOrientation.SelectedValue);

            if (orientation != Gauge1.Orientation)
            {
                Gauge1.Width = height;
                Gauge1.Height = width;

                Gauge1.Orientation = orientation;
            }
        }
	}
}