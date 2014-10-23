using ControlExplorer.App_Code.DAL.C1NWindTableAdapters;

/// <summary>
/// Summary description for Categories
/// </summary>
[System.ComponentModel.DataObject]
public class ProductsBLL
{
	private ProductsTableAdapter _adapter = null;
	protected ProductsTableAdapter Adapter
    {
        get
        {
            if (_adapter == null)
				_adapter = new ProductsTableAdapter();

            return _adapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
	public ControlExplorer.App_Code.DAL.C1NWind.ProductsDataTable GetData()
    {
		return Adapter.GetData();
    }
}
