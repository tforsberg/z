using System;

namespace ControlExplorer.C1Accordion
{
	public partial class AutoPostBack : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
		protected void C1Accordion1_OnSelectedIndexChanged(object sender, EventArgs e) {
			UpdatePanelServerSideLogger.Content = string.Format(
				"(C1Accordion1) Expanded SelectedIndex changed to {0}.", C1Accordion1.SelectedIndex);
		}

		protected void C1Accordion2_OnSelectedIndexChanged(object sender, EventArgs e)
		{
			ServerSideLogger.Content = string.Format(
				"(C1Accordion2) Expanded SelectedIndex changed to {0}.", C1Accordion2.SelectedIndex);
		}

	}
}