using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ControlExplorer.C1ComboBox
{
	public partial class TextIcon : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack) 
			{
				BindData();
			}
		}

		class ImageItem {

			public ImageItem(string name, string path) 
			{
				this.Name = name;
				this.Path = path;
			}

			private string _name;
			public string Name 
			{
				get
				{
					return _name;
				}
				set
				{
					_name = value;
				}
			}

			private string _path;
			public string Path 
			{
				get 
				{
					return _path;
				}
				set
				{
					_path = value;
				}
			}
		}

		private void BindData()
		{
			
			
			var folder = Server.MapPath("~/explore/css/images/icons/32");
			DirectoryInfo di = new DirectoryInfo(folder);
			FileInfo[] files = di.GetFiles();
			List<ImageItem> items = new List<ImageItem>();
			string basePath = this.Page.ResolveUrl("~/explore/css/images/icons/32");
			foreach (FileInfo fi in files)
			{
				items.Add(new ImageItem(fi.Name, basePath + "/" + fi.Name));
			}
			ComboBox1.DataSource = items;
			ComboBox1.DataTextField = "Name";
			ComboBox1.DataValueField = "Name";
			ComboBox1.DataBind();
		}

	}
}