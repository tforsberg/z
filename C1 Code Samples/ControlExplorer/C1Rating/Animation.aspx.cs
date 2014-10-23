using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Rating
{
	public partial class Animation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

        protected void btnApply_Click(object sender, EventArgs e)
        {
            C1Rating1.Animation.Animated = effectTypes.SelectedValue;
            update1.Update();
        }
	}
}