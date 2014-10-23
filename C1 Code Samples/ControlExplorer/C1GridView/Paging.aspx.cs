using System;

using C1.Web.Wijmo.Controls.C1Pager;
using C1.Web.Wijmo.Controls.C1GridView;

namespace ControlExplorer.C1GridView
{
    public partial class Paging : System.Web.UI.Page
    {
		protected void dplMode_SelectedIndexChanged(object sender, EventArgs e)
		{
			// apply new settings
			switch (dplMode.SelectedItem.Value)
			{
				case "Numeric":
					C1GridView1.PagerSettings.Mode = PagerMode.Numeric;
					break;
				case "NextPrevious":
					C1GridView1.PagerSettings.Mode = PagerMode.NextPrevious;
					break;
				case "NextPreviousFirstLast":
					C1GridView1.PagerSettings.Mode = PagerMode.NextPreviousFirstLast;
					break;
				case "NumericFirstLast":
					C1GridView1.PagerSettings.Mode = PagerMode.NumericFirstLast;
					break;
			}
			UpdatePanel1.Update();
		}

		protected void dplPosition_SelectedIndexChanged(object sender, EventArgs e)
		{
			// apply new settings
			switch (dplPosition.SelectedItem.Value)
			{
				case "Top":
					C1GridView1.PagerSettings.Position = PagerPosition.Top;
					break;
				case "Bottom":
					C1GridView1.PagerSettings.Position = PagerPosition.Bottom;
					break;
				case "TopAndBottom":
					C1GridView1.PagerSettings.Position = PagerPosition.TopAndBottom;
					break;
			}
			UpdatePanel1.Update();
		}

		protected void dplSize_SelectedIndexChanged(object sender, EventArgs e)
		{
			double pageSize;
			if (Double.TryParse(dplSize.SelectedValue, out pageSize))
			{
				C1GridView1.PageSize = (int)pageSize;
			}
			UpdatePanel1.Update();
		}
    }
}
