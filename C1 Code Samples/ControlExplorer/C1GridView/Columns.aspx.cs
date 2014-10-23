using System;

namespace ControlExplorer.C1GridView
{
    public partial class Columns : System.Web.UI.Page
    {
        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            C1GridView1.AllowColMoving = CheckBox1.Checked;
            C1GridView1.AllowSorting = CheckBox3.Checked;
            C1GridView1.ShowRowHeader = CheckBox4.Checked;
            UpdatePanel1.Update();
        }
    }
}
