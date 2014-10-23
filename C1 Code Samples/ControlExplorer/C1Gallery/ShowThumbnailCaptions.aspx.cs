using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Gallery
{
    public partial class ShowThumbnailCaptions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbShowThumbCap_CheckedChanged(object sender, EventArgs e)
        {
            gallery.ShowThumbnailCaptions = cbShowThumbCap.Checked;
        }
    }
}