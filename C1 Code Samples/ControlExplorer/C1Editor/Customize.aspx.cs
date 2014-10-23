using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ControlExplorer.C1Editor
{
	public partial class Customize : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Editor1.Text = GetFileContent();
				Editor1.RibbonUI.TabPages.RemoveAt(1);
				C1.Web.Wijmo.Controls.C1Editor.C1RibbonTabPage page = new C1.Web.Wijmo.Controls.C1Editor.C1RibbonTabPage();
				page.Name = "CustomizeTab";
				page.Text = "Customize Tab";
				Editor1.RibbonUI.TabPages.Add(page);

				C1.Web.Wijmo.Controls.C1Editor.C1RibbonGroup group = new C1.Web.Wijmo.Controls.C1Editor.C1RibbonGroup();
				group.Name = "CustomizeGroup";
				group.HeaderText = "Customize Group";
				page.Groups.Add(group);

				group.Buttons.Add(new C1.Web.Wijmo.Controls.C1Editor.C1RibbonButton("imagebrowser", "Image Browser", "wijmo-wijribbon-imagebrowser"));
				//Editor1.SimpleModeCommands
			}
		}

		private string GetFileContent()
		{
			string text = string.Empty;
			StreamReader sr = File.OpenText(Server.MapPath("~/App_Data/JavaScript.txt"));
			try
			{
				text = sr.ReadToEnd();
			}
			catch { }
			finally
			{
				sr.Close();
			}
			return text;
		}
	}
}