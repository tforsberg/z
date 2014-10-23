using System;
using System.IO;
using System.Xml;
using System.Net;
using System.Windows;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace ODataX
{
    public class DataSource : BaseObject
    {
        // ** fields
        ViewModel _vm;
        string _name, _url, _user, _password;
        ListCollectionView<DataTable> _dataTables;

        // ** ctors
        public DataSource(ViewModel model)
            : this(model, null, null, null, null)
        {
        }
        public DataSource(ViewModel model, string name, string url)
            : this(model, name, url, null, null)
        {
        }
        public DataSource(ViewModel model, string name, string url, string user, string password)
        {
            _vm = model;
            Name = name;
            Url = url;
            User = user;
            Password = password;
        }

        // ** object model
        public ViewModel Model
        {
            get { return _vm; }
        }
        public string Name
        {
            get { return _name; }
            set { SetValue(ref _name, value, "Name"); }
        }
        public string Url
        {
            get { return _url; }
            set { SetValue(ref _url, value, "Url"); }
        }
        public string User
        {
            get { return _user; }
            set { SetValue(ref _user, value, "User"); }
        }
        public string Password
        {
            get { return _password; }
            set { SetValue(ref _password, value, "Password"); }
        }
        public ICollectionView Tables
        {
            get
            {
                if (_dataTables == null)
                {
                    _dataTables = new ListCollectionView<DataTable>();
                    OnPropertyChanged("DataTables");
                }
                return _dataTables.View;
            }
        }
        protected override void OnPropertyChanged(string propName)
        {
            base.OnPropertyChanged(propName);
            if (_dataTables != null)
            {
                Refresh();
            }
        }
        public void Refresh()
        {
            if (!string.IsNullOrEmpty(_url))
            {
                // create web client
                var wc = new WebClient();
                if (!string.IsNullOrEmpty(_user) && !string.IsNullOrEmpty(_password))
                {
                    wc.Credentials = new NetworkCredential(_user, _password);
                }

                // get schema (list of tables)
                wc.DownloadStringCompleted += (s, e) =>
                    {
                        Model.ActiveConnections--;
                        if (e.Error != null)
                        {
                            OnLoadingError(e.Error);
                        }
                        else
                        {
                            try
                            {
                                // build list of table names
                                var tableNames = new List<string>();
                                var settings = new XmlReaderSettings();
                                settings.DtdProcessing = DtdProcessing.Ignore;
                                settings.CheckCharacters = false;
                                settings.CloseInput = true;
                                var xr = XmlReader.Create(new StringReader(e.Result), settings);
                                while (xr.Read())
                                {
                                    if (xr.NodeType == XmlNodeType.Element &&
                                        xr.Name == "collection")
                                    {
                                        var name = xr.GetAttribute("href");
                                        if (!string.IsNullOrEmpty(name))
                                        {
                                            tableNames.Add(name);
                                        }
                                    }
                                }

                                // sort list and create tables
                                tableNames.Sort();
                                foreach (var name in tableNames)
                                {
                                    var dt = new DataTable(this, name);
                                    _dataTables.Add(dt);
                                }
                            }
                            catch (Exception x)
                            {
                                OnLoadingError(x);
                            }
                        }
                    };
                Model.ActiveConnections++;
                wc.DownloadStringAsync(new Uri(_url, UriKind.Absolute));
            }
        }
        void OnLoadingError(Exception x)
        {
            var msg = string.Format("Error retrieving schema for data source '{0}'", Name);
            Model.OnError(msg, x);
        }
    }
}
