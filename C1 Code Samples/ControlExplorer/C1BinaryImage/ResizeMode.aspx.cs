using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1BinaryImage;

namespace ControlExplorer.C1BinaryImage
{
	public partial class ResizeMode : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			Div_CropPosition.Visible = DropDownList_ResizeMode.SelectedValue == "Crop";

			BinaryImage2.ImageData = System.IO.File.ReadAllBytes(Server.MapPath("images/ResizeModeSample.jpg"));
			BinaryImage2.AlternateText = "ResizeModeSample";
			BinaryImage2.ToolTip = "ResizeModeSample";
			BinaryImage2.SavedImageName = "ResizeModeSample";

			if (IsPostBack)
			{
				BinaryImage2.ResizeMode = (ImageResizeMode)Enum.Parse(typeof(ImageResizeMode), DropDownList_ResizeMode.SelectedValue);
				BinaryImage2.CropPosition = (ImageCropPosition)Enum.Parse(typeof(ImageCropPosition), DropDownList_CropPosition.SelectedValue);

				if (DropDownList_ResizeMode.SelectedValue != "None")
				{
					int width;
					if (int.TryParse(TextBox_Width.Text, out width))
					{
						BinaryImage2.Width = width;
					}

					int height;
					if (int.TryParse(TextBox_Height.Text, out height))
					{
						BinaryImage2.Height = height;
					}
				}
				else
				{
					BinaryImage2.Width = Unit.Empty;
					BinaryImage2.Height = Unit.Empty;
				}

				UpdatePanel1.Update();
			}
		}
	}
}