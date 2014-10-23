using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ModelData
/// </summary>
public class ModelData
{
    #region Data

    public String GAMECONSOLE_A = "Play Station";
    public String GAMECONSOLE_B = "Xbox";
    public String GAMECONSOLE_C = "Nvidea Shield";

    #endregion

    #region Public Methods

    /// <summary> 
    /// Get Random data for orders 
    /// </summary> 
    /// <returns>List<Order>Orders</returns> 
    public List<Order> GetOrders()
    {
        List<Order> orders = new List<Order>();

        orders.AddRange(CreateOders(GAMECONSOLE_A, "Sony", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_A, "Sony", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_A, "Sony", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));

        orders.AddRange(CreateOders(GAMECONSOLE_A, "Sony", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_A, "Sony", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_A, "Sony", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));

        orders.AddRange(CreateOders(GAMECONSOLE_B, "Microsoft", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_B, "Microsoft", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_B, "Microsoft", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));

        orders.AddRange(CreateOders(GAMECONSOLE_B, "Microsoft", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_B, "Microsoft", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_B, "Microsoft", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));

        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 1, 1), new DateTime(2014, 5, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 5, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 3, 1), new DateTime(2014, 12, 30), 23));

        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));
        orders.AddRange(CreateOders(GAMECONSOLE_C, "NVIDIA", new DateTime(2014, 1, 1), new DateTime(2014, 12, 30), 23));

        return orders;
    }

    /// <summary> 
    /// Get sample data for sales conversions 
    /// </summary> 
    /// <param name="orders"></param> 
    /// <returns></returns> 
    public List<SalesStatus> GetSalesStatus(List<Order> orders)
    {
        List<SalesStatus> salesConversions = new List<SalesStatus>();

        List<SalesStatus> sc1 = CreateSalesStatus(orders, GAMECONSOLE_A, new DateTime(2014, 1, 1), new DateTime(2014, 12, 30));
        salesConversions.AddRange(sc1);

        List<SalesStatus> sc2 = CreateSalesStatus(orders, GAMECONSOLE_B, new DateTime(2014, 1, 1), new DateTime(2014, 12, 30));
        salesConversions.AddRange(sc2);

        List<SalesStatus> sc3 = CreateSalesStatus(orders, GAMECONSOLE_C, new DateTime(2014, 1, 1), new DateTime(2014, 12, 30));
        salesConversions.AddRange(sc3);

        return salesConversions;
    }

    #endregion

    #region Private Methods

    private List<SalesStatus> CreateSalesStatus(List<Order> orders, String productName, DateTime fromDate, DateTime toDate)
    {

        List<SalesStatus> sales = new List<SalesStatus>();
        Double randVal;

        Int32 sold = 0;
        Random rand = new Random(DateTime.Now.Millisecond);

        while (fromDate < toDate)
        {
            sold = (from x in orders where x.Product == productName && x.Date.Month == fromDate.Month select x).Count();

            randVal = rand.NextDouble();
            Int32 p1 = (Int32)(sold * (1 + randVal < 1 ? 1.5 : 2));

            randVal = rand.NextDouble();
            Int32 p2 = (Int32)(p1 * (1 + randVal < 1 ? 1.5 : 2));

            randVal = rand.NextDouble();
            Int32 p3 = (Int32)(p2 * (1 + randVal < 1 ? 1.5 : 2));


            Int32 p4 = p1 + p2 + p3 + sold;

            sales.Add(new SalesStatus(fromDate, productName, p4, p1, p3, p2, sold));

            fromDate = fromDate.AddMonths(1);
        }

        return sales;
    }

    private List<Order> CreateOders(String productName, string category, DateTime fromDate, DateTime toDate, Int32 totalTargetSold)
    {
        Random rand = new Random(DateTime.Now.Millisecond);
        List<Order> orders = new List<Order>();
        Int32 count = 1;

        try
        {
            while (fromDate <= toDate)
            {
                Int32 randomNumber = rand.Next(10, 100 * count);

                Int32 productSold = (Int32)(randomNumber * 0.123 * rand.NextDouble() * rand.NextDouble());
                Int32 index = productSold;
                int loop = 2;
                while (loop >= 0)
                {
                    Int32 rand1 = rand.Next(1, 300);
                    Int32 rand2 = rand.Next(100, 200);
                    Boolean newCustomer = !(rand.Next(1, 5) == 2 || rand.Next(1, 5) == 5);
                    Boolean expressShip = rand.Next(index, index + 5) == 3;
                    Double revenue = (productName == GAMECONSOLE_A) ? 225 : (productName == GAMECONSOLE_B) ? 325 : 200;
                    int units = rand2;
                    orders.Add(new Order(fromDate, productName, category, newCustomer, expressShip, revenue, units));

                    loop--;
                }

                fromDate = fromDate.AddDays(1);
            }
        }
        catch (Exception e)
        {
            throw new Exception(e.Message);
        }

        return orders;
    }

    #endregion
}