using System;
using System.Data;

namespace ControlExplorer.Grid
{
    public partial class CustomDataParsers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add(); 
            dt.Columns.Add();
            dt.Columns.Add();
            dt.Columns.Add();

            dt.Rows.Add("off", "off", 1, 1);
            dt.Rows.Add("on", "on", 2, 2);
            dt.Rows.Add("on", "on", 1993, 1993);
            dt.Rows.Add("off", "off", 2015, 2015);
            dt.Rows.Add("on", "on", 100, 100);

            GridExtender1.Data.DataSource = dt;
        }
    }
}