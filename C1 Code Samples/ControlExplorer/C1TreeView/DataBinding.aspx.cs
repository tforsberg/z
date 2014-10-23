using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls;
using C1.Web.Wijmo.Controls.C1TreeView;

namespace ControlExplorer.C1TreeView
{
	public partial class DataBanding : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void dataSource_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dataSource.SelectedValue == "XML Data Source")
            {
                C1TreeViewNodeBinding binding = new C1TreeViewNodeBinding("treeviewnode");
                binding.FormatString = "{0}";
                binding.TextField = "Text";
                binding.ExpandedField = "Expanded";
                binding.ValueField = "Value";
                binding.ItemIconClassField = "ItemIconClass";
                binding.CollapsedIconClassField = "CollapsedIconClass";
                binding.ExpandedIconClassField = "ExpandedIconClass";

                C1TreeView1.DataSourceID = "XmlDataSource";
                C1TreeView1.DataBindings.Add(binding);

            }

            if (dataSource.SelectedValue == "SiteMap Data Source")
            {
                C1TreeView1.DataBindings.Clear();
                C1TreeView1.DataSourceID = "SiteMapDataSource";
            }

            UpdatePanel1.Update();
        }
	}
}