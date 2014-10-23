using System;
using System.Linq;

namespace ControlExplorer.C1Accordion
{
	public partial class ExpandDirection : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				CSExpandDirectionDDL.DataSource = 
					Enum.GetNames(typeof (C1.Web.Wijmo.Controls.C1Accordion.ExpandDirection))
					.Select(s => s.ToLower());
				CSExpandDirectionDDL.DataBind();

				SSExpandDirectionDDL.DataSource = 
					Enum.GetNames(typeof(C1.Web.Wijmo.Controls.C1Accordion.ExpandDirection));
				SSExpandDirectionDDL.DataBind();
				SetExpandDirection(C1Accordion1.ExpandDirection.ToString());
			}
		}

		private void SetExpandDirection(string expandDirection)
		{
			CSExpandDirectionDDL.SelectedValue = expandDirection.ToLower();
			SSExpandDirectionDDL.SelectedValue = expandDirection;
			C1Accordion1.ExpandDirection = (C1.Web.Wijmo.Controls.C1Accordion.ExpandDirection)
				Enum.Parse(typeof(C1.Web.Wijmo.Controls.C1Accordion.ExpandDirection), expandDirection);
		}

		protected void SSExpandDirectionDDL_SelectedIndexChanged(object sender, EventArgs e)
		{
			SetExpandDirection(SSExpandDirectionDDL.SelectedValue);
			UpdatePanel1.Update();
		}
	}
}