using System.Collections.Generic;
using MongoDB.Ajax.Business.Models;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson;
using MongoDB.Driver.Builders;

namespace MongoDB.Ajax.Business.Repo
{
    public class RoleRepo
    {
        public void Save(Role r)
        {
            MainDb.Instant.Save(r);
        }

        public IEnumerable<Role> List()
        {
            return MainDb.Instant.All<Role>(SortBy<Role>.Ascending(x => x.Name));
        }

        public Role Info(string id)
        {
            return MainDb.Instant.GetById<Role>(id);
        }

        public static Role Info(ObjectId id)
        {
            return MainDb.Instant.GetById<Role>(id);
        }

        public void Remove(string id)
        {
            MainDb.Instant.Delete<Role>(id);
        }

        public void Remove(string[] id)
        {
            MainDb.Instant.Delete<Role>(id);
        }

        public void RemovePermission(string roleId, string moduleId)
        {
            var _r = Info(roleId);

            if(_r.Access.ContainsKey(moduleId))
            {
                _r.Access.Remove(moduleId);

                Save(_r);
            }

        }

        public void UpdatePermission(string roleId, string moduleId, Permission p)
        {
            var _r = Info(roleId);

            if (_r.Access.ContainsKey(moduleId))
            {
                _r.Access[moduleId] = p;
            }
            else
            {
                _r.Access.Add(moduleId, p);
            }
            Save(_r);
        }
    }
}
