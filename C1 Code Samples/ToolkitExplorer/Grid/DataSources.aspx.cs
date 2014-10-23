using System;
using System.Data;
using System.Data.OleDb;

namespace ControlExplorer.Grid
{
    public partial class DataSources : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            using (OleDbConnection connection = new OleDbConnection("Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\\C1NWind.mdb;Persist Security Info=True"))
            {
                using (OleDbDataAdapter adapter = new OleDbDataAdapter("SELECT TOP 5 [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]", connection))
                {
                    DataTable dt = new DataTable();
                    adapter.Fill(dt);
                    GridExtender2.Data.DataSource = dt;
                }
            }
        }
    }
}