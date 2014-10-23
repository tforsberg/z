using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SuperPanel_Overview : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!this.IsPostBack)
		{
			this.chbDisabled.Checked = this.SuperPanelExtender1.AnimationOptions.Disabled;
			this.DrpListEasing.Text = this.SuperPanelExtender1.AnimationOptions.Easing.ToString();
			this.txtDuration.Text = this.SuperPanelExtender1.AnimationOptions.Duration.ToString();
		}
	}	
}