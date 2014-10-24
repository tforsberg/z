
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text;
using System.IO;
using System.Xml;
using System.Xml.Linq;
using System.Security.Cryptography;

namespace WijMarket.Models
{
	/// <summary>
	/// Summary description for Stock
	/// </summary>
	public class StockDetails : StockSummary
	{
		

		public float? Open { get; set; }
		public float? Close { get; set; }
		public float? DayHigh { get; set; }
		public float? DayLow { get; set; }
		public float? YearHigh { get; set; }
		public float? YearLow { get; set; }
		public long? Volume { get; set; }
		public float? PE { get; set; }
		public float? Change { get; set; }
		public string ChangePercent { get; set; }
		//public DateTime Date { get; set; }
		public string DateString { get; set; }

		public float? OneyrTargetPrice { get; set; }

        public long? AverageDailyVolume { get; set; }

		public string MarketCapitalization { get; set; }

		public float? EarningsShare { get; set; }

		public string DividendYield { get; set; }

	}

	public class StockSummary : Stock
	{
		public float? Ask { get; set; }
		public float? Bid { get; set; }
		public float? LastSale { get; set; }
		public bool Valid { get; set; }
	}

	public class Stock
	{
		public string Symbol { get; set; }
		public string Name { get; set; }
	}

	public class Stocks
	{

		private const string URL = "http://query.yahooapis.com";
		private const string KEY = "dj0yJmk9bEhjRzFCRFJZZ1ozJmQ9WVdrOVRUQkJUa1IzTjJrbWNHbzlNVE13TXpNNE1UVTJNZy0tJnM9Y29uc3VtZXJzZWNyZXQmeD1kYg--";
		private const string SECRET = "07312e38df04cf254fafa9712cc94e8a3f2755d7";

		/// <summary>
		/// Get stock summary by symbol name from yahoo API.
		/// </summary>
		/// <param name="symbol">symbol name</param>
		/// <returns></returns>
		public static StockSummary GetStockFromYahoo(string symbol)
		{
			StockDetails stock = new StockDetails();
			string query = "q=select%20*%20from%20yahoo.finance.quotes%20where%20symbol%20in%20(%22{0}%22)&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
			string url = GetFullUrl(string.Format(query, symbol));

			XDocument doc = GetYQLXDoc(url);

			XElement results = doc.Root.Element("results");


			XElement node = results.Elements("quote").Where(p => p.Attribute("symbol").Value == symbol).First();

			// If contents[2] = "N/A". the stock symbol is invalid.
			if (node == null)
			{
				stock.Valid = false;
			}
			else
			{

				if (node.Element("Open") != null)
				{
					stock.Open = ParseFloat(node.Element("Open").Value);
				}

				if (node.Element("PreviousClose") != null)
				{
					stock.Close = ParseFloat(node.Element("PreviousClose").Value);
				}

				if (node.Element("DaysHigh") != null)
				{
					stock.DayHigh = ParseFloat(node.Element("DaysHigh").Value);
				}

				if (node.Element("DaysLow") != null)
				{
					stock.DayLow = ParseFloat(node.Element("DaysLow").Value);
				}

				if (node.Element("YearHigh") != null)
				{
					stock.YearHigh = ParseFloat(node.Element("YearHigh").Value);
				}

				if (node.Element("YearLow") != null)
				{
					stock.YearLow = ParseFloat(node.Element("YearLow").Value);
				}

				if (node.Element("Volume") != null && node.Element("Volume").Value != "")
				{
					stock.Volume = long.Parse(node.Element("Volume").Value);
				}

				if (node.Element("PERatio").Value != null)
				{
					stock.PE = ParseFloat(node.Element("PERatio").Value);
				}

				if (node.Element("Symbol").Value != null)
				{
					stock.Symbol = node.Element("Symbol").Value;
				}

				if (node.Element("Name") != null)
				{
					stock.Name = node.Element("Name").Value;
				}

				if (node.Element("Change") != null)
				{
					stock.Change = ParseFloat(node.Element("Change").Value);
				}

				if (node.Element("ChangeinPercent") != null)
				{
					stock.ChangePercent = node.Element("ChangeinPercent").Value;
				}

				if (node.Element("Ask") != null)//show N/A when null
				{
					stock.Ask = ParseFloat(node.Element("Ask").Value);
				}

				if (node.Element("Bid") != null)
				{
					stock.Bid = ParseFloat(node.Element("Bid").Value);
				}
				//LastSale //LastTradePriceOnly //EarningsShare //

				if (node.Element("DividendYield") != null)
				{
					stock.DividendYield = node.Element("DividendYield").Value;
				}

				if (node.Element("EarningsShare") != null)
				{
					stock.EarningsShare = ParseFloat(node.Element("EarningsShare").Value);
				}

				if (node.Element("LastTradePriceOnly") != null)
				{
					stock.LastSale = ParseFloat(node.Element("LastTradePriceOnly").Value);
				}

				if (node.Element("OneyrTargetPrice") != null)
				{
					stock.OneyrTargetPrice = ParseFloat(node.Element("OneyrTargetPrice").Value);
				}

				if (node.Element("AverageDailyVolume") != null)
				{
					stock.AverageDailyVolume = long.Parse(node.Element("AverageDailyVolume").Value);
				}
				if (node.Element("MarketCapitalization") != null)
				{
					stock.MarketCapitalization = node.Element("MarketCapitalization").Value;
				}

				stock.DateString = DateTime.Now.Date.ToString();

			}

			return stock;
		}

