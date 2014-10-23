using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class C1Calendar_MultiViews : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		if (!IsPostBack)
		{
			SetRowsColumns();
		}
    }

	protected void RowsColumnsChanged(object sender, EventArgs e)
	{
		SetRowsColumns();
		UpdatePanel1.Update();
	}

	private void SetRowsColumns()
	{
		C1Calendar1.MonthRows = int.Parse(RowsDdl.SelectedValue);
		C1Calendar1.MonthCols = int.Parse(ColumnsDdl.SelectedValue);
	}
}