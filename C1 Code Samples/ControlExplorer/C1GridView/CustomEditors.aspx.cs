using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Serialization;
using C1.Web.Wijmo.Controls.C1GridView;

namespace ControlExplorer.C1GridView
{
	public partial class CustomEditors : System.Web.UI.Page
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

		
		private void UpdateView()
		{
			// Bind the data
			C1GridView1.DataSource = GetDataSet();
			C1GridView1.DataBind();
		}

		private DataTable GetDataSet()
		{
			DataTable orders = Page.Session["Products"] as DataTable;
			if (orders == null)
			{
				using (OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"))
				{
					using (OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [Discontinued] FROM [Products]", connection))
					{
						orders = new DataTable();
						adapter.Fill(orders);
						orders.PrimaryKey = new DataColumn[] { orders.Columns["ProductID"] };
						Page.Session["Products"] = orders;
					}
				}
			}

			return orders;
		}

		protected string GetCategoryName(int categoryID) 
		{
			using (OleDbConnection connection = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"))
			{
				using (OleDbCommand cmd = new OleDbCommand("SELECT [CategoryName] FROM [Categories] WHERE ([CategoryID] = ?)", connection))
				{
					connection.Open();
					cmd.Parameters.Add(new OleDbParameter("CategoryID", categoryID));
					return cmd.ExecuteScalar().ToString();
				}
			}
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
			CategoryID = null;
			UpdateView();
		}

		protected void C1GridView1_RowUpdating(object sender, C1GridViewUpdateEventArgs e)
		{
			// bind the grid
			DataTable data = GetDataSet();
			C1GridView1.DataSource = data;

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

		// There is an issue that the CategoryID can't get in C1GridView1_RowUpdating method.
		private int? CategoryID 
		{
			get 
			{
				if (ViewState["CategoryID"] == null)
				{
					return null;
				}
				else
				{
					return int.Parse(ViewState["CategoryID"].ToString());
				}
			}
			set
			{
				ViewState["CategoryID"] = value;
			}
		}

		protected void combobox1_SelectedIndexChanged(object sender, C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBoxEventArgs args)
		{
			C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBox combobox = sender as C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBox;
			if (combobox != null)
			{
				CategoryID = int.Parse(combobox.SelectedValue);
			}
		}

		protected void C1GridView1_RowUpdated(object sender, C1GridViewUpdatedEventArgs e)
		{
			DataTable orders = GetDataSet();
			orders.AcceptChanges();
		}
		
	}
}