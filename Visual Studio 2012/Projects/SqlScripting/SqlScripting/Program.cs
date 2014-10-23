
// compile with: 
// /r:Microsoft.SqlServer.Smo.dll 
// /r:Microsoft.SqlServer.ConnectionInfo.dll 
// /r:Microsoft.SqlServer.Management.Sdk.Sfc.dll 

using System;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Sdk.Sfc;


namespace SqlScripting
{

    public class A
    {
        public static void Main()
        {
            String dbName = "MonoX105"; // database name

            // Connect to the local, default instance of SQL Server. 
            Server srv = new Server();

            // Reference the database.  
            Database db = srv.Databases[dbName];

            // Define a Scripter object and set the required scripting options. 
            Scripter scrp = new Scripter(srv);
            scrp.Options.ScriptDrops = false;
            scrp.Options.WithDependencies = true;
            scrp.Options.Indexes = true;   // To include indexes
            scrp.Options.DriAllConstraints = true;   // to include referential constraints in the script

            // Iterate through the tables in database and script each one. Display the script.   
            foreach (Table tb in db.Tables)
            {
                // check if the table is not a system table
                if (tb.IsSystemObject == false)
                {
                    Console.WriteLine("-- Scripting for table " + tb.Name);

                    // Generating script for table tb
                    System.Collections.Specialized.StringCollection sc = scrp.Script(new Urn[] { tb.Urn });
                    foreach (string st in sc)
                    {
                        Console.WriteLine(st);
                    }
                    Console.WriteLine("--");
                }
            }
        }
    }
}