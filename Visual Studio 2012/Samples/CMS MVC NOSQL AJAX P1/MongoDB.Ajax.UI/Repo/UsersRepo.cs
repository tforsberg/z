using System.Collections.Generic;
using MongoDB.Ajax.Business.Models;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson;
using MongoDB.Driver;
using MongoDB.Driver.Builders;

namespace MongoDB.Ajax.Business.Repo
{
    public class UsersRepo
    {
        public static UserInfo LogIn(string username, string password, bool updateState)
        {

            var _query = Query.And(
                Query.Or(
                Query<User>.EQ(x => x.Email, username.ToLower()),
                Query<User>.EQ(x => x.UserName, username.ToLower())),
                Query<User>.EQ(x => x.Pwd, password));
            var _u = MainDb.Instant.FindOne<User>(_query);

            if (_u != null)
            {

                var _info = new UserInfo
                           {
                               Pwd = _u.Pwd,
                               Avatar = _u.Avatar,
                               UserName = _u.UserName,
                               Id = _u.Id.ToString(),
                               Status = _u.Status

                           };

                var _role = RoleRepo.Info(_u.RoleId);

                if (!ObjectId.Empty.Equals(_u.RoleId) && _role != null)
                {
                    _info.IsAdmin = _role.IsAdmin;
                    _info.Access = _role.Access;
                }
                return _info;
            }

            return null;


        }

        public void Register(User obj)
        {
            Save(obj);

        }
        public void Save(User obj)
        {
            MainDb.Instant.Save(obj);
        }

        public bool ExistsByEmail(string email)
        {

            var _query = Query<User>.EQ(x => x.Email, email);
            return MainDb.Instant.FindOne<User>(_query) != null;

        }

        public void Active(string email, int status)
        {

            var _query = Query<User>.EQ(x => x.Email, email);
            var _update = Update<User>.Set(x => x.Status, status);
            MainDb.Instant.Update<User>(_query, _update);
        }

        public void ChangePwd(ObjectId id, string password)
        {

            var _update = Update<User>.Set(x => x.Pwd, password);
            MainDb.Instant.Update<User>(Query<User>.EQ(x => x.Id, id), _update);

        }

        public static User Info(string id)
        {
            return MainDb.Instant.GetById<User>(id);
        }

        public static User Info(ObjectId id)
        {
            return MainDb.Instant.GetById<User>(id);
        }


        public static User InfoByEmail(string email)
        {
            return MainDb.Instant.FindOne<User>(Query<User>.EQ(x => x.Email, email));
        }

        public void Remove(string id)
        {
            MainDb.Instant.Delete<User>(id);
        }

        public void Remove(string[] id)
        {
            MainDb.Instant.Delete<User>(id);
        }

        public void ResetPwd(string userId, string pwd)
        {

            var _query = Query<User>.EQ(x => x.Id, ObjectId.Parse(userId));
            var _update = Update<User>.Set(x => x.Pwd, pwd);

            MainDb.Instant.Update<User>(_query, _update);

        }

        public void ResetPwdByEmail(string email, string pwd)
        {

            var _query = Query<User>.EQ(x => x.Email, email);
            var _update = Update<User>.Set(x => x.Pwd, pwd);

            MainDb.Instant.Update<User>(_query, _update);

        }

        public void Status(string id, int t)
        {

            var _update = Update<User>.Set(x => x.Status, t);
            MainDb.Instant.Update<User>(Query<User>.EQ(x => x.Id, ObjectId.Parse(id)), _update);
        }

        public void Role(string id, string roleid)
        {

            var _update = Update<User>.Set(x => x.RoleId, ObjectId.Parse(roleid));
            MainDb.Instant.Update<User>(Query<User>.EQ(x => x.Id, ObjectId.Parse(id)), _update);
        }



        public IEnumerable<User> Search(IMongoQuery query, IMongoSortBy sort, int pageIndex, int pageSize, out long totalRows)
        {

            return MainDb.Instant.Find<User>(query, sort, pageIndex, pageSize, out totalRows);
        }


    }
}
