using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Net;
using System.Text;
using System.Web;

namespace StockInfo // << NOTE: this must match the full class name in the ashx file!
{
    /// <summary>
    /// StockInfo returns the following information:
    /// 
    /// Company Names:
    /// If the request contains a 'name' parameter, StockInfo returns the name 
    /// of the company for the symbol that was passed in.
    /// 
    /// Stock Prices:
    /// If the request contains a 'prices' parameter, StockInfo returns
    /// a tab/cr-delimited string with dates and stock prices in each line.
    /// 
    /// Company Search:
    /// If the request contains a 'search' parameter, StockInfo returns
    /// a tab/cr-delimited string with company symbols and names that match
    /// the given request parameter.
    /// </summary>
    public class StockInfo : IHttpHandler
    {
        static Dictionary<string, string> _names = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);
        static Dictionary<string, string> _prices = new Dictionary<string, string>(StringComparer.OrdinalIgnoreCase);

        // constructor
        static StockInfo()
        {
            // load company names (once)
            if (_names.Count == 0)
            {
                var path = HttpContext.Current.Server.MapPath("resources/symbolNames.txt");
                using (var sr = new StreamReader(path))
                {
                    for (var line = sr.ReadLine(); line != null; line = sr.ReadLine())
                    {
                        var parts = line.Split('\t');
                        if (parts.Length >= 2)
                        {
                            var key = parts[0].Trim();
                            var value = parts[1].Trim();
                            if (key.Length > 0 && value.Length > 0)
                            {
                                _names[key] = value;
                            }
                        }
                    }
                }
            }
        }

        // process the requests
        public void ProcessRequest(HttpContext context)
        {
            var content = string.Empty;
            try
            {
                // get company name
                var symbol = context.Request["name"];
                if (!string.IsNullOrEmpty(symbol))
                {
                    content = GetCompanyName(symbol);
                }

                // get company prices
                symbol = context.Request["prices"];
                if (!string.IsNullOrEmpty(symbol))
                {
                    content = GetPrices(symbol);
                }

                // search for companies
                var query = context.Request["search"];
                if (!string.IsNullOrEmpty(query))
                {
                    int max = 10;
                    int.TryParse(context.Request["max"], out max);
                    content = SearchCompanies(query, max);
                }
            }
            catch { }

            // done, return the result
            context.Response.Write(content);
        }

        // this handler can be re-used
        public bool IsReusable
        {
            get { return true; }
        }

        // ** implementation

        // get the name of a company from a stock ticker symbol
        string GetCompanyName(string symbol)
        {
            // look up company name
            string name = string.Empty;
            _names.TryGetValue(symbol, out name);
            return name;
        }

        // get closing prices for a given stock between 1/1/2008 and today
        // (using Yahoo finance service)
        string GetPrices(string symbol)
        {
            // try getting from cache
            string content;
            if (_prices.TryGetValue(symbol, out content))
            {
                return content;
            }

            // not in cache, get now
            var fmt = "http://ichart.finance.yahoo.com/table.csv?s={0}&a={1}&b={2}&c={3}&d={4}&e={5}&f={6}&g=d";
            // s: 0: stock symbol
            // a,b,c: 1,2,3: start month, day, year
            // d,e,f: 4,5,6: end month, day, year
            var t = DateTime.Today;
            var url = string.Format(fmt, symbol, 1, 1, 2008, t.Month, t.Day, t.Year);

            // get content
            var sb = new StringBuilder();
            var wc = new WebClient();
            using (var sr = new StreamReader(wc.OpenRead(url)))
            {
                // skip headers
                sr.ReadLine();

                // skip first line (same date as the next!)
                sr.ReadLine();

                // read each line
                for (var line = sr.ReadLine(); line != null; line = sr.ReadLine())
                {
                    // append date (field 0) and adjusted close price (field 6)
                    var items = line.Split(',');

                    double value;
                    var parseResult = double.TryParse(items[6], out value);

                    // quick fix
                    // culture dependent decimal part separator
                    if (!parseResult)
                        value = double.Parse(items[6].Replace('.', ',')); 

                    sb.AppendFormat("{0}\t{1:#.##}\r", items[0], value);
                }
            }

            // save result in cache
            content = sb.ToString().Trim();
            _prices[symbol] = content;

            // done
            Debug.WriteLine("returning {0} bytes", content.Length);
            return content;
        }

        // search for companies based on a query string composed of space-separated terms
        string SearchCompanies(string query, int max)
        {
            var sb = new StringBuilder();
            var matches = 0;
            var terms = query.Split(' ');
            foreach (var kv in _names)
            {
                var match = true;
                for (var i = 0; i < terms.Length && match; i++)
                {
                    if (kv.Key.IndexOf(terms[i], StringComparison.OrdinalIgnoreCase) < 0 &&
                        kv.Value.IndexOf(terms[i], StringComparison.OrdinalIgnoreCase) < 0)
                    {
                        match = false;
                    }
                }
                if (match)
                {
                    sb.AppendFormat("{0}\t{1}\r", kv.Key, kv.Value);
                    matches++;
                    if (matches >= max)
                    {
                        break;
                    }
                }
            }

            // done
            //Debug.WriteLine("queried for \"" + query + "\", got " + matches.ToString() + " matches.");
            return sb.ToString().TrimEnd('\r');
        }
    }
}