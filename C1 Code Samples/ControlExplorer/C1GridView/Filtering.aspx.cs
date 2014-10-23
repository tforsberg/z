using System;
using C1.Web.Wijmo.Controls.C1GridView;

namespace ControlExplorer.C1GridView
{
    public partial class Filtering : System.Web.UI.Page
    {
        private bool flag = false;

        protected void Filter(object sender, C1GridViewFilterEventArgs e)
        {
            flag = true;
        }

        protected void C1GridView1_DataBound(object sender, EventArgs e)
        {
            if (flag)
            {
                C1GridView1.SelectedIndex = 0;
            }
        }
    }
}
