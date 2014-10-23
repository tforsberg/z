using System;
using System.Data;
using System.Data.OleDb;

namespace ControlExplorer.Grid
{
    public partial class DataTypes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\\C1NWind.mdb;Persist Security Info=True"))
            {
                using (OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT TOP 10 P.ProductID, P.UnitPrice, UnitsInStock as Quantity, OD.Discount, Discontinued FROM Products as P INNER JOIN (SELECT ProductID, First(Discount) as Discount FROM [Order Details] GROUP BY ProductID) as OD ON P.ProductID = OD.ProductID", connection))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);

                    GridExtender1.Data.DataSource = dt;
                    demo2.DataSource = dt;
                    demo2.DataBind();
                }
            }
        }
    }
}