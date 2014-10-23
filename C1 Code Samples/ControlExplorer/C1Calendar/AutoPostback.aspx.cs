using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Calendar
{
	public partial class AutoPostback : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void C1Calendar1_SelectedDatesChanged(object sender, EventArgs e)
		{
			ServerSideLogger.Content = string.Empty;
			var count = C1Calendar1.SelectedDates.Length;
			if (count == 0)
			{
				ServerSideLogger.Append("SelectedDates changed to empty.");
			}
			else
			{
				ServerSideLogger.AppendLine("SelectedDates changed to:");
				foreach (DateTime d in this.C1Calendar1.SelectedDates)
				{
					ServerSideLogger.AppendLine(d.ToShortDateString());
				}
			}
		}
	}
}

