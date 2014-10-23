﻿using System.Web.Mvc;
using MongoDB.Ajax.Business.Mvc.Binders;
using MongoDB.Bson;

namespace MongoDB.Ajax.Cms
{
    public static class ModelBinderConfig
    {
        public static void Register(ModelBinderDictionary binder)
        {
            binder.Add(typeof(ObjectId), new ObjectIdBinder());

            binder.Add(typeof(string[]), new StringArrayBinder());

            binder.Add(typeof(int[]), new IntArrayBinder());

        }
    }
}
