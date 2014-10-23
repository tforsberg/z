using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB.Ajax.Business.Models
{

    public class Permission
    {

        [BsonElement("a")]
        public bool Add { get; set; }

        [BsonElement("e")]
        public bool Edit { get; set; }

        [BsonElement("d")]
        public bool Delete { get; set; }

    }
}
