using System;
using MongoDB.Ajax.Business.Enums;
using MongoDB.Ajax.Core.MongoDb;
using MongoDB.Bson.Serialization.Attributes;

namespace MongoDB.Ajax.Business.Models
{

    [CollectionName("news")]
    public class News : IObject
    {

        public News()
        {
            Created = DateTime.UtcNow;
            Status = (int)NewsStatus.Actived;
        }

        [BsonElement("title")]
        [BsonIgnoreIfNull]
        public string Title { get; set; }

        [BsonElement("html")]
        [BsonIgnoreIfNull]
        public string Html { get; set; }

        [BsonElement("img")]
        [BsonIgnoreIfNull]
        public string Img { get; set; }

        [BsonElement("tags")]
        [BsonIgnoreIfNull]
        public string[] Tags { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("url")]
        public string Url { get; set; }


        [BsonElement("crt")]
        public DateTime Created { get; set; }


        [BsonElement("mode")]
        public int[] Modes { get; set; }

        [BsonIgnoreIfNull]
        [BsonElement("views")]
        public int Views { get; set; }


        [BsonElement("stt")]
        public int Status { get; set; }

    }
}
