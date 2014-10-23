using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1EventsCalendar;

namespace ControlExplorer.C1EventsCalendar
{
	public partial class Import1 : System.Web.UI.Page
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
			this.Culture = "en-US";
			this.UICulture = "en-US";
			C1EventsCalendar1.DataStorage.Import(Server.MapPath("pens_schedule_1011_full.ics"), FileFormatEnum.iCal);
			C1EventsCalendar1.DataStorage.SaveData();
		}
	}
}