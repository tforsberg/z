using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LightBox
{
    public partial class TextPosition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cbxTextPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            C1LightBox1.TextPosition = (C1.Web.Wijmo.Controls.C1LightBox.TextPosition)Enum.Parse(typeof(C1.Web.Wijmo.Controls.C1LightBox.TextPosition), cbxTextPosition.SelectedValue, true);
        }
    }
}