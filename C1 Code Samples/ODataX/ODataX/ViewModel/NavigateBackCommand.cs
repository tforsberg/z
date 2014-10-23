using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ODataX
{
    public class NavigateBackCommand : ICommand
    {
        ViewModel _vm;
        DataSource _ds;
        DataTable _dt;

        public NavigateBackCommand(ViewModel vm)
        {
            _vm = vm;
            vm.DataSources.CurrentChanged += DataSources_CurrentChanged;
            DataSources_CurrentChanged(this, EventArgs.Empty);
        }

        void DataSources_CurrentChanged(object sender, EventArgs e)
        {
            if (_ds != null)
            {
                _ds.Tables.CurrentChanged -= Tables_CurrentChanged;
            }
            _ds = _vm.DataSources.CurrentItem as DataSource;
            if (_ds != null)
            {
                _ds.Tables.CurrentChanged += Tables_CurrentChanged;
            }
            OnCanExecuteChanged();
        }
        void Tables_CurrentChanged(object sender, EventArgs e)
        {
            if (_dt != null)
            {
                _dt.PropertyChanged -= _dt_PropertyChanged;
            }
            _dt = _ds.Tables.CurrentItem as DataTable;
            if (_dt != null)
            {
                _dt.PropertyChanged += _dt_PropertyChanged;
            }
            OnCanExecuteChanged();
        }
        void _dt_PropertyChanged(object sender, System.ComponentModel.PropertyChangedEventArgs e)
        {
            OnCanExecuteChanged();
        }
        void OnCanExecuteChanged()
        {
            if (CanExecuteChanged != null)
                CanExecuteChanged(this, EventArgs.Empty);
        }
        public bool CanExecute(object parameter)
        {
            return _dt != null && _dt.ChildTables.Count > 0;
        }
        public event EventHandler CanExecuteChanged;
        public void Execute(object parameter)
        {
            _dt.NavigateBack();
        }
    }
}
