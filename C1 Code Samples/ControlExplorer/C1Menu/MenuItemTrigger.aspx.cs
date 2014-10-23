using C1.Web.Wijmo.Controls.C1Menu;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Menu
{
	public partial class MenuItemTrigger : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void cbxTriggerEvents_SelectedIndexChanged(object sender, EventArgs e)
        {
            Menu1.TriggerEvent = (TriggerEvent)Enum.Parse(typeof(TriggerEvent), cbxTriggerEvents.SelectedValue, true);
        }
	}
}