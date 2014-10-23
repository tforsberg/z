using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1AutoComplete
{
    public partial class MultipleValues : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void C1AutoComplete1_ItemSelected(object sender, EventArgs e)
        {
			ServerSideLogger.AppendLine("ItemSelected: " + C1AutoComplete1.Text);
        }
    }
}