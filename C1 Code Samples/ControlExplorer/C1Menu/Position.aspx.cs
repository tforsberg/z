using C1.Web.Wijmo.Controls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Menu
{
	public partial class Position : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void btnApply_Click(object sender, EventArgs e)
        {
            Menu1.Position.My.Left = (HPosition)Enum.Parse(typeof(HPosition), cbxMyHorizontal.SelectedValue, true);
            Menu1.Position.My.Top = (VPosition)Enum.Parse(typeof(VPosition), cbxMyVertical.SelectedValue, true);

            Menu1.Position.At.Left = (HPosition)Enum.Parse(typeof(HPosition), cbxAtHorizontal.SelectedValue, true);
            Menu1.Position.At.Top = (VPosition)Enum.Parse(typeof(VPosition), cbxAtVertical.SelectedValue, true);
        }
	}
}