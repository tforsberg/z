using C1.Web.Wijmo.Controls.C1Menu;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Menu
{
	public partial class ContextMenu : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            if (!IsPostBack)
            {
                this.Menu1.Trigger = "#" + this.TextBox1.ClientID;
            }
		}

        protected void cbxTriggerEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            Menu1.TriggerEvent = (TriggerEvent)Enum.Parse(typeof(TriggerEvent), cbxTriggerEvents.SelectedValue, true);

            this.TextBox1.Text = cbxTriggerEvents.SelectedItem.Text + " here to show the context menu.";
        }
	}
}