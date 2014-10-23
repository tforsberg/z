
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Text;
using System.IO;
using System.Globalization;

/// <summary>
/// Summary description for Stock
/// </summary>
public class Stock
{
    public Stock()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public float Open { get; set; }
    public float Close { get; set; }
    public float High { get; set; }
    public float Low { get; set; }
    public float Volume { get; set; }
    public float PE { get; set; }
    public bool Valid { get; set; }
    public string Symbol { get; set; }
    public string Name { get; set; }
    public DateTime Date { get; set; }
}
public class Stocks
{
    public static List<Stock> GetStocks(string Symbols)
    {
        List<Stock> lst = new List<Stock>();
        string yahooURL = @"http://download.finance.yahoo.com/d/quotes.csv?s=" + Symbols + "&f=ophgvre1sn";
        string[] symbols = Symbols.Replace(",", " ").Split(' ');

        // Initialize a new WebRequest.
        HttpWebRequest webreq = (HttpWebRequest)WebRequest.Create(yahooURL);
        // Get the response from the Internet resource.
        HttpWebResponse webresp = (HttpWebResponse)webreq.GetResponse();
        // Read the body of the response from the server.
        StreamReader strm = new StreamReader(webresp.GetResponseStream(), Encoding.ASCII);


        string content = "";
        for (int i = 0; i < symbols.Length; i++)
        {
            // Loop through each line from the stream, building the return XML Document string
            if (symbols[i].Trim() == "")
                continue;

            content = strm.ReadLine().Replace("\"", "");
            string[] contents = content.ToString().Split(',');
            // If contents[2] = "N/A". the stock symbol is invalid.
            if (contents[7] == "N/A")
            {
                Stock stock = new Stock();
                stock.Valid = false;
            }
            else
            {

                Stock stock = new Stock();
                if (contents[0] != "N/A")
                {
                    stock.Open = float.Parse(contents[0], CultureInfo.InvariantCulture);
                }
                if (contents[1] != "N/A")
                {
                    stock.Close = float.Parse(contents[1], CultureInfo.InvariantCulture);
                }
                if (contents[2] != "N/A")
                {
                    stock.High = float.Parse(contents[2], CultureInfo.InvariantCulture);
                }
                if (contents[3] != "N/A")
                {
                    stock.Low = float.Parse(contents[3], CultureInfo.InvariantCulture);
                }
                if (contents[4] != "N/A")
                {
                    stock.Volume = float.Parse(contents[4], CultureInfo.InvariantCulture);
                }
                if (contents[5] != "N/A")
                {
                    stock.PE = float.Parse(contents[5], CultureInfo.InvariantCulture);
                }
                stock.Valid = true;
                if (contents[7] != "N/A")
                {
                    stock.Symbol = contents[7];
                }
                if (contents[8] != "N/A")
                {
                    stock.Name = contents[8];
                }
                stock.Date = DateTime.Now.Date;
                lst.Add(stock);
            }
        }

        strm.Close();
        return lst;
    }
    public static List<Stock> GetStockHistory(string Symbol, DateTime startDate, DateTime endDate)
    {
        List<Stock> lst = new List<Stock>();
        string yahooURL = string.Format("{0}?s={1}&a={2}&b={3}&c={4}&d={5}&e={6}&f={7}&g=d&ignore=.csv",
                    "http://ichart.finance.yahoo.com/table.csv", Symbol,
                    (startDate.Month - 1).ToString(), startDate.Day.ToString(), startDate.Year.ToString(), (endDate.Month - 1).ToString(), endDate.Day.ToString(), endDate.Year.ToString());

        string _sData = string.Empty;

        using (System.Net.WebClient _wc = new System.Net.WebClient())
        {
            _sData = _wc.DownloadString(yahooURL);
        }
        _sData = _sData.Replace("\r", ""); // trim off unused characters from end of line
        string[] _Rows = _sData.Split('\n'); // split to array on end of line
        string[] _Columns = _Rows[0].Split(','); // split to colums

        string[] _rowValues;
        for (int _iRow = _Rows.Length - 1; _iRow > 0; _iRow--) // split the rows
        {
            if (!string.IsNullOrEmpty(_Rows[_iRow]))
            {
                _rowValues = _Rows[_iRow].Split(',');
                Stock stock = new Stock();
                stock.Open = float.Parse(_rowValues[1], CultureInfo.InvariantCulture);
                stock.Close = float.Parse(_rowValues[4], CultureInfo.InvariantCulture);
                stock.High = float.Parse(_rowValues[2], CultureInfo.InvariantCulture);
                stock.Low = float.Parse(_rowValues[3], CultureInfo.InvariantCulture);
                stock.Volume = float.Parse(_rowValues[5], CultureInfo.InvariantCulture);
                stock.Valid = true;
                stock.Symbol = Symbol;
                stock.Date = DateTime.Parse(_rowValues[0], CultureInfo.InvariantCulture);
                lst.Add(stock);
            }

        }

        return lst;
    }
}