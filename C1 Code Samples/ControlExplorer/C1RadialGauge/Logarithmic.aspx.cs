using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1RadialGauge
{
	public partial class Logarithmic : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (IsPostBack)
                ApplySettings();
		}

        private void ApplySettings()
        {
            Gauge1.Islogarithmic = checkbox1.Checked;
            update1.Update();
        }
	}
}