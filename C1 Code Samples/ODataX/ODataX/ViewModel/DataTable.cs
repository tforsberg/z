using System;
using System.IO;
using System.Xml;
using System.Net;
using System.Windows;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using C1.Silverlight.Data;

namespace ODataX
{
    public class DataTable : BaseObject
    {
        // ** fields
        DataSource _source;
        string _name, _filter, _sort, _sourceUrl;
        int _top = 10000; // max records to load by default
        C1.Silverlight.Data.DataTable _dt;
        List<DataTable> _childTables = new List<DataTable>();

        // ** ctor

        /// <summary>
        /// Initializes a new instance of a <see cref="DataTable"/>.
        /// </summary>
        public DataTable(DataSource source, string name)
        {
            _source = source;
            _name = name;
        }

        // ** object model

        /// <summary>
        /// Gets or sets the name of this table.
        /// </summary>
        public string Name
        {
            get { return _name; }
            set { SetValue(ref _name, value, "Name"); }
        }
        /// <summary>
        /// Gets or sets the OData filter statement to apply to this table.
        /// </summary>
        public string Filter
        {
            get { return _filter; }
            set { SetValue(ref _filter, value, "Filter"); }
        }
        /// <summary>
        /// Gets or sets the OData sort statement to apply to this table.
        /// </summary>
        public string Sort
        {
            get { return _sort; }
            set { SetValue(ref _sort, value, "Sort"); }
        }
        /// <summary>
        /// Gets or sets the maximum number of records to return for this table.
        /// </summary>
        public int Top
        {
            get { return _top; }
            set { SetValue(ref _top, value, "Top"); }
        }
        /// <summary>
        /// Reload the data for this table.
        /// </summary>
        void Refresh()
        {
            // clear old data
            _dt.Rows.Clear();
            _dt.Columns.Clear();
            _childTables.Clear();

            // load new data
            GetTableRows(GetUrl());
            OnPropertyChanged("DataView");
        }
        /// <summary>
        /// Get the data to show for this DataTable.
        /// </summary>
        public ICollectionView DefaultView
        {
            get
            {
                // show last child table if any
                if (_childTables.Count > 0)
                {
                    return _childTables[_childTables.Count - 1].DefaultView;
                }

                // no child tables, show this table's data
                if (_dt == null)
                {
                    _dt = new C1.Silverlight.Data.DataTable();
                    Refresh();
                }
                return _dt.DefaultView;
            }
        }
        public string SourceUrl
        {
            get
            {
                // show last child table if any
                if (_childTables.Count > 0)
                {
                    return _childTables[_childTables.Count - 1].SourceUrl;
                }

                // no child tables, show this table's url
                return _sourceUrl;
            }
        }
        /// <summary>
        /// Navigate to a linked table.
        /// </summary>
        /// <param name="url">Url of the linked table.</param>
        public void NavigateTo(TableLink link)
        {
            // create new child DataTable
            var dt = new DataTable(_source, link.Name);

            // populate the new DataTable
            var url = string.Format("{0}/{1}", link.Url, link.Href);
            if (Top > 0 && link.Type.IndexOf("feed") > -1)
            {
                url += url.IndexOf('?') > -1 ? "&" : "?";
                url += "$top=" + Top.ToString();
            }
            dt._dt = new C1.Silverlight.Data.DataTable();
            dt.GetTableRows(url);

            // add it to child table list and notify
            _childTables.Add(dt);
            OnPropertyChanged("DefaultView");
            OnPropertyChanged("SourceUrl");
        }
        /// <summary>
        /// Removes the last linked table.
        /// </summary>
        public void NavigateBack()
        {
            var cnt = _childTables.Count;
            if (cnt > 0)
            {
                _childTables.RemoveAt(cnt - 1);
                OnPropertyChanged("DefaultView");
                OnPropertyChanged("SourceUrl");
            }
        }
        /// <summary>
        /// Gets a list of the child (linked) tables.
        /// </summary>
        public IList<DataTable> ChildTables
        {
            get { return _childTables.AsReadOnly(); }
        }