		/// <summary>
		/// Get stock list by a list of symbol from yahoo API
		/// </summary>
		/// <param name="Symbols">symbol list (separator ',')</param>
		/// <returns></returns>
		public static List<StockSummary> GetStocksFromYahoo(string Symbols)
		{

			List<StockSummary> lst = new List<StockSummary>();
			string[] symbols = Symbols.Replace(",", " ").Split(' ');
			string query = "q=select%20symbol%2CSymbol%2CName%2CAsk%2CBid%2CChange%2CLastTradePriceOnly%20from%20yahoo.finance.quotes%20where%20symbol%20in%20({0})&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
			string symbolList = String.Join("%2C", symbols.Select(w => "%22" + w + "%22").ToArray());
			string url = GetFullUrl(string.Format(query, symbolList));

			XDocument doc = GetYQLXDoc(url);

			XElement results = doc.Root.Element("results");
			var stockList = results.Elements("quote");
			stockList.First();
			//string content = "";
			for (int i = 0; i < symbols.Length; i++)
			{
				XElement node;
				// Loop through each line from the stream, building the return XML Document string
				if (symbols[i].Trim() == "" || symbols[i] == null)
					continue;
				var symbol = stockList.Where(p => p.Attribute("symbol").Value == symbols[i]);
				if (symbol.Count() != 0)
				{
					node = symbol.First();
				}
				else
				{
					continue;
				}

				// If contents[2] = "N/A". the stock symbol is invalid.
				if (node == null)
				{
					StockSummary stock = new StockSummary();
					stock.Valid = false;
				}
				else
				{
					StockSummary stock = new StockSummary();

					if (node.Element("Symbol").Value != null)
					{
						stock.Symbol = node.Element("Symbol").Value;
					}

					if (node.Element("Name") != null)
					{
						stock.Name = node.Element("Name").Value;
					}

					if (node.Element("Ask") != null)//show N/A when null
					{
						//Random d = new Random();
						//float q = (float)d.Next(-100, 100) / 100F;
						//stock.Ask = ParseFloat(node.Element("Ask").Value) + q
						stock.Ask = ParseFloat(node.Element("Ask").Value);
					}

					if (node.Element("Bid") != null)
					{
						stock.Bid = ParseFloat(node.Element("Bid").Value);
					}

					if (node.Element("LastTradePriceOnly") != null)
					{
						stock.LastSale = ParseFloat(node.Element("LastTradePriceOnly").Value);
					}

					lst.Add(stock);
				}
			}

			return lst;
		}

