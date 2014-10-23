using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace iTunes
{
	public partial class _Default : System.Web.UI.Page
	{
		public static string FilterExpr = string.Empty;

		protected void Page_Init(object sender, EventArgs e)
		{
			MnuLibrary.ItemClick += new C1.Web.Wijmo.Controls.C1Menu.C1MenuEventHandler(MnuLibrary_ItemClick);
			MnuPlaylists.ItemClick += new C1.Web.Wijmo.Controls.C1Menu.C1MenuEventHandler(MnuPlaylists_ItemClick);

			ChinookModel.ChinookEntities c = new ChinookModel.ChinookEntities();
			List<ChinookModel.Playlist> pl = c.Playlists.ToList<ChinookModel.Playlist>();
			//GrdMedia.PageIndexChanging += new C1.Web.UI.Controls.C1GridView.C1GridViewPageEventHandler(GrdMedia_PageIndexChanging);
			//GrdMedia.Sorting += new C1.Web.UI.Controls.C1GridView.C1GridViewSortEventHandler(GrdMedia_Sorting);
			foreach (ChinookModel.Playlist p in pl)
			{
				p.Tracks.Load();

				if (p.PlaylistId < 5)
				{
					C1.Web.Wijmo.Controls.C1Menu.C1MenuItem i = new C1.Web.Wijmo.Controls.C1Menu.C1MenuItem();
					i.Text = p.Name;
					i.Value = p.PlaylistId.ToString();
					MnuLibrary.Items.Add(i);
				}
				else
				{
					C1.Web.Wijmo.Controls.C1Menu.C1MenuItem i = new C1.Web.Wijmo.Controls.C1Menu.C1MenuItem();
					i.Text = p.Name;
					i.Value = p.PlaylistId.ToString();
					MnuPlaylists.Items.Add(i);
				}

			}
			if (Page.IsPostBack == false)
			{
				BindTracks(1);
			}


		}

		public void BindTracks(int PlaylistID)
		{
			DataTracks.SelectParameters["PlaylistId"].DefaultValue = PlaylistID.ToString();
			foreach (C1.Web.Wijmo.Controls.C1Menu.C1MenuItem i in MnuLibrary.Items)
			{
				//i.Checked = false;
			}
			foreach (C1.Web.Wijmo.Controls.C1Menu.C1MenuItem i in MnuPlaylists.Items)
			{
				//i.Checked = false;
			}
		}

		protected void MnuPlaylists_ItemClick(object sender, C1.Web.Wijmo.Controls.C1Menu.C1MenuEventArgs e)
		{
			if (string.IsNullOrEmpty(e.Item.Value) == false)
			{
				BindTracks(int.Parse(e.Item.Value));
				// e.Item.Checked = true;
			}
		}

		protected void MnuLibrary_ItemClick(object sender, C1.Web.Wijmo.Controls.C1Menu.C1MenuEventArgs e)
		{
			if (string.IsNullOrEmpty(e.Item.Value) == false)
			{
				BindTracks(int.Parse(e.Item.Value));
				//e.Item.Checked = true;
			}
		}
		protected void btnSearch_Click(object sender, ImageClickEventArgs e)
		{
			if (txtSearchBox.Text.Length > 0)
			{

			}
		}
		protected void DataTracks_Filtering(object sender, ObjectDataSourceFilteringEventArgs e)
		{
			if (txtSearchBox.Text.Length == 0)
			{
			}

		}
	}
}