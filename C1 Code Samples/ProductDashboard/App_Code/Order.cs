using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Order
/// </summary>
public class Order
{

    #region private

    Boolean _newCustomer;
    Double _amount;
    Boolean _isValid;
    String _product;
    String _category;
    DateTime _date;

    #endregion

    #region Public Methods

    public Order(DateTime date, String product, String category, Boolean newCustomer, Boolean expressShipping, Double amount,int units)
    {
        Date = date;
        Product = product;
        Company = category;
        ExpressShipping = expressShipping;
        NewCustomer = newCustomer;
        Amount = amount;
        Units = units;
    }

    #endregion

    #region Public Properties

    /// <summary> 
    /// If the customer is new. 
    /// </summary> 
    public Boolean NewCustomer
    {
        get
        {
            return _newCustomer;
        }
        set
        {
            _newCustomer = value;
           
        }
    }

    /// <summary> 
    /// Amount in $ 
    /// </summary> 
    public Double Amount
    {
        get
        {
            return _amount;
        }
        set
        {
            _amount = value;
           
        }
    }

    /// <summary> 
    /// Is it a valid order. 
    /// </summary> 
    public Boolean ExpressShipping
    {
        get
        {
            return _isValid;
        }
        set
        {
            _isValid = value;
           
        }
    }

    /// <summary> 
    /// Product Id 
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
    /// product Source
    /// </summary> 
    public String Company
    {
        get
        {
            return _category;
        }
        set
        {
            _category = value;
           
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

    /// <summary>
    /// Number of units sold.
    /// </summary>
    public int Units { get; set; }
         

    #endregion

   
}