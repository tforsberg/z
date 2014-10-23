using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ControlExplorer.C1Editor
{
	public partial class BBCode : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Editor1.Text = "This is some [B]sample text[/B]. You can visit [URL=http://componentone.com/]C-ONE[/URL].";
			}
		}
		
	}
}