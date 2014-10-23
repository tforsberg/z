using System;
using System.Net;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Data.Services.Client;
using NorthWindDashboard.ServiceReference1;

namespace NorthWindDashboard
{
    /// <summary>
    /// Classes generated from Northwind ODataService:
    /// http://services.odata.org/Northwind/Northwind.svc/
    /// 
    /// This model does not load the data from the service; instead, it loads 
    /// customer/product data from resources and generates random sales.
    /// 
    /// This is mainly because NorthWind doesn't have enough sales data, but
    /// also to make demos run faster with poor web connections.
    /// 
    /// Also, the model extends the Customer partial class to add Latitude 
    /// and Longitude properties.
    /// </summary>
    public class ViewModel : INotifyPropertyChanged
    {
        //--------------------------------------------------------------------------
        #region ** fields

        CollectionViewSource _quarters, _salesByCustomer, _salesByCategory;
        SelectQuarter _cmdFirstQuarter, _cmdPrevQuarter, _cmdNextQuarter, _cmdLastQuarter;
        decimal _quarterSales, _goalGold, _goalPlat;
        List<Category> _categories;
        List<Product> _products;
        List<Customer> _customers;
        List<Employee> _employees;
        List<Order> _orders;
        List<Order_Detail> _orderDetails;

        #endregion

        //--------------------------------------------------------------------------
        #region ** ctor

        public ViewModel()
        {
            // load basic data
            LoadRawData();

            // generate orders
            GenerateOrders();

            // create list of distinct quarters we have sales for
            var lq = new List<string>();
            var qryQtr = from Order o in _orders select o.Quarter;
            foreach (var q in qryQtr.Distinct())
            {
                lq.Add(q);
            }
            _quarters = new CollectionViewSource();
            _quarters.Source = lq;
            Quarters.CurrentChanged += _quarters_CurrentChanged;

            // create sales by Customer and by Category lists (filtered by Quarter)
            CreateSalesByCustomer();
            CreateSalesByCategory();

            // create commands to navigate quarters
            _cmdFirstQuarter = new SelectQuarter(this, int.MaxValue);
            _cmdPrevQuarter = new SelectQuarter(this, +1);
            _cmdNextQuarter = new SelectQuarter(this, -1);
            _cmdLastQuarter = new SelectQuarter(this, int.MinValue);

            // update properties
            _quarters_CurrentChanged(this, EventArgs.Empty);
        }

        #endregion

        //--------------------------------------------------------------------------
        #region ** commands

        public ICommand SelectFirstQuarter
        {
            get { return _cmdFirstQuarter; }
        }
        public ICommand SelectPreviousQuarter
        {
            get { return _cmdPrevQuarter; }
        }
        public ICommand SelectNextQuarter
        {
            get { return _cmdNextQuarter; }
        }
        public ICommand SelectLastQuarter
        {
            get { return _cmdLastQuarter; }
        }

        #endregion

        //--------------------------------------------------------------------------
        #region ** object model

