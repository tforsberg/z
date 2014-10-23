using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Superpanel
{
    public partial class OverView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            SuperPanel1.AnimationOptions.Disabled = chbDisabled.Checked;
            int v;
            Int32.TryParse(txtDuration.Text, out v);
            SuperPanel1.AnimationOptions.Duration = v;
            SuperPanel1.AnimationOptions.Easing = (C1.Web.Wijmo.Controls.Easing)Enum.Parse(typeof(C1.Web.Wijmo.Controls.Easing), DrpListEasing.SelectedValue, true);
            update1.Update();
        }
    }
}