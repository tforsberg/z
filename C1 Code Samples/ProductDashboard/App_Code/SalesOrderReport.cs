using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary data for SalesOrderReport
/// </summary>
public static class SalesOrderReport
{
    #region privateData
    static List<Order> orders = new List<Order>();
    static List<SalesStatus> sales = new List<SalesStatus>();

    static int selectedMonth;
    static string selectedProduct;
    static ModelData model;
    #endregion

    static SalesOrderReport()
    {
        model = new ModelData();
        orders = model.GetOrders();
        sales = model.GetSalesStatus(orders);

    }

    public static List<SalesUnits> ProductsRevenue
    {
        get
        {
            var prod = from order in orders
                       where order.Date.Month == SelectedMonth && order.Product == SelectedProduct
                       group order by order.Date.Day into grpOrder
                       select new SalesUnits
                       {
                          Day=  grpOrder.First().Date.Day.ToString(),
                          Amount = Math.Round(grpOrder.Sum(x => x.Amount * x.Units) / 100),
                          Units=grpOrder.Sum(x=>x.Units),
                          Company=grpOrder.First().Company,
                          Product=grpOrder.First().Product
                       };
                      
            return prod.ToList();
        }

    }

    public static List<ProductRevenue> CategoryRevenue
    {
        get
        {
            var categoryrev = from order in orders
                         where order.Date.Month == SelectedMonth
                         group order by order.Company into grpOrder
                         select new ProductRevenue()
                         {
                             Company=grpOrder.First().Company,
                             Amount=grpOrder.Sum(x=>x.Amount*x.Units),
                             Units=grpOrder.Sum(x=>x.Units),
                             Product=grpOrder.First().Product
                         };

            return categoryrev.ToList();
        }
    }

    public static IEnumerable NewCustomerAdded
    {
        get
        {
            var cust = (from order in orders
                        where order.NewCustomer && order.Date.Month == SelectedMonth
                        orderby order.Date
                        group order by order.Product into grpOrders
                        select new KeyValuePair<string, Double>(grpOrders.First().Product, grpOrders.Count())).ToList();

            return cust;
        }
    }

    public static IEnumerable ExistingCustomers
    {
        get
        {
            var cust = (from order in orders
                        where !order.NewCustomer && order.Date.Month == SelectedMonth
                        orderby order.Date
                        group order by order.Product into grpOrders
                        select new KeyValuePair<string, Double>(grpOrders.First().Product, grpOrders.Count())).ToList();

            return cust;
        }
    }

    public static IEnumerable CustomerRatio
    {
        get
        {
            List<Customers> custratio = new List<Customers>();
            foreach (KeyValuePair<string, Double> cust in NewCustomerAdded)
            {
                foreach (KeyValuePair<string, Double> oldcust in ExistingCustomers)
                {
                    if (oldcust.Key == cust.Key)
                    {
                        Customers c = new Customers();
                        c.NewProduct = cust.Key;
                        c.NewCustomer = cust.Value;
                        c.OldProduct = oldcust.Key;
                        c.OldCustomer = oldcust.Value;
                        custratio.Add(c);
                        break;
                    }
                }

            }

            return custratio;
        }
    }

    public static double SelectedProductSales
    {
        get
        {
            var prodsale = (from order in orders
                            where order.Product == SelectedProduct && order.Date.Month == SelectedMonth
                            select order.Amount*order.Units).Sum();

            return prodsale;
        }
    }

    public static IEnumerable OrderSatusRatio
    {
        get
        {
            var ordratio = (from sale in sales
                            where sale.Product == SelectedProduct
                            where sale.Date.Month == SelectedMonth
                            group sale by sale.Date.Month into grpSales
                            select new
                            {
                                CompletedOrders = grpSales.Sum(x => x.Completed),
                                InvalidOrders = grpSales.Sum(x => x.InvalidOrders),
                                InOrder = grpSales.Sum(x => x.InOrder),
                                TotalReturns = grpSales.Sum(x => x.Returns)

                            }).First();

            List<KeyValuePair<string, double>> orderratio = new List<KeyValuePair<string, double>>();
            orderratio.Add(new KeyValuePair<string, double>("Completed Orders", ordratio.CompletedOrders));
            orderratio.Add(new KeyValuePair<string, double>("Invalid Orders", ordratio.InvalidOrders));
            orderratio.Add(new KeyValuePair<string, double>("InOrder", ordratio.InOrder));
            orderratio.Add(new KeyValuePair<string, double>("Total Returns", ordratio.TotalReturns));

            return orderratio;
        }
    }

    public static IEnumerable SalesRatio
    {
        get
        {
            double totalsale = TotalSales;
            var saleratio = (from order in orders
                             where order.Date.Month == SelectedMonth
                             group order by order.Product into grpOrder
                             select new
                             {
                                 Product = grpOrder.First().Product,
                                 SalesRatio = (grpOrder.Sum(x => x.Amount * x.Units) / TotalSales) * 100,
                                 Units=grpOrder.Sum(x=>x.Units)
                             }).ToList();

            return saleratio;

        }
    }

    public static double SalesPercentage
    {
        get
        {
            return (SelectedProductSales / TotalSales) * 100;
        }
    }

    public static double TotalSales
    {
        get
        {
            var totalsales = (from order in orders
                              where order.Date.Month == SelectedMonth
                              select order.Amount * order.Units).Sum();
            return totalsales;
        }
    }

    public static int SelectedMonth
    {
        get { return selectedMonth; }
        set { selectedMonth = value; }
    }

    public static string SelectedProduct
    {
        get { return selectedProduct; }
        set { selectedProduct = value; }
    }
}