        /// <summary>
        /// Gets a list of all the quarters we have orders for.
        /// Quarters are strings in the format "Qx yyyy".
        /// </summary>
        public ICollectionView Quarters
        {
            get { return _quarters.View; }
        }
        /// <summary>
        /// Gets a list of the amounts sold to each customer in the current quarter.
        /// </summary>
        public ICollectionView SalesByCustomer
        {
            get { return _salesByCustomer.View; }
        }
        /// <summary>
        /// Gets a list of the amounts sold of each product category in the current quarter.
        /// </summary>
        public ICollectionView SalesByCategory
        {
            get { return _salesByCategory.View; }
        }
        /// <summary>
        /// Gets the total amount sold this quarter.
        /// </summary>
        public decimal QuarterSales
        {
            get { return _quarterSales; }
        }
        /// <summary>
        /// Gets the "gold-level" goal for the currently selected quarter.
        /// </summary>
        public decimal GoalGold
        {
            get { return _goalGold; }
        }
        /// <summary>
        /// Gets the "platinum-level" goal for the currently selected quarter.
        /// </summary>
        public decimal GoalPlatinum
        {
            get { return _goalPlat; }
        }
        /// <summary>
        /// Occurs when a property value changes, which causes bindings to update.
        /// </summary>
        public event PropertyChangedEventHandler PropertyChanged;
        /// <summary>
        /// Raises the <see cref="PropertyChanged"/> event.
        /// </summary>
        protected virtual void OnPropertyChanged()
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(null));
        }

        #endregion

        //--------------------------------------------------------------------------
        #region ** implementation

        // when the current quarter changes, update filters, total sales, and goals
        void _quarters_CurrentChanged(object sender, EventArgs e)
        {
            // update filters
            SalesByCustomer.Refresh();
            SalesByCategory.Refresh();

            // calculate sales for this quarter and for the previous quarter
            var qtrList = _quarters.Source as IList;
            var qtrThis = Quarters.CurrentItem as string;
            var qtrPrev = Quarters.CurrentPosition < qtrList.Count - 1
                ? qtrList[Quarters.CurrentPosition + 1] as string
                : string.Empty;
            _quarterSales = 0;
            decimal _prevQuarterSales = 0;
            foreach (Order o in _orders)
            {
                if (o.Quarter == qtrThis)
                {
                    _quarterSales += o.Amount;
                }
                else if (o.Quarter == qtrPrev)
                {
                    _prevQuarterSales += o.Amount;
                }
            }

            // compute sales goals (2% gold, 15% platinum)
            _goalGold = _prevQuarterSales * (decimal)1.02;
            _goalPlat = _prevQuarterSales * (decimal)1.15;

            // raise PropertyChanged event to update bindings
            OnPropertyChanged();
        }

        // load raw data from database
        void LoadRawData()
        {
            // categories
            _categories = new List<Category>();
            foreach (var line in GetLines("Categories.txt"))
            {
                var c = new Category();
                c.CategoryID = int.Parse(line[0]);
                c.CategoryName = line[1];
                c.Description = line[2];
                _categories.Add(c);
            }

            // products
            _products = new List<Product>();
            foreach (var line in GetLines("Products.txt"))
            {
                var p = new Product();
                p.ProductID = int.Parse(line[0]);
                p.ProductName = line[1];
                p.SupplierID = int.Parse(line[2]);
                p.CategoryID = int.Parse(line[3]);
                p.QuantityPerUnit = line[4];
                p.UnitPrice = decimal.Parse(line[5]);
                p.UnitsInStock = short.Parse(line[6]);
                p.UnitsOnOrder = short.Parse(line[7]);
                p.ReorderLevel = short.Parse(line[8]);
                p.Discontinued = bool.Parse(line[9]);
                p.Category = (from c in _categories
                              where c.CategoryID == p.CategoryID
                              select c).FirstOrDefault();
                _products.Add(p);
            }

            // customers
            _customers = new List<Customer>();
            foreach (var line in GetLines("Customers.txt"))
            {
                var c = new Customer();
                c.CustomerID = line[0];
                c.CompanyName = line[1];
                c.ContactName = line[2];
                c.ContactTitle = line[3];
                c.Address = line[4];
                c.City = line[5];
                c.Region = line[6];
                c.PostalCode = line[7];
                c.Country = line[8];
                c.Phone = line[9];
                c.Fax = line[10];
                c.Longitude = double.Parse(line[11]);
                c.Latitude = double.Parse(line[12]);
                _customers.Add(c);
            }

            // employees
            _employees = new List<Employee>();
            foreach (var line in GetLines("Employees.txt"))
            {
                var e = new Employee();
                e.EmployeeID = int.Parse(line[0]);
                e.LastName = line[1];
                e.FirstName = line[2];
                e.Title = line[3];
                e.TitleOfCourtesy = line[4];
                e.BirthDate = DateTime.Parse(line[5]);
                e.HireDate = DateTime.Parse(line[6]);
                e.Address = line[7];
                e.City = line[8];
                e.Region = line[9];
                e.PostalCode = line[10];
                e.HomePhone = line[11];
                e.Extension = line[12];
                _employees.Add(e);
            }
        }
        IEnumerable<string[]> GetLines(string resourceName)
        {
            var asm = this.GetType().Assembly;
            foreach (var rn in asm.GetManifestResourceNames())
            {
                if (rn.EndsWith(resourceName))
                {
                    var sr = new System.IO.StreamReader(asm.GetManifestResourceStream(rn));
                    for (; ; )
                    {
                        var line = sr.ReadLine();
                        if (line == null)
                        {
                            break;
                        }
                        if (line.StartsWith("%"))
                        {
                            continue;
                        }
                        yield return line.Split('\t');
                    }
                }
            }
        }

        // generate orders (since Northwind has so little)
        void GenerateOrders()
        {
            _orders = new List<Order>();
            _orderDetails = new List<Order_Detail>();
            var orderID = 100000;
            var factor = 1.0;
            var rnd = new Random(0);

            // loop from today back to the first year of data
            for (var dt = DateTime.Today; dt.Year >= 2000; dt = dt.AddDays(-1))
            {
                // create up to 20 orders per day
                for (int i = 0; i < rnd.Next(1, Math.Max(1, (int)(factor * 20.0))); i++)
                {
                    // create order
                    var o = new Order();
                    o.OrderID = orderID--;
                    o.OrderDate = dt;
                    o.Employee = _employees[rnd.Next() % _employees.Count];
                    o.EmployeeID = o.Employee.EmployeeID;
                    o.RequiredDate = o.OrderDate;
                    o.ShippedDate = o.OrderDate;
                    o.Customer = _customers[rnd.Next() % _customers.Count];
                    o.CustomerID = o.Customer.CustomerID;
                    o.Freight = rnd.Next(5, 25);
                    o.ShipName = o.Customer.CompanyName;
                    o.ShipAddress = o.Customer.Address;
                    o.ShipCity = o.Customer.City;
                    o.ShipCountry = o.Customer.Country;
                    o.ShipPostalCode = o.Customer.PostalCode;
                    o.ShipRegion = o.Customer.Region;
                    _orders.Add(o);

                    // create up to 40 order details per order
                    for (int j = 0; j < rnd.Next(10, 40); j++)
                    {
                        var od = new Order_Detail();
                        od.Discount = 0;
                        od.Order = o;
                        od.OrderID = o.OrderID;
                        od.Product = _products[rnd.Next() % _products.Count];
                        od.ProductID = od.ProductID;
                        od.Quantity = (short)rnd.Next(1, Math.Max(10, (int)(factor * 50.0)));
                        od.UnitPrice = od.Product.UnitPrice.Value;
                        o.Order_Details.Add(od);
                        _orderDetails.Add(od);
                    }
                }
                factor *= 0.9;
            }
        }

        // create SalesByCustomer collection (filtered by Quarter)
        void CreateSalesByCustomer()
        {
            var lsc = new List<SalesByCustomer>();

            // group by quarter
            var qByQtr =
                from o in _orders
                group o by o.Quarter into g
                select new { Quarter = g.Key, Orders = g };
            foreach (var oq in qByQtr)
            {
                // group by customer
                var qByCust =
                    from o in oq.Orders
                    group o by o.Customer into g
                    select new { Customer = g.Key, Quarter = oq.Quarter, Orders = g };
                foreach (var oc in qByCust)
                {
                    var sbc = new SalesByCustomer();
                    sbc.Customer = oc.Customer;
                    sbc.Quarter = oc.Quarter;
                    sbc.Amount = (from o in oc.Orders select o.Amount).Sum();
                    sbc.Scale = Math.Max(1, Math.Sqrt((double)sbc.Amount / 1000.0));
                    lsc.Add(sbc);
                }
            }

            // create ICollectionView
            _salesByCustomer = new CollectionViewSource();
            _salesByCustomer.Source = lsc;

            // sort by customer name
            var sd = new SortDescription("Customer.CompanyName", ListSortDirection.Ascending);
            SalesByCustomer.SortDescriptions.Add(sd);

            // filter by current Quarter
            SalesByCustomer.Filter = (item) =>
            {
                var sbc = item as SalesByCustomer;
                return string.Equals(sbc.Quarter, (string)Quarters.CurrentItem);
            };
        }

        // create SalesByCategory collection (filtered by Quarter)
        void CreateSalesByCategory()
        {
            var lsc = new List<SalesByCategory>();

            // group by quarter
            var qByQtr =
                from o in _orderDetails
                group o by o.Order.Quarter into g
                select new { Quarter = g.Key, OrderDetails = g };
            foreach (var oq in qByQtr)
            {
                // group by category
                var qByCust =
                    from o in oq.OrderDetails
                    group o by o.Product.Category into g
                    select new { Category = g.Key, Quarter = oq.Quarter, OrderDetails = g };
                foreach (var oc in qByCust)
                {
                    var sbc = new SalesByCategory();
                    sbc.Category = oc.Category;
                    sbc.Quarter = oc.Quarter;
                    sbc.Amount = (from o in oc.OrderDetails select o.Amount).Sum();
                    lsc.Add(sbc);
                }
            }

            // create ICollectionView
            _salesByCategory = new CollectionViewSource();
            _salesByCategory.Source = lsc;

            // sort by category name
            var sd = new SortDescription("Category.CategoryName", ListSortDirection.Ascending);
            SalesByCategory.SortDescriptions.Add(sd);

            // filter by current Quarter
            SalesByCategory.Filter = (item) =>
            {
                var sbc = item as SalesByCategory;
                return string.Equals(sbc.Quarter, (string)Quarters.CurrentItem);
            };
        }

        #endregion
    }
}
