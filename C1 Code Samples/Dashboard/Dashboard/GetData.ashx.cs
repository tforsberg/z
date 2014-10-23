using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace Dashboard
{
    /// <summary>
    /// Summary description for GetData
    /// </summary>
    public class GetData : IHttpHandler
    {
        static string _result = null;
        static DateTime _lastUpdate = DateTime.MinValue;

        const int START_YEAR = 2008;

        public void ProcessRequest(HttpContext context)
        {
            // re-use data if possible (less than six hours old)
            var now = DateTime.Now;
            if (_result != null && now.Subtract(_lastUpdate).TotalHours < 6)
            {
                context.Response.ContentType = "application/json";
                context.Response.Write(_result);
                return;
            }

            // to pro-rate data
            var thisQuarter = GetQuarter(DateTime.Today);
            var prevQuarter = GetQuarter(DateTime.Today.AddMonths(-3));

            // tabulate data
            var dctProduct = new Dictionary<string, ProductSalesInfo>();
            var sales = generateSalesData(new DateTime(START_YEAR, 1, 1), DateTime.Today);
            foreach (var s in sales)
            {
                // get product name and sales period (quarter)
                var p = s.ProductName;
                var q = GetQuarter(s.DateShipped);

                // tabulate (with pro-rating)
                if (!string.IsNullOrEmpty(p))
                {
                    Tabulate(dctProduct, p, q, thisQuarter, s.TotalQuantity);
                    Tabulate(dctProduct, "(All Products)", q, thisQuarter, s.TotalQuantity);
                }
            }

            // move to sorted list
            var qInfo =
                from psi in dctProduct.Values
                orderby psi.TotalSales descending
                select psi;
            var list = qInfo.ToList();

            // show what we've got
            var sb = new StringBuilder();
            sb.AppendLine("{");
            sb.AppendFormat("\t\"_comment\" : \"Sales Data Since {0}\",\r\n", START_YEAR);
            sb.AppendFormat("\t\"startYear\" : {0},\r\n", START_YEAR);
            sb.AppendFormat("\t\"products\" : [\r\n");
            var pcnt = 0;
            foreach (var psi in list)
            {
                sb.AppendFormat("\t{0}{{\r\n", pcnt > 0 ? ",\r\n\t" : string.Empty);
                sb.AppendFormat("\t\t\"id\" : {0},\r\n", pcnt);
                sb.AppendFormat("\t\t\"name\" : \"{0}\",\r\n", psi.ProductName);
                sb.AppendFormat("\t\t\"rank\" : {0},\r\n", pcnt + 1);
                sb.AppendFormat("\t\t\"sales\" : {{ ");
                var scnt = 0;
                foreach (var kv in psi.Sales)
                {
                    sb.AppendFormat("{0}\"{1}\" : {2}",
                        scnt > 0 ? ", " : string.Empty,
                        kv.Key,
                        kv.Value);
                    scnt++;
                }
                sb.AppendFormat(" }}\r\n");
                sb.AppendFormat("\t}}\r\n");
                pcnt++;
            }
            sb.AppendFormat("\t]\r\n");
            sb.AppendFormat("}}");

            // cache for next request
            _result = sb.ToString();
            _lastUpdate = now;

            // write output
            context.Response.ContentType = "application/json";
            context.Response.Write(_result);
        }
        void Tabulate(Dictionary<string, ProductSalesInfo> dct, string product, string quarter, string thisQuarter, double qty)
        {
            // get information for this product
            ProductSalesInfo psi = null;
            if (!dct.TryGetValue(product, out psi))
            {
                psi = new ProductSalesInfo(product);
                dct[product] = psi;
            }

            // pro-rate current quarter
            double prorate = 1;
            if (quarter == thisQuarter)
            {
                var monthInQuarter = (DateTime.Today.Month - 1) % 3;
                var dayInQuarter = monthInQuarter * 30 + DateTime.Today.Day;
                prorate = 91.0 / dayInQuarter;
            }

            // update quantity for this product/period
            psi.UpdateQuantity(quarter, (int)(qty * prorate + .5));
        }
        string GetQuarter(DateTime dt)
        {
            return string.Format("{0:0000}-Q{1}", dt.Year, ((dt.Month - 1) / 3) + 1);
        }
        public bool IsReusable
        {
            get { return false; }
        }

        List<SalesData> generateSalesData(DateTime start, DateTime end)
        {
            // bogus product names 
            var names = "Commodo LX,Ipsum TX,Tempor SJ,Aliqua FT,Veniam AJ,Nostrud XJ,Laboris S4,Aliquip T5," +
                        "Consequat SS,Pariatur GT,Volupta AR,Velitesse AA,Cillum C1,Fugiat WJ,Nullax RS";
            var products = names.Split(',');

            // random sales data
            var rnd = new Random(0);
            var list = new List<SalesData>();
            for (int i = 0; i < products.Length; i++)
            {
                var avg = (double)rnd.Next(1, 10);
                var stdev = avg / rnd.Next(1, 4);
                var trend = i > 3 ? 1 + rnd.NextDouble() / 5000 : 0;
                for (var dt = start; dt <= end; dt = dt.AddDays(1))
                {
                    var sd = new SalesData();
                    sd.DateShipped = dt;
                    sd.ProductName = products[i];
                    sd.TotalQuantity = GetNormal(rnd, avg, stdev);
                    list.Add(sd);
                    avg *= trend;
                }
            }
            return list;
        }
        static double GetNormal(Random rnd, double avg, double stdev)
        {
            for (; ; )
            {
                var v1 = 2 * rnd.NextDouble() - 1;
                var v2 = 2 * rnd.NextDouble() - 1;
                var w = v1 * v1 + v2 * v2;
                if (w > 1) continue;
                var stdNorm = v1 * Math.Sqrt(-2 * Math.Log(w) / w);
                return Math.Max(0, avg + stdev * stdNorm);
            }
        }
    }

    public class SalesData
    {
        public string ProductName { get; set; }
        public DateTime DateShipped { get; set; }
        public double TotalQuantity { get; set; }
    }
    public class ProductSalesInfo
    {
        public string ProductName { get; set; }
        public SortedDictionary<string, double> Sales { get; set; }

        public ProductSalesInfo(string productName)
        {
            ProductName = productName;
            Sales = new SortedDictionary<string, double>();
        }
        public void UpdateQuantity(string period, double quantity)
        {
            double qty = 0;
            Sales.TryGetValue(period, out qty);
            Sales[period] = qty + quantity;
        }
        public double TotalSales
        {
            get { return Sales.Values.Sum(); }
        }
        public double AverageSales
        {
            get { return Sales.Values.Average(); }
        }
        public double GetSales(string period)
        {
            double sales = 0;
            Sales.TryGetValue(period, out sales);
            return sales;
        }
    }
}