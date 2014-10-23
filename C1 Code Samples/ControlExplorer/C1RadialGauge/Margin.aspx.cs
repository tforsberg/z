using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1RadialGauge
{
	public partial class Margin : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnExec_Click(object sender, EventArgs e)
        {
            int t,l,r,b;
            Int32.TryParse(txBottom.Text,out b);
            Int32.TryParse(txLeft.Text,out l);
            Int32.TryParse(txTop.Text,out t);
            Int32.TryParse(txRight.Text,out r);
            Gauge1.MarginLeft = l;
            Gauge1.MarginTop = t;
            Gauge1.MarginRight = r;
            Gauge1.MarginBottom = b;
            update1.Update();
        }
	}
}