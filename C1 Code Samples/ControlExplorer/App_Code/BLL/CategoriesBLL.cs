using ControlExplorer.App_Code.DAL.C1NWindTableAdapters;

/// <summary>
/// Summary description for Categories
/// </summary>
[System.ComponentModel.DataObject]
public class CategoriesBLL
{
    private CategoriesTableAdapter _categoriesAdapter = null;
    protected CategoriesTableAdapter Adapter
    {
        get
        {
            if (_categoriesAdapter == null)
                _categoriesAdapter = new CategoriesTableAdapter();

            return _categoriesAdapter;
        }
    }


    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, true)]
	public ControlExplorer.App_Code.DAL.C1NWind.CategoriesDataTable GetCategories()
    {
        return Adapter.GetCategories();
    }

    [System.ComponentModel.DataObjectMethodAttribute(System.ComponentModel.DataObjectMethodType.Select, false)]
	public ControlExplorer.App_Code.DAL.C1NWind.CategoriesDataTable GetCategoryByCategoryID(int categoryID)
    {
        return Adapter.GetCategoryByCategoryID(categoryID);
    }
}
