using System;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace ODataX
{
    public class ListCollectionView<T> : ObservableCollection<T>
    {
        CollectionViewSource _cvs;
        public ICollectionView View
        {
            get
            {
                if (_cvs == null)
                {
                    _cvs = new CollectionViewSource();
                    _cvs.Source = this;
                }
                return _cvs.View;
            }
        }
    }
}
