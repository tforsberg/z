using System.Collections.Generic;
using System.Text.RegularExpressions;
using MongoDB.Ajax.Business.Enums;
using MongoDB.Ajax.Business.Models;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson;
using MongoDB.Driver.Builders;

namespace MongoDB.Ajax.Business.Repo
{
    public class NewsRepo
    {

        public void Save(News n)
        {
            MainDb.Instant.Save(n);
        }


        public News InfoByUrl(string url)
        {
            var _query = Query<News>.EQ(x => x.Url, url);
            var _info=MainDb.Instant.FindOne<News>(_query);
            if(_info!=null)
            {
                var _update = Update<News>.Set(x => x.Views, _info.Views + 1);
                MainDb.Instant.Update<News>(Query<News>.EQ(x=>x.Id,_info.Id),_update);
            }
            return _info;
        }

        public News Info(string id)
        {
            return MainDb.Instant.GetById<News>(id);
        }

        public void Remove(string id)
        {
            MainDb.Instant.Delete<News>(id);
        }
        public void Remove(string[] id)
        {
            MainDb.Instant.Delete<News>(id);
        }


        public IEnumerable<News> Top(int top, int mode)
        {

            var _query = Query<News>.In(x => x.Modes, new int[] { mode });
            var _sort = SortBy<News>.Descending(x => x.Created);

            return MainDb.Instant.Top<News>(top, _query, _sort);

        }


        public IEnumerable<News> Search(string kwd, int pageIndex, int pageSize, out long totalRows)
        {

            var _query = !string.IsNullOrWhiteSpace(kwd)
                             ? Query.Or(
                                Query<News>.Matches(x => x.Title, BsonRegularExpression.Create(new Regex(kwd, RegexOptions.IgnoreCase))),
                                Query<News>.In(x => x.Tags, new[] { kwd }),
                                Query<News>.Matches(x => x.Html, BsonRegularExpression.Create(new Regex(kwd, RegexOptions.IgnoreCase)))
                                )
                             : Query.Null;

            var _sort = SortBy<News>.Descending(x => x.Created);

            return MainDb.Instant.Find<News>(_query, _sort, pageIndex, pageSize, out totalRows);

        }


        public IEnumerable<News> All(int pageIndex, int pageSize, out long totalRows)
        {
            using (var db = new MainDb())
            {
                var query = Query<News>.EQ(x=>x.Status,(int)GlobalStatus.Actived);
                var sort = SortBy<News>.Descending(x=>x.Created);

                return db.Find<News>(query, sort, pageIndex, pageSize, out totalRows);
            }
        }


        public IEnumerable<News> QuickSearch(ObjectId catid, string kwd, int pageIndex, int pageSize,
                                                    out long totalRows)
        {

            using (var db = new MainDb())
            {
                var _query =
                    Query.Or(
                        Query.Matches("title", BsonRegularExpression.Create(new Regex(kwd, RegexOptions.IgnoreCase))),
                        Query.Matches("html", BsonRegularExpression.Create(new Regex(kwd, RegexOptions.IgnoreCase))),
                        Query.In("tags", new BsonArray(kwd))
                        );

                return db.Find<News>(_query, SortBy.Descending("crt"), pageIndex, pageSize, out totalRows);
            }
        }
    }
}
