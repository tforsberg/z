using System;
using System.Data;


namespace ControlExplorer.Grid
{
    public partial class CustomEditors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataSet ds = new DataSet();
            ds.ReadXml(Server.MapPath("~/App_Data/Players.xml"));
            ds.Tables[0].DefaultView.RowFilter = "[Nationality]='United States'";
            GridExtender1.Data.DataSource = ds.Tables[0].DefaultView;
        }
    }
}