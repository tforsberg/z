using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace WijmoMvcApplication1.Models
{
    public class TahDoContext : DbContext
    {
        // You can add custom code to this file. Changes will not be overwritten.
        // 
        // If you want Entity Framework to drop and regenerate your database
        // automatically whenever you change your model schema, please use data migrations.
        // For more information refer to the documentation:
        // http://msdn.microsoft.com/en-us/data/jj591621.aspx
    
        public TahDoContext() : base("name=TahDoContext")
        {
        }

        public System.Data.Entity.DbSet<WijmoMvcApplication1.Models.TahDoList> TahDoLists { get; set; }

        public System.Data.Entity.DbSet<WijmoMvcApplication1.Models.TahDoItem> TahDoItems { get; set; }
    
    }
}
