using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1GridView
{
	public partial class ColumnVisibility : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}



		protected void chkbox_CheckedChanged(object sender, EventArgs e)
		{
			CheckBox chk = sender as CheckBox;
			if (chk != null) 
			{
				int index = int.Parse(chk.ID.Replace("chk_", ""));
				C1GridView1.Columns[index].Visible = chk.Checked;
				UpdatePanel1.Update();
			}
		}
	}
}