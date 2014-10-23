using System;
using System.Data;

public partial class Pager_PagedTable : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadData();
        }
    }

    private void LoadData()
    {
        C1GridView1.DataSource = CreateDS();
        C1GridView1.DataBind();
    }

    private object CreateDS()
    {
        if (Session["_data"] == null)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("CompanyName");
            dt.Columns.Add("ContactName");
            dt.Columns.Add("ContactTitle");
            dt.Columns.Add("Address");
            dt.Columns.Add("City");

            for (int i = 1; i <= 50; i++)
            {
                dt.Rows.Add("Company" + i, "Contact" + i, "Title" + i, "Address" + i, "City" + i);
            }

            Session["_data"] = dt;
        }

        return Session["_data"];
    }
}