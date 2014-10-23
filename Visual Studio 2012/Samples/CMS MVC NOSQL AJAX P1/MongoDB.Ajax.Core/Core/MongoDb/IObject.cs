using MongoDB.Bson;

namespace MongoDB.Ajax.Core.MongoDb
{
    public abstract class IObject
    {
        public ObjectId Id { get; set; }

        public void Save()
        {
            MainDb.Instant.Save(this);
        }

        public void Save(string connectionName)
        {
            MainDb.Create(connectionName).Save(this);
        }
    }
}
