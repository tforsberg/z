using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1BinaryImage
{
	public partial class SavedImageName : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			BinaryImage1.ImageData = System.IO.File.ReadAllBytes(Server.MapPath("Images/ResizeModeSample.jpg"));
			BinaryImage1.AlternateText = "Sample";
			BinaryImage1.ToolTip = "Sample";
			BinaryImage1.SavedImageName = TextBox_SavedImageName.Text;
		}

		protected void apply_Click(object sender, EventArgs e)
		{
			BinaryImage1.SavedImageName = TextBox_SavedImageName.Text;
			UpdatePanel1.Update();
		}
	}
}