using System;
using System.Linq;

namespace NorthWindDashboard.ServiceReference1
{
    /// <summary>
    /// Add Longitude and Latitude properties to Customer class.
    /// </summary>
    public partial class Customer
    {
        public double Longitude { get; set; }
        public double Latitude { get; set; }
    }
    /// <summary>
    /// Add Amount and Quarter properties to Order class.
    /// </summary>
    public partial class Order
    {
        public decimal Amount
        {
            get { return (from od in this.Order_Details select od.Amount).Sum(); }
        }
        public string Quarter
        {
            get
            {
                var dt = OrderDate.Value;
                return string.Format("Q{0} {1}", (dt.Month - 1) / 3 + 1, dt.Year);
            }
        }
    }
    /// <summary>
    /// Add Amount property to OrderDetail class.
    /// </summary>
    public partial class Order_Detail
    {
        public decimal Amount
        {
            get { return Quantity * UnitPrice * (1 - (decimal)Discount); }
        }
    }
    /// <summary>
    /// Group sales information by customer (and by quarter).
    /// </summary>
    public class SalesByCustomer
    {
        public string Quarter { get; set; }
        public Customer Customer { get; set; }
        public decimal Amount { get; set; }
        public double Scale { get; set; }
    }
    /// <summary>
    /// Group sales information by category (and by quarter).
    /// </summary>
    public class SalesByCategory
    {
        public string Quarter { get; set; }
        public Category Category { get; set; }
        public decimal Amount { get; set; }
    }
}