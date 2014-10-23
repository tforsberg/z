using System;
using System.Data.Services;
using System.Collections.Generic;
using System.Linq;
using System.ServiceModel.Web;
using ChinookModel= iTunes.ChinookModel;

namespace DataService
{
    public class Chinook : DataService<ChinookModel.ChinookEntities>
    {
        public static void InitializeService(IDataServiceConfiguration config)
        {
            config.SetEntitySetAccessRule("*", EntitySetRights.All);
        }
    }
}
