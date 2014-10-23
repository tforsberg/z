using System;
using System.IO;
using System.IO.Compression;
using System.Collections.Generic;
using System.Runtime.Serialization.Json;
using System.Linq;
using System.Web;
using System.Text;

namespace XGrid
{
    /// <summary>
    /// Summary description for CompanyCatalog
    /// </summary>
    public class CompanyCatalog : IHttpHandler
    {
        static List<Company> _catalog = null;
        public void ProcessRequest(HttpContext context)
        {
            // get parameters
            var p = context.Request.Params;
            var query = p["query"];
            if (query == null)
            {
                throw new Exception("query parameter not provided.");
            };
            var max = 10;
            int.TryParse(p["max"], out max);

            // search for the data
            var list = new List<Company>();
            var catalog = GetData(context);
            var terms = query.Split(' ');
            for (var i = 0; i < catalog.Count && list.Count < max; i++)
            {
                // check if the ith item contains all the search terms
                var match = true;
                for (var j = 0; j < terms.Length && match; j++)
                {
                    if (catalog[i].Name.IndexOf(terms[j], StringComparison.OrdinalIgnoreCase) < 0 &&
                        catalog[i].Symbol.IndexOf(terms[j], StringComparison.OrdinalIgnoreCase) < 0)
                    {
                        match = false;
                    }
                }

                // add to list if it does
                if (match)
                {
                    list.Add(catalog[i]);
                }
            }

            // return the result
            context.Response.ContentType = "application/json";
            context.Response.Write(Serialize(list));
        }
        static string Serialize(object obj)
        {
            var ser = new DataContractJsonSerializer(obj.GetType());
            using (var ms = new MemoryStream())
            {
                ser.WriteObject(ms, obj);
                return Encoding.UTF8.GetString(ms.ToArray());
            }
        }  

        // gets a list of Company objects
        // the list is based on a text file to avoid dependencies on any databases
        static List<Company> GetData(HttpContext context) 
        {
            if (_catalog == null)
            {
                lock (typeof(CompanyCatalog))
                {
                    // create catalog
                    _catalog = new List<Company>();

                    // get company data from zip file
                    var file = Path.Combine(context.Request.PhysicalApplicationPath, @"data\companylist.zip");
                    using (var z = ZipFile.OpenRead(file))
                    {
                        foreach (var entry in z.Entries)
                        {
                            if (entry.FullName.EndsWith(".txt", StringComparison.OrdinalIgnoreCase))
                            {
                                using (var sr = new StreamReader(entry.Open()))
                                {
                                    var line = sr.ReadLine(); // skip titles
                                    for (line = sr.ReadLine(); line != null; line = sr.ReadLine())
                                    {
                                        var parts = line.Split('\t');
                                        var c = new Company();
                                        c.Symbol = parts[0].Trim();
                                        c.Name = parts[1].Trim();
                                        c.Sector = parts[2].Trim();
                                        c.Industry = parts[3].Trim();
                                        c.Site = parts[4].Trim();
                                        _catalog.Add(c);
                                    }
                                }
                            }
                        }
                    }
                }
            }

            // done, return company catalog
            return _catalog;
        }

        public bool IsReusable
        {
            get { return true; }
        }
    }

    public class Company
    {
        public string Symbol { get; set; }
        public string Name { get; set; }
        public string Sector { get; set; }
        public string Industry { get; set; }
        public string Site { get; set; }
    }
}