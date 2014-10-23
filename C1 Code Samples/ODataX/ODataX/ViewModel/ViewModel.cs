using System;
using System.Net;
using System.ComponentModel;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Windows;
using System.Windows.Data;
using System.Windows.Input;

namespace ODataX
{
    public class ViewModel : BaseObject
    {
        // ** fields
        ListCollectionView<DataSource> _sources;
        int _activeConnections;
        ODataCellFactory _cellFactory = new ODataCellFactory();
        ICommand _navigatBack;

        // ** ctor
        public ViewModel()
        {
            _sources = new ListCollectionView<DataSource>();
            AddSource("Northwind", "http://services.odata.org/Northwind/Northwind.svc");
            AddSource("Netflix", "http://odata.netflix.com/v2/Catalog/");
            AddSource("PluralSight", "http://www.pluralsight-training.net/odata/");
            AddSource("INeta", "http://live.ineta.org/InetaLiveService.svc");
            AddSource("Open Science Initiative", "http://ogdi.cloudapp.net/v1/dc");
            AddSource("ebay", "http://ebayodata.cloudapp.net/");
            AddSource("Vancouver", "http://vancouverdataservice.cloudapp.net/v1/vancouver");
            AddSource("VanGuide", "http://vancouverdataservice.cloudapp.net/v1/");
            AddSource("Transit", "http://transit.cloudapp.net/DevTransitODataService.svc");

            // these don't accept cross-domain requests:
            //AddSource("Open Government Data Initiative", "http://ogdi.cloudapp.net/v1/");
            //AddSource("Facebook Insights", "http://facebook-insights.cloudapp.net/");
            //AddSource("Nuget", "http://packages.nuget.org/v1/FeedService.svc/");
            //AddSource("Windows Live", "http://live.com/");
            //AddSource("Stack Overflow", "http://data.stackexchange.com/stackoverflow/atom");
            //AddSource("Research.microsoft.com OData", "http://odata.research.microsoft.com/");
            //AddSource("Linked Open Data Cloud Cache", "http://lod.openlinksw.com/fct");
            //AddSource("Windows Azure Marketplace DataMarket", "https://datamarket.azure.com/");
            //AddSource("SAP", "http://gw.esworkplace.sap.com/sap/opu/odata/sap/SALESORDERS/SOItems", "GW@ESW", "ESW4GW");

            _navigatBack = new NavigateBackCommand(this);
        }
        public int ActiveConnections
        {
            get { return _activeConnections; }
            set { SetValue(ref _activeConnections, value, "ActiveConnections"); }
        }
        void AddSource(string name, string url)
        {
            AddSource(name, url, null, null);
        }
        void AddSource(string name, string url, string user, string password)
        {
            _sources.Add(new DataSource(this, name, url, user, password));
        }

        // ** object model
        public ICollectionView DataSources
        {
            get { return _sources.View; }
        }
        public void AddDataSource(DataSource ds)
        {
            if (ds.Model != this)
            {
                throw new Exception("This data source does not belong to this model.");
            }
            _sources.Add(ds);
        }
        public void RemoveDataSource()
        {
            var ds = _sources.View.CurrentItem as DataSource;
            if (ds != null)
            {
                _sources.Remove(ds);
            }
        }
        public ICommand NavigateBack
        {
            get { return _navigatBack; }
        }
        public ODataCellFactory CellFactory
        {
            get { return _cellFactory; }
        }
        protected internal void OnError(string msg, Exception e)
        {
            var errMsg = e.Message;
            if (string.IsNullOrEmpty(errMsg) && e.InnerException != null)
            {
                errMsg = e.InnerException.Message;
            }
            if (string.IsNullOrEmpty(errMsg))
            {
                errMsg = e.ToString();
            }
            errMsg = string.Format("{0}\r\n{1}", msg, errMsg);
            MessageBox.Show(errMsg, "Error", MessageBoxButton.OK);
        }
    }
}
