using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LinearGauge
{
	public partial class Logarithmic : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void ckxLogarithmic_CheckedChanged(object sender, EventArgs e)
        {
            Gauge1.Islogarithmic = ckxLogarithmic.Checked;
        }
	}
}