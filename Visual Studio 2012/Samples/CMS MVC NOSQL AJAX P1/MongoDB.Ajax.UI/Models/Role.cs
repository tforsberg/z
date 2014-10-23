using System.Collections.Generic;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB.Ajax.Business.Models
{

    [CollectionName("roles")]
    public class Role : IObject
    {

        public Role()
        {
            Access = new Dictionary<string, Permission>();
        }

        [BsonElement("name")]
        public string Name { get; set; }

        [BsonElement("adm")]
        public bool IsAdmin { get; set; }

        [BsonElement("access")]
        public IDictionary<string, Permission> Access { get; set; }



    }
}
