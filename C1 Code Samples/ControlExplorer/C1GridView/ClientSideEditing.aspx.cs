using System;
using System.Collections;
using System.Data;
using System.Data.OleDb;
using System.Web.UI;

namespace ControlExplorer.C1GridView
{
	public partial class Editing1 : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				UpdateView();
			}
		}

		protected void C1GridView1_RowUpdating(object sender, C1.Web.Wijmo.Controls.C1GridView.C1GridViewUpdateEventArgs e)
		{
			DataTable orders = GetDataSet();
			DataRow row = orders.Rows.Find(C1GridView1.DataKeys[e.RowIndex].Value);

			if (row != null)
			{
				foreach (DictionaryEntry entry in e.NewValues)
				{
					row[(string)entry.Key] = entry.Value;
				}
			}
			else
			{
				throw new RowNotInTableException();
			}
		}

		protected void C1GridView1_EndRowUpdated(object sender, C1.Web.Wijmo.Controls.C1GridView.C1GridViewEndRowUpdatedEventArgs e)
		{
			GetDataSet().AcceptChanges();
			UpdateView();
		}

		protected void C1GridView1_RowDeleting(object sender, C1.Web.Wijmo.Controls.C1GridView.C1GridViewDeleteEventArgs e)
		{
			DataTable orders = GetDataSet();
			DataRow row = orders.Rows.Find(C1GridView1.DataKeys[e.RowIndex].Value);

			if (row != null)
			{
				orders.Rows.Remove(row);
				orders.AcceptChanges(); 
				UpdateView();
			}
			else
			{
				throw new RowNotInTableException();
			}
		}

		private DataTable GetDataSet()
		{
			DataTable orders = Page.Session["ClinetOrders"] as DataTable;
			if (orders == null)
			{
				using (OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"))
				{
					using (OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT TOP 10 [OrderID], [ShipName], [ShipCity], [ShippedDate] FROM ORDERS WHERE [ShippedDate] IS NOT NULL", connection))
					{
						orders = new DataTable("Orders");
						adapter.Fill(orders);
						orders.PrimaryKey = new DataColumn[] { orders.Columns["OrderID"] };
                        Page.Session["ClinetOrders"] = orders;
					}
				}
			}

			return orders;
		}

		private void UpdateView()
		{
			C1GridView1.RowDeleting += new C1.Web.Wijmo.Controls.C1GridView.C1GridViewDeleteEventHandler(C1GridView1_RowDeleting);
			C1GridView1.DataSource = GetDataSet();
			C1GridView1.DataBind();
		}
	}
}