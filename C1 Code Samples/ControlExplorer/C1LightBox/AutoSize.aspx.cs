using C1.Web.Wijmo.Controls.C1LightBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LightBox
{
    public partial class AutoSize : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void cbxAnimation_SelectedIndexChanged(object sender, EventArgs e)
        {
            C1LightBox1.ResizeAnimation.Animated = (ResizeMode)Enum.Parse(typeof(ResizeMode), cbxAnimation.SelectedValue, true);
        }
    }
}