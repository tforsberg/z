using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using C1.Web.Wijmo.Extenders.C1Gallery;

namespace ToolkitExplorer.Gallery
{
    public partial class Orientation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

		protected void ApplyBt_Click(object sender, EventArgs e)
		{
			if (OrientationDDL.SelectedValue == "Vertical")
			{
				gallery.Width = 750;
				gallery.Height = 256;
				CarouselExtender2.ThumbnailOrientation = C1.Web.Wijmo.Extenders.Orientation.Vertical;
			}
			else
			{
				gallery.Width = 750;
				gallery.Height = 410;
				CarouselExtender2.ThumbsDisplay = 4;
				CarouselExtender2.ThumbnailOrientation = C1.Web.Wijmo.Extenders.Orientation.Horizontal;
			}

			CarouselExtender2.ThumbnailDirection = DirectionDDL.SelectedValue == "After" ? ThumbsPosition.After : ThumbsPosition.Before;
		}
    }
}
