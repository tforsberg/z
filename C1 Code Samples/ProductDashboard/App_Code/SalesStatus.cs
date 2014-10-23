using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Sales
/// </summary>
public class SalesStatus
{
    #region Public Methods

    public SalesStatus(DateTime date, String product, Int32 totalOrders, Int32 invalidOrders,
        Int32 completed, Int32 returns, Int32 inOrder)
    {
        Date = date;
        Product = product;
        TotalOrders = totalOrders;
        InvalidOrders = invalidOrders;
        Completed = completed;
        Returns = returns;
        InOrder = inOrder;
    }

    #endregion

    #region Public Properties

    /// <summary> 
    /// Bumber of users bought 
    /// </summary> 
    public Int32 InOrder
    {
        get
        {
            return _inOrder;
        }
        set
        {
            _inOrder = value;
          
        }
    }

    /// <summary> 
    /// Number of qualified leads 
    /// </summary> 
    public Int32 Returns
    {
        get
        {
            return _returns;
        }
        set
        {
            _returns = value;
            
        }
    }

    /// <summary> 
    /// Number of leads reched 
    /// </summary> 
    public Int32 Completed
    {
        get
        {
            return _completed;
        }
        set
        {
            _completed = value;
           
        }
    }

    /// <summary> 
    /// Number of valid leads 
    /// </summary> 
    public Int32 InvalidOrders
    {
        get
        {
            return _invalidOrders;
        }
        set
        {
            _invalidOrders = value;
            
        }
    }

    /// <summary> 
    /// Number of downloads 
    /// </summary> 
    public Int32 TotalOrders
    {
        get
        {
            return _totalOrders;
        }
        set
        {
            _totalOrders = value;
            
        }
    }

    /// <summary> 
    /// Product ID 
    /// </summary> 
    public String Product
    {
        get
        {
            return _product;
        }
        set
        {
            _product = value;
            
        }
    }

    /// <summary> 
    /// Date 
    /// </summary> 
    public DateTime Date
    {
        get
        {
            return _date;
        }
        set
        {
            _date = value;
           
        }
    }

    #endregion

    #region Data

    Int32 _inOrder;
    Int32 _returns;
    Int32 _completed;
    Int32 _invalidOrders;
    Int32 _totalOrders;
    String _product;
    DateTime _date;

    #endregion
}