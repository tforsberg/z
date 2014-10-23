using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1EventsCalendar
{
	public partial class UICustomization : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void ChkShowNavigationBar_CheckedChanged(object sender, EventArgs e)
		{
			CheckBox ckb = sender as CheckBox;
			C1EventsCalendar1.NavigationBarVisible = ckb.Checked;
			UpdatePanel1.Update();
		}

		protected void ChkShowHeaderBar_CheckedChanged(object sender, EventArgs e)
		{
			CheckBox ckb = sender as CheckBox;
			C1EventsCalendar1.HeaderBarVisible = ckb.Checked;
			UpdatePanel1.Update();
		}
	}
}