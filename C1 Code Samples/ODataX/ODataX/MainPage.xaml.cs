using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ODataX
{
    public partial class MainPage : UserControl
    {
        public MainPage()
        {
            InitializeComponent();

            // save reference to ViewModel
            _vm = Resources["_vm"] as ViewModel;

            // hook up button clicks
            _btnAddSource.Click += _btnAddSource_Click;
            _btnRemoveSource.Click += _btnRemoveSource_Click;
            _btnEditSource.Click += _btnEditSource_Click;
            _btnEditTable.Click += _btnEditTable_Click;

            // use animation to show activity
            _vm.PropertyChanged += (s, e) =>
                {
                    if (e.PropertyName == "ActiveConnections")
                    {
                        if (_vm.ActiveConnections > 0 &&
                            _sbLogo.GetCurrentState() != ClockState.Active)
                        {
                            _sbLogo.Begin();
                        }
                        else if (_vm.ActiveConnections == 0)
                        {
                            _sbLogo.Stop();
                        }
                    }
                };

            // apply custom cell factory, filter
            _flex.CellFactory = _vm.CellFactory;
            var f = new C1.Silverlight.FlexGrid.C1FlexGridFilter(_flex);
        }
        ViewModel Model
        {
            get { return _vm; }
        }

        // add a data source to the model
        void _btnAddSource_Click(object sender, RoutedEventArgs e)
        {
            var ds = new DataSource(Model);
            var dlg = new ModalDialog("Add Data Source", new DataSourceEditor(), ds);
            dlg.ShowDialog(MessageBoxButton.OKCancel);
            dlg.Closed += (ss, ee) =>
            {
                if (!ee.Cancel)
                {
                    Model.AddDataSource(ds);
                }
            };
        }

        // remove a data source from the model
        void _btnRemoveSource_Click(object sender, RoutedEventArgs e)
        {
            var ds = Model.DataSources.CurrentItem as DataSource;
            if (ds != null)
            {
                var msg = string.Format("Press OK to remove data source '{0}'.", ds.Name);
                if (MessageBox.Show(msg, "Confirm", MessageBoxButton.OKCancel) == MessageBoxResult.OK)
                {
                    Model.RemoveDataSource();
                }
            }
        }

        // edit the current data source properties
        void _btnEditSource_Click(object sender, RoutedEventArgs e)
        {
            var ds = Model.DataSources.CurrentItem as DataSource;
            if (ds != null)
            {
                var dlg = new ModalDialog("Data Source Settings", new DataSourceEditor(), ds);
                dlg.ShowDialog(MessageBoxButton.OKCancel);
            }
        }

        // edit the current table properties
        void _btnEditTable_Click(object sender, RoutedEventArgs e)
        {
            var ds = Model.DataSources.CurrentItem as DataSource;
            if (ds != null && ds.Tables.CurrentItem != null)
            {
                var dlg = new ModalDialog("DataTable Settings", new DataTableEditor(), ds.Tables.CurrentItem);
                dlg.ShowDialog(MessageBoxButton.OKCancel);
            }
        }
    }
}
