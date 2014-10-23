using C1.Web.Wijmo.Controls.C1SiteMap;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1SiteMap
{
    public partial class DataBinding : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void RblDataSource_SelectedIndexChanged(object sender, EventArgs e)
        {
            C1SiteMap1.DataBindings.Clear();

            string datasource = RblDataSource.SelectedValue;
            if (datasource == "XmlDataSource")
            {
                C1SiteMap1.DataSourceID = "XmlDataSource1";
                
                C1SiteMap1.DataBindings.Add(new C1SiteMapNodeBinding() { Level = 0, TextField = "text" });
                C1SiteMap1.DataBindings.Add(new C1SiteMapNodeBinding() { Level = 1, TextField = "text" });
                C1SiteMap1.DataBindings.Add(new C1SiteMapNodeBinding() { Level = 2, TextField = "text" });
            }
            else if (datasource == "SiteMapDataSource")
            {
                C1SiteMap1.DataSourceID = "SiteMapDataSource1";
            }
            else
            {
                C1SiteMap1.DataSourceID = "C1SiteMapDataSource1";
            }

            C1SiteMap1.DataBind();

            UpdatePanel1.Update();
        }

        protected void C1SiteMap1_NodeDataBound(object sender, C1SiteMapNodeEventArgs e)
        {
            e.Node.NavigateUrl = "#";
        }

    }
}