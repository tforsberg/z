using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Splitter
{
    public partial class Animation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            int d;
            Int32.TryParse(myAnimationDuration.Text, out d);
            splitter1.ResizeSettings.AnimationOptions.Duration = d;
            splitter1.ResizeSettings.AnimationOptions.Easing = (C1.Web.Wijmo.Controls.Easing)Enum.Parse(typeof(C1.Web.Wijmo.Controls.Easing),  myEasing.SelectedValue,true);
            splitter1.ResizeSettings.Ghost = myGhost.Checked;
            update1.Update();
        }
    }
}