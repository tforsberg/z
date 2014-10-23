using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer
{
	public partial class ClientLogger : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		public string Label {
			get {
				return Label1.Text;
			}
			set {
				Label1.Text = value;
			}
		}
	}
}