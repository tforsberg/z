using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using WijMarket.Models;
using System.Threading;

namespace WijMarket.Controllers
{
    public class StocksController : Controller
    {
        //
        // GET: /Stocks/
        public ActionResult Index()
        {
            string u = Request.ServerVariables["HTTP_USER_AGENT"];
            Regex b = new Regex(@"android|avantgo|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od|ad)|iris|kindle|lge |maemo|midp|mmp|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\\/|plucker|pocket|psp|symbian|treo|up\\.(browser|link)|vodafone|wap|windows (ce|phone)|xda|xiino", RegexOptions.IgnoreCase | RegexOptions.Multiline);
            Regex v = new Regex(@"1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\\-(n|u)|c55\\/|capi|ccwa|cdm\\-|cell|chtm|cldc|cmd\\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\\-s|devi|dica|dmob|do(c|p)o|ds(12|\\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\\-|_)|g1 u|g560|gene|gf\\-5|g\\-mo|go(\\.w|od)|gr(ad|un)|haie|hcit|hd\\-(m|p|t)|hei\\-|hi(pt|ta)|hp( i|ip)|hs\\-c|ht(c(\\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\\-(20|go|ma)|i230|iac( |\\-|\\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\\/)|klon|kpt |kwc\\-|kyo(c|k)|le(no|xi)|lg( g|\\/(k|l|u)|50|54|e\\-|e\\/|\\-[a-w])|libw|lynx|m1\\-w|m3ga|m50\\/|ma(te|ui|xo)|mc(01|21|ca)|m\\-cr|me(di|rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\\-2|po(ck|rt|se)|prox|psio|pt\\-g|qa\\-a|qc(07|12|21|32|60|\\-[2-7]|i\\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\\-|oo|p\\-)|sdk\\/|se(c(\\-|0|1)|47|mc|nd|ri)|sgh\\-|shar|sie(\\-|m)|sk\\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\\-|v\\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\\-|tdg\\-|tel(i|m)|tim\\-|t\\-mo|to(pl|sh)|ts(70|m\\-|m3|m5)|tx\\-9|up(\\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|xda(\\-|2|g)|yas\\-|your|zeto|zte\\-", RegexOptions.IgnoreCase | RegexOptions.Multiline);

			CacheData cacheData = new CacheData();
			cacheData.Cache();
			
			if ((b.IsMatch(u) || v.IsMatch(u.Substring(0, 4))))
            {
                return RedirectToAction("Mobile", "Stocks", null);
            }
            else
            {				
                return View();
            }
        }

        public ActionResult Mobile()
        {

            return View();
        }

		[OutputCache(Duration = 10000, VaryByParam = "*")]
		public JsonResult StockSuggestion(string symbol, int count)
		{
			var stocks = Stocks.GetStockSymbols(symbol, 3, count);

			return Json(stocks, JsonRequestBehavior.AllowGet);
		}

		[OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
        public JsonResult StockSymbols(string symbols)
        {
            var stocks = Stocks.GetStocks(symbols);

            return Json(stocks, JsonRequestBehavior.AllowGet);
        }

		[OutputCache(Location = System.Web.UI.OutputCacheLocation.None)]
		public JsonResult StockSymbol(string symbol)
		{
			var stocks = Stocks.GetStock(symbol);

			return Json(stocks, JsonRequestBehavior.AllowGet);
		}

        [OutputCache(Duration = 10000, VaryByParam = "*")]
        public JsonResult StockSymbolHistoryByDates(string symbol, string startDate, string endDate)
        {
            var stocks = Stocks.GetStockHistory(symbol, DateTime.Parse(startDate), DateTime.Parse(endDate), "d");

            return Json(stocks, JsonRequestBehavior.AllowGet);
        }

        [OutputCache(Duration = 10000, VaryByParam = "*")]
        public JsonResult StockSymbolHistory(string symbol, string dateRange)
        {
            var beginDate = new DateTime();
            var endDate = new DateTime();
            var interval = "d";
            switch (dateRange)
            {
                case "1d":
                    beginDate = DateTime.Now.AddDays(-1);
                    endDate = DateTime.Now;
                    break;
                case "1w":
                    beginDate = DateTime.Now.AddDays(-7);
                    endDate = DateTime.Now;
                    interval = "d";
                    break;
                case "1m":
                    beginDate = DateTime.Now.AddMonths(-1);
                    endDate = DateTime.Now;
                    interval = "d";
                    break;
                case "2m":
                    beginDate = DateTime.Now.AddMonths(-2);
                    endDate = DateTime.Now;
                    interval = "w";
                    break;
                case "3m":
                    beginDate = DateTime.Now.AddMonths(-3);
                    endDate = DateTime.Now;
                    interval = "w";
                    break;
                case "4m":
                    beginDate = DateTime.Now.AddMonths(-4);
                    endDate = DateTime.Now;
                    interval = "w";
                    break;
                case "5m":
                    beginDate = DateTime.Now.AddMonths(-5);
                    endDate = DateTime.Now;
                    interval = "w";
                    break;
                case "6m":
                    endDate = DateTime.Now;
                    beginDate = DateTime.Now.AddMonths(-6);
                    interval = "m";
                    break;
                case "9m":
                    beginDate = DateTime.Now.AddMonths(-9);
                    endDate = DateTime.Now;
                    interval = "m";
                    break;
                case "1y":
                    beginDate = DateTime.Now.AddYears(-1);
                    endDate = DateTime.Now;
                    interval = "m";
                    break;
                case "2y":
                    beginDate = DateTime.Now.AddYears(-2);
                    endDate = DateTime.Now;
                    interval = "m";
                    break;
            }

            var stocks = Stocks.GetStockHistory(symbol, beginDate, endDate, interval);

            return Json(stocks, JsonRequestBehavior.AllowGet);
        }
        //
        // GET: /Stock/Details/5

        public ActionResult Details(int id)
        {
            return View();
        }

        //
        // GET: /Stock/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /Stock/Create

        [HttpPost]
        public ActionResult Create(FormCollection collection)
        {
            try
            {
                // TODO: Add insert logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Stock/Edit/5

        public ActionResult Edit(int id)
        {
            return View();
        }

        //
        // POST: /Stock/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add update logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }

        //
        // GET: /Stock/Delete/5

        public ActionResult Delete(int id)
        {
            return View();
        }

        //
        // POST: /Stock/Delete/5

        [HttpPost]
        public ActionResult Delete(int id, FormCollection collection)
        {
            try
            {
                // TODO: Add delete logic here

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
    }
}
