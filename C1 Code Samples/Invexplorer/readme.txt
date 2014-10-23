InvexplorerNG with Custom Directives
--------------------------------------------------------------------------------------------
Implements a stock browser application similar to Google Finance built with Angular.

This sample uses Wijmo, jQueryUI, and the AngularJS app framework.

The sample follows the MVVM pattern. The ViewModel contains a Portfolio class with a
list of items which correspond to stocks. Each item contains historical information 
about the stock as well as quantity and purchase price information.

This data allows the application to show the gain realized for each item as well as a 
chart that allows users to compare the performance of each stock.

Users can add or remove items from the portfolio using a jQueryUI auto-search control.
Items in the portfolio can be charted using a Wijmo line chart control.

The portfolio information is persisted to local storage using the HTML5 localStorage
object, which is supported by all modern browsers.

The application uses AngularJS directives to package the Wijmo line chart and the
jQueryUI auto-complete widgets (see the invxDctv.js file).

For details about Wijmo, visit http://wijmo.com/.

For details about jQueryUI, visit http://jqueryui.com/.

For details about AngularJS, visit http://angularjs.org/.

This sample includes the following custom directives:

1) invx-autocomplete: Based on the jQueryUI auto-complete widget, provides asynchronous 
loading of the auto-complete options, smart fragment-based search, and HTML fragment 
highlighting in the drop-down.

2) invx-chart: Based on the wijlinechart widget, provides simple markup.

These directives are included to demonstrate how you can write your own custom directives.
Both could be replaced with the standard directives shipped with Wijmo.

** NOTE: The application retrieves stock information using Yahoo Finance services. These
services are not free and cannot be used in commercial applications without permission
from Yahoo.

<product>Wijmo;HTML5</product>