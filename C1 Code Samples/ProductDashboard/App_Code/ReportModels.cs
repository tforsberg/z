using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public class ProductRevenue
{
    public double Amount { get; set; }
    public string Product { get; set; }
    public int Units { get; set; }
    public string Company { get; set; }
}

public class Customers
{
    public double OldCustomer { get; set; }
    public string OldProduct { get; set; }
    public double NewCustomer { get; set; }
    public string NewProduct { get; set; }
}

public class SalesUnits
{
    public double Amount { get; set; }
    public string Product { get; set; }
    public string Company { get; set; }
    public double Units { get; set; }
    public string Day { get; set; }
}
