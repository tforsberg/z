using System;
using System.Data;
using System.Data.OleDb;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1GridView;

namespace ControlExplorer.C1GridView
{
	public partial class Editing : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				UpdateView();
			}
		}

		protected string HtmlEncode(object value)
		{
			return HttpUtility.HtmlEncode((string)value);
		}

		protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
		{
			C1CommandField col = (C1CommandField)C1GridView1.Columns[C1GridView1.Columns.Count - 1];
			col.ShowEditButton = CheckBox1.Checked;
			col.ShowDeleteButton = CheckBox2.Checked;
			UpdateView();
			UpdatePanel1.Update();
		}

		private void UpdateView()
		{
			// Bind the data
			C1GridView1.DataSource = GetDataSet();
			C1GridView1.DataBind();

			if (C1GridView1.EditIndex != -1)
			{
				drawEditingSymbol(C1GridView1.EditIndex);
			}
		}

		private DataTable GetDataSet()
		{
			DataTable orders = Page.Session["Orders"] as DataTable;
			if (orders == null)
			{
				using (OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"))
				{
					using (OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT [OrderID], [ShipName], [ShipCity], [ShippedDate] FROM ORDERS WHERE [ShippedDate] IS NOT NULL", connection))
					{
						orders = new DataTable();
						adapter.Fill(orders);
						orders.PrimaryKey = new DataColumn[] { orders.Columns["OrderID"] };
						Page.Session["Orders"] = orders;
					}
				}
			}

			return orders;
		}

		protected void C1GridView1_PageIndexChanging(object sender, C1GridViewPageEventArgs e)
		{
			C1GridView1.PageIndex = e.NewPageIndex;
			UpdateView();
		}

		protected void C1GridView1_RowEditing(object sender, C1GridViewEditEventArgs e)
		{
			C1GridView1.EditIndex = e.NewEditIndex;
			UpdateView();
		}

		protected void C1GridView1_RowCancelingEdit(object sender, C1GridViewCancelEditEventArgs e)
		{
			C1GridView1.EditIndex = -1;
			UpdateView();
		}

		protected void C1GridView1_RowUpdating(object sender, C1GridViewUpdateEventArgs e)
		{
			// bind the grid
			C1GridView1.DataSource = GetDataSet();
			
			// update the datasource
			C1GridView1.Update();

			// Reset the edit mode for the current item
			C1GridView1.EditIndex = -1;

			// Refresh the grid
			UpdateView();
		}

		protected void C1GridView1_RowDeleting(object sender, C1GridViewDeleteEventArgs e)
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

		protected void drawEditingSymbol(int rowIndex)
		{
			Image img = new Image();
			img.ImageUrl = "Images/editing.gif";
			C1GridView1.Rows[rowIndex].Cells[0].HorizontalAlign = HorizontalAlign.Center;
			C1GridView1.Rows[rowIndex].Cells[0].Controls.Add(img);
		}
	}
}
