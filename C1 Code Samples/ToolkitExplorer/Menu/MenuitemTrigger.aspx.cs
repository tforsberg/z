using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Extenders.C1Menu;

namespace ControlExplorer.Menu
{
	public partial class MenuitemTrigger : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		//protected void triggerEvent_SelectedIndexChanged(object sender, EventArgs e)
		//{
		//    MenuExtender1.TriggerEvent = ConvertEnum(triggerEvent.SelectedValue);
		//}

		//private C1.Web.Wijmo.Extenders.C1Menu.TriggerEvent ConvertEnum(string s)
		//{
		//    switch(s)
		//    {
		//        case "click":
		//            return C1.Web.Wijmo.Extenders.C1Menu.TriggerEvent.Click;
		//        case "dblclick":
		//            return C1.Web.Wijmo.Extenders.C1Menu.TriggerEvent.Dblclick;
		//        case "rtclick":
		//            return C1.Web.Wijmo.Extenders.C1Menu.TriggerEvent.Rtclick;
		//        default:
		//            return C1.Web.Wijmo.Extenders.C1Menu.TriggerEvent.Mouseenter;
		//    }
		//}
	}
}