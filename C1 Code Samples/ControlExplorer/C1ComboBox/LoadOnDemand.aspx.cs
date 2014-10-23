using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1ComboBox;
using System.Data;

namespace ControlExplorer.C1ComboBox
{
	public partial class LoadOnDemand : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

		private DataTable GetDataTable(string name)
		{
			DataTable dt = new DataTable();
			dt.Columns.Add(new DataColumn("Text"));
			dt.Columns.Add(new DataColumn("Value"));
			dt.Columns.Add(new DataColumn("Selected", typeof(Boolean)));

			for (int i = 0; i < 30; i++)
			{
				DataRow row1 = dt.NewRow();
				row1["Text"] = name + i.ToString();
				row1["Value"] = i.ToString();
				row1["Selected"] = false;
				dt.Rows.Add(row1);
			}

			return dt;
		}

		protected void C1ComboBox1_ItemPopulate(object sender,  C1ComboBoxItemPopulateEventArgs args)
		{
			DataTable dt = GetDataTable("The new lang. X");
			if (args.RequestedItemCount >= dt.Rows.Count)
			{
				args.EndRequest = true;
			}

			int curOffset = args.RequestedItemCount;
			int endOffset = Math.Min(curOffset + 5, dt.Rows.Count);

			for (int i = curOffset; i < endOffset; i++)
			{
				C1ComboBoxItem item = new C1ComboBoxItem();
				item.Text = dt.Rows[i]["Text"].ToString();
				item.Value = dt.Rows[i]["Value"].ToString();
				item.Selected = (bool)dt.Rows[i]["Selected"];
				this.C1ComboBox1.Items.Add(item);
			}
		}

		protected void C1ComboBox2_CallbackDataBind(object sender, C1ComboBoxCallbackEventArgs args)
		{
			args.DataSource = GetDataTable("My number is ");
			args.PageSize = 12;
		}

	}
}