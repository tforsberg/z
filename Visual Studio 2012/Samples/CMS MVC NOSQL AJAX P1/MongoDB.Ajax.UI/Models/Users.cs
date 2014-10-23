using System;
using MongoDB.Ajax.Business.Enums;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB.Ajax.Business.Models
{
    [BsonIgnoreExtraElements]
    [CollectionName("users")]
    public class User : IObject
    {
        public User()
        {
            Created = DateTime.UtcNow;
            Status = (int)UserStatus.Pending;
            RoleId = ObjectId.Empty;
        }
        [BsonElement("uid")]
        public string UserName { get; set; }

        [BsonElement("rid")]
        public ObjectId RoleId { get; set; }

        [BsonElement("pwd")]
        public string Pwd { get; set; }

        [BsonElement("email")]
        public string Email { get; set; }

        // email or username
        [BsonIgnoreIfNull]
        [BsonElement("refer")]
        public string Refer { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("fname")]
        public string FullName { get; set; }

        [BsonElement("ava")]
        public string Avatar { get; set; }

        [BsonElement("sex")]
        public int Sex { get; set; }

        [BsonElement("status")]
        public int Status { get; set; }
        
        [BsonElement("secret")]
        public string SecretKey { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("bth")]
        public DateTime? Birthday { get; set; }

        [BsonDateTimeOptions(Kind = DateTimeKind.Utc)]
        [BsonElement("crt")]
        public DateTime Created { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("actived")]
        public DateTime? Actived { get; set; }

        // Số chứng minh thư
        [BsonIgnoreIfNull]
        [BsonElement("cid")]
        public string CardId { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("province")]
        public string Province { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("add")]
        public string Address { get; set; }


        [BsonIgnoreIfNull]
        [BsonElement("mobi")]
        public string Mobi { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("tel")]
        public string Tel { get; set; }

    }
}
