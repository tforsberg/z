using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Linq.Dynamic;
using System.Web;
using System.Data;
using System.Xml.Linq;

/// <summary>
/// Summary description for Transactions
/// </summary>
/// 
public class Transactions
{
    public List<Transaction> GetTransactions() {
        return GetTransactions("");
    }
    public List<Transaction> GetTransactions(string sortExpression)
    {
        if (sortExpression == "")
        {
            sortExpression = "Date desc";
        }
        List<Transaction> data = new List<Transaction>(); 
        XElement xEle = XElement.Load(HttpContext.Current.Server.MapPath("~/App_Data/Transactions.xml"));

        IEnumerable<XElement> catalogs = from c in xEle.Elements("Transaction") select c;
        foreach (XElement ele in catalogs)
        {
            Transaction t = new Transaction();
            t.Date = DateTime.Parse(ele.Element("Date").Value);
            t.ID = Int32.Parse(ele.Element("ID").Value);
            t.Location = ele.Element("Location").Value;
            if (ele.Element("Deposits").Value != "")
            {
                t.Deposits = Decimal.Parse(ele.Element("Deposits").Value);
            }

            if (ele.Element("Withdrawals").Value != "")
            {
                t.Withdrawals = Decimal.Parse(ele.Element("Withdrawals").Value);
            }
            data.Add(t);
        }

        var x  = data.AsQueryable().OrderBy(sortExpression).ToList();
        return x;
    }
}

public class Transaction
{
    public int ID
    {
        get;
        set;
    }
    public DateTime Date
    {
        get;
        set;
    }
    public string Location
    {
        get;
        set;
    }
    public decimal Deposits
    {
        get;
        set;
    }
    public decimal Withdrawals
    {
        get;
        set;
    }

}