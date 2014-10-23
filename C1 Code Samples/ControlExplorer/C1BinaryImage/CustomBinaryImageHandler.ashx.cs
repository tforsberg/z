using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Web;
using C1.Web.Wijmo.Controls.C1BinaryImage;

namespace ControlExplorer.C1BinaryImage
{
	/// <summary>
	/// Summary description for CustomBinaryImageHandler
	/// </summary>
	public class CustomBinaryImageHandler : C1BinaryImageHandler
	{
		public override C1BinaryImageData ProcessImageData(C1BinaryImageData imageData)
		{
			using (var outStream = new System.IO.MemoryStream())
			using (var inStream = new System.IO.MemoryStream(imageData.Data))
			using (var image = Bitmap.FromStream(inStream))
			{
				var newImage = AddWatermark(image);
				newImage.Save(outStream, ImageFormat.Png);
				imageData.Data = outStream.ToArray();
				imageData.MimeType = "image/png";
				imageData.ImageFileName += "_Watermark";
			}

			return base.ProcessImageData(imageData);
		}

		private Image AddWatermark(Image image)
		{
			var watermarkString = "ComponentOne";
			var font = new Font("Arial", 8F, FontStyle.Regular);
			var newImage = new Bitmap(image.Width, image.Height);

			using (var g = Graphics.FromImage(newImage))
			{
				g.DrawImage(image, new Point(0, 0));
				g.DrawString(watermarkString, font, new SolidBrush(Color.White), new PointF(2, newImage.Height - font.Height - 2));
			}

			return newImage;
		}
	}
}