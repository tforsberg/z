using C1.Web.Wijmo.Controls.C1LightBox;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1LightBox
{
    public partial class Transition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbxAnimation_SelectedIndexChanged(object sender, EventArgs e)
        {
            C1LightBox1.TransAnimation.Animated = (TransitionMode)Enum.Parse(typeof(TransitionMode), cbxAnimation.SelectedValue, true);
        }

        protected void cbxSlideDirecion_SelectedIndexChanged(object sender, EventArgs e)
        {
            C1LightBox1.SlideDirection = (C1.Web.Wijmo.Controls.Orientation)Enum.Parse(typeof(C1.Web.Wijmo.Controls.Orientation), cbxSlideDirecion.SelectedValue, true);
        }
    }
}