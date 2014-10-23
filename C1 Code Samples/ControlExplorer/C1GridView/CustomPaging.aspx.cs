using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1GridView
{
	public partial class CustomPaging : System.Web.UI.Page
	{
		private int PageSize
		{
			get
			{
				return ViewState["PageSize"] != null ? (int)ViewState["PageSize"] : 10;
			}
			set
			{
				ViewState["PageSize"] = value;
			}
		}

		protected int CurrentIndex
		{
			get
			{
				return ViewState["CurrentIndex"] != null ? (int)ViewState["CurrentIndex"] : 0;
			}
			set
			{
				ViewState["CurrentIndex"] = value;
			}
		}

		private int TotalRecords 
		{
			get 
			{
				return ViewState["TotalRecords"] != null ? (int)ViewState["TotalRecords"] : 0;
			}
			set 
			{
				ViewState["TotalRecords"] = value;
			}
		}

		private int LastPageIndex
		{
			get 
			{
				return Convert.ToInt32(Math.Ceiling(TotalRecords * 1.0 / PageSize)) - 1;
			}
		}

		protected void Page_Init(object sender, EventArgs e)
		{
			btnFirst.ServerClick += btnFirst_ServerClick;
			btnNext.ServerClick += btnNext_ServerClick;
			btnPrevious.ServerClick += btnPrevious_ServerClick;
			btnLast.ServerClick += btnLast_ServerClick;
		}

		void btnLast_ServerClick(object sender, EventArgs e)
		{
			initButtonsState();
			CurrentIndex = LastPageIndex;
			LoadData();
			btnLast.Disabled = true;
			btnNext.Disabled = true;
		}

		private void initButtonsState()
		{
			btnLast.Disabled = false;
			btnNext.Disabled = false;
			btnPrevious.Disabled = false;
			btnFirst.Disabled = false;
		}

		void btnPrevious_ServerClick(object sender, EventArgs e)
		{
			initButtonsState();
			CurrentIndex--;
			if (CurrentIndex == 0)
			{
				btnFirst.Disabled = true;
				btnPrevious.Disabled = true;
			}
			LoadData();
		}

		void btnNext_ServerClick(object sender, EventArgs e)
		{
			initButtonsState();
			CurrentIndex++;
			if (CurrentIndex == LastPageIndex)
			{
				btnNext.Disabled = true;
				btnLast.Disabled = true;
			}
			LoadData();
		}

		void btnFirst_ServerClick(object sender, EventArgs e)
		{
			initButtonsState();
			CurrentIndex = 0;
			btnFirst.Disabled = true;
			btnPrevious.Disabled = true;
			LoadData();
		}

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadData();
				TotalRecords = GetOrderCount();
			}
		}

		

		private void LoadData()
		{
			using (OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"))
			{
				string cmdStr = string.Format("select top {0} [OrderID], [ShipName], [ShipCity], [ShippedDate] from ORDERS order by OrderID", PageSize);
				if(CurrentIndex != 0){
					cmdStr = string.Format("select top {0} [OrderID], [ShipName], [ShipCity], [ShippedDate] from ORDERS where OrderID not in (select top {1} OrderID from ORDERS order by OrderID)  order by OrderID", PageSize, CurrentIndex * PageSize);
				}
				
				using (OleDbDataAdapter adapter = new OleDbDataAdapter(cmdStr, connection))
				{
					DataTable orders = new DataTable();
					adapter.Fill(orders);
					orders.PrimaryKey = new DataColumn[] { orders.Columns["OrderID"] };
					C1GridView1.DataSource = orders;
					C1GridView1.DataBind();
					UpdatePanel1.Update();
				}
			}
		}

		private int GetOrderCount()
		{
			using (OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"))
			{
				string cmdStr = "select count(1) from ORDERS";
				using (OleDbCommand cmd = new OleDbCommand(cmdStr, connection))
				{
					connection.Open();
					return (int)cmd.ExecuteScalar();
				}
			}
		}

		protected void PageSizeDdl_SelectedIndexChanged(object sender, EventArgs e)
		{
			PageSize = int.Parse(PageSizeDdl.SelectedValue);
			CurrentIndex = 0;
			initButtonsState();
			if (LastPageIndex == CurrentIndex) {
				btnFirst.Disabled = true;
				btnNext.Disabled = true;
				btnPrevious.Disabled = true;
				btnLast.Disabled = true;
			}
			LoadData();
		}
	}
}