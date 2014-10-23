using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Menu
{
    public partial class DataBind : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RblDataSource_SelectedIndexChanged(object sender, EventArgs e)
        {
            string datasource = RblDataSource.SelectedValue;
            if (datasource == "XmlDataSource")
            {
                Menu1.DataSourceID = "XmlDataSource1";
            }
            else
            {
                Menu1.DataSourceID = "SiteMapDataSource1";
            }
            Menu1.DataBind();
        }
    }
}