        // ** implementation
        string GetUrl()
        {
            // get base url for this table
            var url = _source.Url;
            url = string.Format("{0}{1}{2}", url, url.EndsWith("/") ? string.Empty : "/", _name);

            // apply sort/filter/data
            var hasSort = !string.IsNullOrEmpty(Sort);
            if (hasSort)
            {
                url += "?$orderby=" + Sort;
            }
            if (!string.IsNullOrEmpty(Filter))
            {
                url += url.IndexOf('?') > -1 ? "&" : "?";
                url += "$filter=" + Filter;
            }
            if (Top > 0)
            {
                url += url.IndexOf('?') > -1 ? "&" : "?";
                url += "$top=" + Top.ToString();
            }

            return url;
        }
        void GetTableRows(string url)
        {
            // save source url
            _sourceUrl = url;

            // create web client
            var wc = new WebClient();
            if (!string.IsNullOrEmpty(_source.User) && !string.IsNullOrEmpty(_source.Password))
            {
                wc.Credentials = new NetworkCredential(_source.User, _source.Password);
            }

            // load data into table
            wc.DownloadStringCompleted += (s, e) =>
                {
                    _source.Model.ActiveConnections--;
                    if (e.Error != null)
                    {
                        OnLoadingError(e.Error);
                    }
                    else
                    {
                        try
                        {
                            // start loading
                            var current = _dt.DefaultView.CurrentItem;
                            _dt.BeginLoadData();

                            // load new data
                            var settings = new XmlReaderSettings();
                            settings.DtdProcessing = DtdProcessing.Ignore;
                            settings.CheckCharacters = false;
                            settings.CloseInput = true;
                            var xr = XmlReader.Create(new StringReader(e.Result), settings);
                            while (xr.Read())
                            {
                                if (xr.NodeType == XmlNodeType.Element)
                                {
                                    if (xr.Name == "entry")
                                    {
                                        var dr = GetDataRow(xr.ReadSubtree());
                                        _dt.Rows.Add(dr);
                                    }
                                    if (xr.Name == "link")
                                    {
                                        if (xr.GetAttribute("rel") == "next")
                                        {
                                            url = xr.GetAttribute("href");
                                            GetTableRows(url);
                                        }
                                    }
                                }
                            }

                            // done loading
                            _dt.EndLoadData();
                            _dt.DefaultView.MoveCurrentTo(current);
                        }
                        catch (Exception x)
                        {
                            OnLoadingError(x);
                        }
                    }
                };

            // go to work
            _source.Model.ActiveConnections++;
            wc.DownloadStringAsync(new Uri(url, UriKind.Absolute));
        }
        void OnLoadingError(Exception x)
        {
            var msg = string.Format("Error loading data into table '{0}'", this.Name);
            _source.Model.OnError("Error retrieving schema.", x);
        }
        DataRow GetDataRow(XmlReader xr)
        {
            // get values, add columns
            var dct = new Dictionary<DataColumn, object>();
            xr.Read();
            while (xr.Read())
            {
                if (xr.NodeType == XmlNodeType.Element)
                {
                    if (xr.Name == "link")
                    {
                        var href = xr.GetAttribute("href");
                        var name = xr.GetAttribute("title");
                        var type = xr.GetAttribute("type");
                        if (!string.IsNullOrEmpty(href) && !string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(type))
                        {
                            if (type.IndexOf("application/atom+xml;type=") > -1)
                            {
                                var col = GetDataColumn(name, typeof(TableLink));
                                dct[col] = new TableLink(name, _source.Url, href, type);
                            }
                        }
                    }
                    else if (xr.Name == "m:properties")
                    {
                        GetDataRowProperties(dct, xr.ReadSubtree());
                    }
                }
            }

            // build new row
            var newRow = _dt.NewRow();
            foreach (var kv in dct)
            {
                newRow[kv.Key] = kv.Value != DBNull.Value ? kv.Value : null;
            }
            return newRow;
        }
        void GetDataRowProperties(Dictionary<DataColumn, object> dct, XmlReader xr)
        {
            xr.Read();
            while (xr.Read())
            {
                if (xr.NodeType == XmlNodeType.Element)
                {
                    var type = ParseColumnType(xr.GetAttribute("m:type"));
                    if (type != null)
                    {
                        var name = ParseColumnName(xr.Name);
                        var isNull = xr.GetAttribute("m:null") != null;
                        var value = xr.ReadElementContentAsString();//.ReadInnerXml();
                        var col = GetDataColumn(name, type);
                        dct[col] = GetDataValue(value, type, isNull);
                    }
                }
            }
        }
        string ParseColumnName(string name)
        {
            return name.StartsWith("d:")
                ? name.Substring(2)
                : name;
        }
        Type ParseColumnType(string type)
        {
            if (string.IsNullOrEmpty(type))
            {
                return typeof(string);
            }
            else if (!type.StartsWith("Edm."))
            {
                return null;
            }
            else if (type == "Edm.Binary")
            {
                return typeof(byte[]);
            }
            else
            {
                type = type.Replace("Edm.", "System.");
                return Type.GetType(type);
            }
        }
        DataColumn GetDataColumn(string name, Type type)
        {
            // look for column
            var col = _dt.Columns[name];

            // not found, add now
            if (col == null)
            {
                // create new column
                col = new DataColumn(name, type);
                col.AllowDBNull = true;

                // make sure TableLink columns come after regular properties
                int index = _dt.Columns.Count;
                if (type != typeof(TableLink))
                {
                    for (int i = 0; i < _dt.Columns.Count; i++)
                    {
                        if (_dt.Columns[i].DataType == typeof(TableLink))
                        {
                            index = i;
                            break;
                        }
                    }
                }

                // add the new column
                _dt.Columns.Insert(index, col);
            }
            return col;
        }
        object GetDataValue(string value, Type type, bool isNull)
        {
            if (type == typeof(Guid))
            {
                return new Guid(value);
            }
            if (type == typeof(byte[]))
            {
                return Convert.FromBase64String(value);
            }

            return isNull
                ? DBNull.Value
                : Convert.ChangeType(value, type, CultureInfo.InvariantCulture);
        }
    }

    /// <summary>
    /// Represents a link to a related entity or entity set.
    /// </summary>
    public class TableLink
    {
        string _name, _url, _href, _type;

        public TableLink(string name, string url, string href, string type)
        {
            _name = name;
            _url = url;
            _href = href;
            _type = type;
        }
        public string Name
        {
            get { return _name; }
        }
        public string Url
        {
            get { return _url; }
        }
        public string Href
        {
            get { return _href; }
        }
        public string Type
        {
            get { return _type; }
        }
    }
}
