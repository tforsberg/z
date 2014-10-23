using System.Collections.Generic;
using MongoDB.Ajax.Business.Models;

namespace MongoDB.Ajax.Business
{
   public class UserInfo
    {

       public string Id { get; set; }

       public string UserName { get; set; }

       public string Pwd { get; set; }

       public string Avatar { get; set; }

       public int Status { get; set; }

       public bool IsAdmin { get; set; }

       public IDictionary<string, Permission> Access { get; set; }

       
    }
}
