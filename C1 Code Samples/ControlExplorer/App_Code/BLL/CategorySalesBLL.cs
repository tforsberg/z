using ControlExplorer.App_Code.DAL.C1NWindTableAdapters;

/// <summary>
/// Summary description for Categories
/// </summary>
[System.ComponentModel.DataObject]
public class CategorySalesBLL
{
	private CategorySalesTableAdapter _adapter = null;
	protected CategorySalesTableAdapter Adapter
    {
        get
        {
            if (_adapter == null)
				_adapter = new CategorySalesTableAdapter();

            return _adapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
	public ControlExplorer.App_Code.DAL.C1NWind.CategorySalesDataTable GetData()
    {
		return Adapter.GetData();
    }
}
