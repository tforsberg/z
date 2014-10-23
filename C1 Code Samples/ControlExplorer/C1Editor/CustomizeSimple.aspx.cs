﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace ControlExplorer.C1Editor
{
	public partial class CustomizeSimple : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				Editor1.Text = GetFileContent();
				Editor1.SimpleModeCommands = new string[] { "BackColor","FontName","Bold", "Italic","UnderLine", "StrikeThrough", "SubScript", "SuperScript","BlockQuote", 
															"InsertCode"};
			}
		}

		private string GetFileContent()
		{
			string text = string.Empty;
			StreamReader sr = File.OpenText(Server.MapPath("~/App_Data/SimpleEditorText.txt"));
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