ODataX
------------------------------------------------------------------------------
Shows how to use C1Data to implement a browser for OData sources.

This sample is similar to the Silverlight OData Explorer application that you 
can see here: http://www.silverlight.net/content/samples/odataexplorer/default.html.
It allows users to select OData sources and to browse the data in the tables
each source exposes.

The sample follows the MVVM pattern. It contains a list of DataSource objects that
represent OData sources. Each source contains a list of DataTable objects that are
implemented using the DataTable class in C1Data. The DataTable object is responsible
for building the ICollectionView objects that allow tables to be used in bindings.

Interesting points in this implementation include:

* Use of the C1Data class to create binding sources with schemas defined dynamically
at runtime. (Most data sources rely on schemas/models created at design time.)

* A generic BaseObject class that implements INotifyPropertyChanged and IEditableObject.
The base implementation allows properties to be implemented in a concise way, and 
the IEditableObject is useful for canceling edits to ViewModel objects.

* A generic CollectionListView class that implements IList and exposes an ICollectionView
property. This is more concise that using ObservableCollection and CollectionViewSource
classes to expose each collection in the ViewModel.

* A generic ModalDialog class used to edit ViewModel objects without resorting to Popup 
objects.
