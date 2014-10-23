using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;

namespace iTunes
{
	/// <summary>
	/// Summary description for ChinookMedia
	/// </summary>
	public class ChinookMedia
	{
		public ChinookMedia()
		{
			//
			// TODO: Add constructor logic here
			//
		}

		private ChinookModel.ChinookEntities _c = new ChinookModel.ChinookEntities();

		public ChinookModel.ChinookEntities c
		{
			get { return _c; }
			set { _c = value; }
		}

		public List<ChinookModel.Track> SelectAllTracksByPlaylistId(int PlaylistId, string srchExpr, string sortExpr)
		{

			var query = (from play in c.Playlists
						 from track in play.Tracks
						 where play.PlaylistId == PlaylistId
						 orderby track.Album.Artist.Name
						 select track);



			foreach (ChinookModel.Track t in query)
			{
				if (!t.AlbumReference.IsLoaded)
				{
					t.AlbumReference.Load();
				}
				if (!t.Album.ArtistReference.IsLoaded)
				{
					t.Album.ArtistReference.Load();
				}
				if (!t.GenreReference.IsLoaded)
				{
					t.GenreReference.Load();
				}
				if (!t.MediaTypeReference.IsLoaded)
				{
					t.MediaTypeReference.Load();
				}
			}
			if (!string.IsNullOrEmpty(sortExpr))
			{
				query = SelectAllSortTracks(query, sortExpr);
			}

			// if we have a search expression the search for it in the following areas:
			// - Track name
			// - Artist name
			// - Album name
			// - Genre
			if (!string.IsNullOrEmpty(srchExpr))
			{
				query = query.Where(x => x.Name.Contains(srchExpr) || x.Album.Title.Contains(srchExpr) ||
					x.Genre.Name.Contains(srchExpr) || x.Album.Artist.Name.Contains(srchExpr));
			}

			return (List<ChinookModel.Track>)query.ToList<ChinookModel.Track>();

		}

		private IQueryable<ChinookModel.Track> SelectAllSortTracks(IQueryable<ChinookModel.Track> query, string sortExpr)
		{
			if (!String.IsNullOrEmpty(sortExpr))
			{
				query = query.OrderBy(sortExpr);
			}
			return query;
		}


		public List<ChinookModel.Genre> SelectAllGenres()
		{
			var query = (from g in c.Genres
						 orderby g.Name
						 select g);

			return query.ToList<ChinookModel.Genre>();
		}
	}
}