		/// <summary>
		/// Get stock history by symbol name and the date range from yahoo API. 
		/// </summary>
		/// <param name="Symbol"></param>
		/// <param name="startDate"></param>
		/// <param name="endDate"></param>
		/// <param name="interval"></param>
		/// <returns></returns>
		public static List<StockSummary> GetStockHistoryFromYahoo(string Symbol, DateTime startDate, DateTime endDate, string interval)
		{
			if (interval == "")
			{
				interval = "d";
			}

			List<StockSummary> lst = new List<StockSummary>();
			string query = "q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol=%22{0}%22%20and%20startDate=%22{1}%22%20and%20endDate=%22{2}%22&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys";
			string url = GetFullUrl(string.Format(query, Symbol, startDate.ToString("yyyy-MM-dd"), endDate.ToString("yyyy-MM-dd")));

			XDocument doc = GetYQLXDoc(url);

			XElement results = doc.Root.Element("results");
			foreach (XElement ele in results.Elements("quote"))
			{
				StockDetails stock = new StockDetails();
				if (ele.Element("Open") != null && ele.Element("Open").Value != "")
				{
					stock.Open = float.Parse(ele.Element("Open").Value);
				}
				if (ele.Element("Close") != null && ele.Element("Close").Value != "")
				{
					stock.Close = float.Parse(ele.Element("Close").Value);
				}
				if (ele.Element("High") != null && ele.Element("High").Value != "")
				{
					stock.DayHigh = float.Parse(ele.Element("High").Value);
				}
				if (ele.Element("Low") != null && ele.Element("Low").Value != "")
				{
					stock.DayLow = float.Parse(ele.Element("Low").Value);
				}
				if (ele.Element("Volume") != null && ele.Element("Volume").Value != "")
				{
					stock.Volume = long.Parse(ele.Element("Volume").Value);
				}
				stock.Valid = true;
				stock.Symbol = Symbol;
                //stock.DateString = DateTime.Parse(ele.Element("Date").Value).ToString("MM/dd/yyyy", System.Globalization.DateTimeFormatInfo.InvariantInfo);
				// DateTime.ToString("MM/dd/yyyy") return MM-dd-yyyy (09-07-2011) in Chinese region.
				if (ele.Element("Date") != null && ele.Element("Date").Value != "")
				{
					stock.DateString = DateTime.Parse(ele.Element("Date").Value).ToString(@"MM'/'dd'/'yyyy");
				}
				lst.Add(stock);
			}

			return lst;
		}
		
		/// <summary>
		/// Get stock summary by symbol name.
		/// </summary>
		/// <param name="symbol">symbol name</param>
		/// <returns></returns>
		public static StockSummary GetStock(string symbol)
		{
			StockSummary stock = null ;
			try
			{
				stock = GetStockFromYahoo(symbol);
			}
			catch
			{
				try
				{
					CacheData cacheData = new CacheData();
					stock = cacheData.GetCachedStock(symbol);
				}
				catch { }
			}
			return stock;
		}
		/// <summary>
		/// Get stock list by a list of symbol 
		/// </summary>
		/// <param name="Symbols">symbol list (separator ',')</param>
		/// <returns></returns>
		public static List<StockSummary> GetStocks(string Symbols) {
			List<StockSummary> stocks = null;
			try {
				stocks = GetStocksFromYahoo(Symbols);
			}
			catch {
				CacheData cacheData = new CacheData();
				stocks = cacheData.GetCachedStocks();
			}
			return stocks;
		}
		/// <summary>
		/// Get stock history by symbol name and the date range. 
		/// </summary>
		/// <param name="Symbol"></param>
		/// <param name="startDate"></param>
		/// <param name="endDate"></param>
		/// <param name="interval"></param>
		/// <returns></returns>
		public static List<StockSummary> GetStockHistory(string Symbol, DateTime startDate, DateTime endDate, string interval) {
			List<StockSummary> lst = new List<StockSummary>();
			try
			{
				lst = GetStockHistoryFromYahoo(Symbol, startDate, endDate, interval);
			}
			catch {
				try {
					CacheData cacheData = new CacheData();
					List<StockDetails> details = cacheData.GetCachedStockHistory(Symbol, startDate, endDate);
					foreach (StockDetails s in details) 
					{
						lst.Add(s);
					}
				}
				catch { }
			}
			return lst;
		}

		/// <summary>
		/// Get stocks by words start with the name and exchange Id.
		/// </summary>
		/// <param name="name">The words start with name</param>
		/// <param name="exchangeId">exchange Id
		/// possible value: 
		///		1.ASX
		///		2.NYSE
		///		3.NASDAQ
		///		4.AMSE
		/// </param>
		/// <param name="count">set the count of the items</param>
		/// <returns></returns>
		public static IList<Stock> GetStockSymbols(string name, int exchangeId, int count)
		{
			using (WijMarket.Models.EntityClass.StockContext context = new EntityClass.StockContext())
			{
				var caseInfo = from info in context.StockEntitys
							   where (info.StockCode.StartsWith(name) || info.StockName.Contains(name)) 
							   && info.ExchangeId == exchangeId
							   orderby info.StockCode
							   select new Stock
							   {
								   Name = info.StockName,
								   Symbol = info.StockCode
							   };
				return caseInfo.Take(count).ToList<Stock>();
			}
		}

		private static XDocument GetYQLXDoc(string url)
		{
			XDocument doc = XDocument.Load(url);
			return doc;
		}

		private static float? ParseFloat(string from)
		{
			float to;
			if (float.TryParse(from, out to))
			{
				return to;
			}
			return null;
		}

		private static string GetFullUrl(string query)
		{
			return OAuth.GetFullUrlPath(URL, query, KEY, SECRET);
		}
	}
}