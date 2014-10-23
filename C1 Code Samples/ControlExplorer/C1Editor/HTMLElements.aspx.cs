using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Editor
{
	public partial class HTMLElements : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				string str = " ";
				str += " <table border=\"0\" cellspacing=\"5\" cellpadding=\"3\" width=\"260\" style=\"border:1px solid #6593CF\">  <tbody><tr><td colspan=\"2\"><strong>Patient Profile</strong></td>";
				str += "</tr><tr><td width=\"76\">Name</td><td width=\"197\"><input name=\"textfield\" type=\"text\" value=\"Kiltie\"></td></tr><tr><td>Breed</td><td><input name=\"textfield\" type=\"text\" value=\"Shetland Sheepdog\"></td>";
				str += "</tr><tr><td>Sex</td><td><input name=\"radiobutton\" type=\"radio\" value=\"radiobutton\" checked=\"\">M<input type=\"radio\" name=\"radiobutton\" value=\"radiobutton\">F</td>";
				str += "</tr><tr><td></td><td><input name=\"checkbox\" type=\"checkbox\" value=\"checkbox\" checked=\"\">Spayed/Neutered</td></tr><tr><td>DOM</td>";
				str += "<td><select name=\"select\"><option selected=\"\">Jan</option></select><select name=\"select\"><option selected=\"\">22</option></select><select name=\"select\"><option selected=\"\">1997</option></select></td>";
				str += "</tr><tr><td></td><td><input type=\"button\" name=\"Submit\" value=\"Update\"><input type=\"button\" name=\"Submit\" value=\"Cancel\"></td></tr></tbody></table>";

				this.C1Editor1.Text = str;
			}
		}
	}
}