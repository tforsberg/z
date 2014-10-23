using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls;

namespace ControlExplorer.C1ComboBox
{
	public partial class Position : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				SetPosition();
			}
		}

		protected void ApplyBtn_Click(object sender, EventArgs e)
		{
			SetPosition();
			UpdatePanel1.Update();
		}

		private void SetPosition()
		{
			var position = C1ComboBox1.DropDownListPosition;

			position.My.Left = (HPosition)(Enum.Parse(typeof(HPosition), MyHPDdl.SelectedValue));
			position.My.Top = (VPosition)(Enum.Parse(typeof(VPosition), MyVPDdl.SelectedValue));

			position.At.Left = (HPosition)(Enum.Parse(typeof(HPosition), AtHPDdl.SelectedValue));
			position.At.Top = (VPosition)(Enum.Parse(typeof(VPosition), AtVPDdl.SelectedValue));

			int offsetX;
			if (int.TryParse(XOffsetTxt.Text, out offsetX))
			{
				position.Offset.Left = offsetX;
			}

			int offsetY;
			if (int.TryParse(YOffsetTxt.Text, out offsetY))
			{
				position.Offset.Top = offsetY;
			}

			position.Collision.Left = (CollisionMode)(Enum.Parse(typeof(CollisionMode), CollisionLeftDdl.SelectedValue));
			position.Collision.Top = (CollisionMode)(Enum.Parse(typeof(CollisionMode), CollisionTopDdl.SelectedValue));
		}
	}
}