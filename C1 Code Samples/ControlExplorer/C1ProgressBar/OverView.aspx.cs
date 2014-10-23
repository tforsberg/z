using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ProgressBar
{
    public partial class OverView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void HProgressbar_RunTask(object sender, C1.Web.Wijmo.Controls.C1ProgressBar.C1ProgressBarTaskEventArgs e)
		{
			string aa = "bb";
		}
    }
}