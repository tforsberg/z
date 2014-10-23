using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1GridView
{
	public partial class CommandColumns : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void LinkBtn1_Click(object sender, EventArgs e)
		{
			LinkButton btn = sender as LinkButton;
			if (btn != null)
			{
				ShowCountryLabel.Text = "Clicked from link command, the country is " + btn.CommandArgument;
			}
		}

		protected void btn1_Click(object sender, EventArgs e)
		{
			Button btn = sender as Button;
			if (btn != null)
			{
				ShowCountryLabel.Text = "Clicked from button command, the country is " + btn.CommandArgument;
			}
		}

		protected void btn2_Click(object sender, EventArgs e)
		{
			LinkButton btn = sender as LinkButton;
			if (btn != null)
			{
				ShowCountryLabel.Text = "Clicked from image button command, the country is " + btn.CommandArgument;
			}
		}

		protected void btn3_Click(object sender, EventArgs e)
		{
			LinkButton btn = sender as LinkButton;
			if (btn != null)
			{
				ShowCountryLabel.Text = "Clicked from image command, the country is " + btn.CommandArgument;
			}
		}
	}
}