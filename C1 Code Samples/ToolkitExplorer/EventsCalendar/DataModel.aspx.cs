using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ToolkitExplorer.EventsCalendar
{
	public partial class DataModel : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			this.C1EventsCalendarExtender1.DataStorage.DataFile = "";// use client storage
		}
	}
}