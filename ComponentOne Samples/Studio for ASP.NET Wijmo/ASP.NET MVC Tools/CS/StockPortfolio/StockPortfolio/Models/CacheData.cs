using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;
using System.IO;
using System.Threading;
using System.Threading.Tasks;

namespace WijMarket.Models
{
	public class CacheData
	{
		public static DateTime Date;
		private bool NeedCache()
		{
			if (CacheData.Date == null)
			{
				return true;
			}
			else {
				DateTime Now = DateTime.Now;
				if (CacheData.Date.Day == Now.Day && CacheData.Date.Month == Now.Month && CacheData.Date.Year == Now.Year)
				{
					return false;
				}
				else {
					return true;
				}
			}
		}

		#region ** public methods
		/// <summary>
		/// cache the stock data.
		/// </summary>
		public void Cache() 
		{
			if (NeedCache())
			{
				Task t = new Task(() =>
				{
					CacheDatas();
				});
				t.Start();
				CacheData.Date = DateTime.Now;
			}
		}
		/// <summary>
		/// get cached stock
		/// </summary>
		/// <param name="symbol"></param>
		/// <returns></returns>
		public StockDetails GetCachedStock(string symbol)
		{
			return GetCacheObj<StockDetails>(GetKey(symbol, "StockSummary"), () => {
				return DeSerialize<StockDetails>(GetPath(symbol, "StockSummary"));
			});
		}

		public List<StockSummary> GetCachedStocks() {
			return GetCacheObj<List<StockSummary>>(GetKey("symbols", "StockSummarys"), () =>
			{
				return DeSerialize<List<StockSummary>>(GetPath("symbols", "StockSummarys"));
			});
			
		}

		public List<StockDetails> GetCachedStockHistory(string symbol, DateTime start, DateTime end) 
		{
			List<StockDetails> stocks = GetCacheObj<List<StockDetails>>(GetKey(symbol, "StockHistory"), () =>
			{
				return DeSerialize<List<StockDetails>>(GetPath(symbol, "StockHistory"));				
			});
			return stocks.Where(p =>
			{
				DateTime date = DateTime.Parse(p.DateString);
				return date <= end && date >= start;
			}).ToList();
		}
	
		#region Cache object
		public T GetCacheObj<T>(string key, Func<T> fun)
		{
			System.Web.Caching.Cache webCache = System.Web.HttpRuntime.Cache;

			if (webCache.Get(key) == null)
			{
				T obj = fun();
				webCache.Insert(key, obj, null, DateTime.MaxValue, TimeSpan.FromMinutes(30));
				return obj;
			}
			else {
				return (T)webCache.Get(key);
			}
		}

		public void UpdateCache(string key, Action action)
		{
			System.Web.HttpRuntime.Cache.Remove(key);
			try
			{
				action();
			}
			catch { }
		}

		#endregion

		#endregion


		private static string[] Symbols = { "MSFT", "GOOG", "YHOO", "AAPL", "INTC", "NVDA", "ORCL", "GE", "AMD" };
		private string BasePath = System.Web.HttpContext.Current.Server.MapPath("~/CacheData");

		private void CacheDatas()
		{
			//cache the each symbols
			foreach (string symbol in Symbols)
			{
				CacheStock(symbol);
			}
			//cache the stocks
			CacheStocks();
			// cache the history
			DateTime end = DateTime.Now;
			DateTime start = DateTime.Now.AddMonths(-4);
			foreach (string symbol in Symbols)
			{
				CacheStockHistory(symbol, start, end);
			}
		}

		private void CacheStock(string symbol) 
		{
			UpdateCache(GetKey(symbol, "StockSummary"), () =>
			{
				StockDetails stock = Stocks.GetStockFromYahoo(symbol) as StockDetails;
				Serialize<StockDetails>(GetPath(symbol, "StockSummary"), stock);
			});
		}
		
		private void CacheStocks() 
		{
			UpdateCache(GetKey("symbols", "StockSummarys"), () =>
			{
				List<StockSummary> stocks = Stocks.GetStocksFromYahoo(string.Join(",", Symbols));
				Serialize<List<StockSummary>>(GetPath("symbols", "StockSummarys"), stocks);
			});
		}

		private void CacheStockHistory(string symbol, DateTime start, DateTime end)
		{
			UpdateCache(GetKey(symbol, "StockHistory"), () =>
			{
				List<StockSummary> stocks = Stocks.GetStockHistoryFromYahoo(symbol, start, end, "d");
				List<StockDetails> stockDetails = new List<StockDetails>();
				foreach (StockSummary s in stocks)
				{
					stockDetails.Add(s as StockDetails);
				}
				Serialize<List<StockDetails>>(GetPath(symbol, "StockHistory"), stockDetails);
			});
		}

		private string GetKey(string symbol, string entityName) 
		{
			return string.Format("{0}_{1}.xml", symbol, entityName);
		}

		private string GetPath(string symbol, string entityName)
		{
			var path = BasePath;
			if (!Directory.Exists(path)) {
				Directory.CreateDirectory(path);
			}
			return Path.Combine(path, GetKey(symbol, entityName));
		}

		private void Serialize<T>(string path, object obj) 
		{
			XmlSerializer xs = new XmlSerializer(typeof(T));
			using (FileStream fs = new FileStream(path, FileMode.Create))
			{
				xs.Serialize(fs, obj);
			}
		}

		private T DeSerialize<T>(string path) 
		{
			XmlSerializer xs = new XmlSerializer(typeof(T));
			using (FileStream fs = new FileStream(path, FileMode.OpenOrCreate)) {
				return (T)xs.Deserialize(fs);
			}
		}
	}
}