using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Extenders;

namespace ControlExplorer.Tooltip
{
	public partial class Position : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//if (!IsPostBack)
			//{
			//    string[] hposition = { "left", "center", "right" };
			//    string[] vposition = { "top", "center", "bottom" };
			//    LoadData(my1, hposition);
			//    LoadData(my2, vposition);
			//    LoadData(at1, hposition);
			//    LoadData(at2, vposition);
			//}
		}
	//    private void LoadData(DropDownList ddl, string[] arr)
	//    {
	//        ddl.Items.Clear();
	//        foreach (string s in arr)
	//        {
	//            ddl.Items.Add(new ListItem(s));
	//        }
	//    }

	//    private HPosition ConvertH(string s)
	//    {
	//        switch (s)
	//        {
	//            case "left":
	//                return HPosition.Left;
	//            case "center":
	//                return HPosition.Center;
	//            default:
	//                return HPosition.Right;
	//        }
	//    }

	//    private VPosition ConvertV(string s)
	//    {
	//        switch (s)
	//        {
	//            case "top":
	//                return VPosition.Top;
	//            case "center":
	//                return VPosition.Center;
	//            default:
	//                return VPosition.Bottom;
	//        }
	//    }

	//    protected void btnApply_Click(object sender, EventArgs e)
	//    {
	//        PositionSettings p = TooltipExtender1.Position;
	//        p.My.Left = ConvertH(my1.SelectedValue);
	//        p.My.Top = ConvertV(my2.SelectedValue);
	//        p.At.Left = ConvertH(at1.SelectedValue);
	//        p.At.Top = ConvertV(at2.SelectedValue);
	//    }
	}
}