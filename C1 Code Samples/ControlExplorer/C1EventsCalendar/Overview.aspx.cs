using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1EventsCalendar
{
	public partial class Overview : System.Web.UI.Page
	{
		protected override void OnInit(EventArgs e)
		{
			this.Session["C1EvCalSessionUsed"] = true;
			string sessionDataFileName = "~/C1EventsCalendar/" + String.Format("c1evcaldata{0}.xml", this.User.Identity.Name + this.Session.LCID).Replace("\\", "");
			this.C1EventsCalendar1.DataStorage.DataFile = sessionDataFileName;
			base.OnInit(e);
		}
		protected void Page_Load(object sender, EventArgs e)
		{

		}
	}
}