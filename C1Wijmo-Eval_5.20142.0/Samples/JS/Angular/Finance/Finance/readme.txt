Wijmo Finance
---------------------------
A stock portfolio application written using the MVVM pattern.

The application allows users to select stocks and build portfolios, optionally including 
purchase quantity and price paid for each stock.

The application retrieves financial data from Yahoo Finance and calculates the current 
value and change for each stock. It also creates charts comparing the evolution in stock
value for each company.

The portfolios built are stored locally using the HTML5 localStorage object.

The main Wijmo controls used in this application are:

Chart: Used to show the evolution of the stock values over time. The user may select the
stocks that should be displayed and the period (from 6 months to all data since 2008).

AutoComplete: Used to search for companies to add to the portfolio. The control provides
as-you-type searching with query highlighting. The AutoComplete control is better than
a simple ComboBox in this case because the number of items is large, so the search is 
handled on the server.

InputNumber: Used to enter the number of shares and amount paid for each share. The 
control ensures that values entered are valid and properly formatted. Null values are
allowed, meaning the user is tracking the stock but has not actually purchased it.

In addition to controls, this application uses a CollectionView to hold the portfolio
items. Using a CollectionView provides a standard way to handle sorting and currency.
The application defines an 'app-sorter' directive that allows users to sort the 
portfolio items by name, symbol, value, etc.

For illustration purposes, we implemented two views for the Finance app. One of the
views shows the portfolio items in an HTML table; the other shows them in a FlexGrid.
Both views have similar functionality, and both use the same controller.