using System;
using System.Web.UI.WebControls;

namespace ControlExplorer
{
	public partial class ServerSideLogger : System.Web.UI.UserControl
	{
		protected void Page_Load(object sender, EventArgs e)
		{
		}

		public string Title
		{
			get { return TitleLb.Text; }
			set { TitleLb.Text = value; }
		}

		public string Content
		{
			get { return ContentLb.Text; }
			set { ContentLb.Text = value; }
		}

		public void Append(string s)
		{
			ContentLb.Text += s + "\r\n";
		}

		public void AppendLine(string s)
		{
			Append(s + "<br/>");
		}
	}
}