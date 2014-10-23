GeoDashboardNG with Custom Directives
---------------------------------------------------
An interactive geographic dashboard for analyzing demographic data built with Angular.

This is the AngularJS version of the sample written to demonstrate MVVM
patterns in Javascript/HTML5 and in Silverlight (we also have a version
that uses KnockoutJS).

The sample creates a ViewModel that has an Extent property and several
information sources. Changing the Extent causes the ViewModel to update 
the information using ArcGIS online.

The information is displayed in tiles bound to the ViewModel. Clicking
a tile will display a corresponding layer on the map.

The sample allows you to search for locations by name (using Google's
geocoding services), or to go to your current location (using
HTML5 location services available in most modern browsers).

This AngularJS version of the sample is especially interesting because
it uses custom directives that wrap the Esri map and several Wijmo 
widgets. This simplifies the markup dramatically and makes the 
components re-usable within the application and across applications.

The sample also shows how you can use filters to perform tasks such
as converting coordinates from (x,y) to (longitude/latitude) notation.
This allows the app to display coordinates as [40°27'44"N, 80°1'24"W] 
instead of [-80.02, 40.46].

<product>Wijmo;HTML5</product>