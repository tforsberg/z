using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Calendar;

public partial class C1Calendar_Selection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			SetSelectionMode();
		}
    }

	private void SetSelectionMode()
	{
		var selectionMode = C1Calendar1.SelectionMode;
		selectionMode.Day = DayCk.Checked;
		selectionMode.Days = DaysCk.Checked;
		selectionMode.Month = MonthCk.Checked;
		selectionMode.WeekDay = WeekDayCk.Checked;
		selectionMode.WeekNumber = WeekNumberCk.Checked;
	}

	protected void CheckedChanged(object sender, EventArgs e)
	{
		SetSelectionMode();
		UpdatePanel1.Update();
	}
}