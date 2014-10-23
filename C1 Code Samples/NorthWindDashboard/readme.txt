NorthWindDashboard
------------------------------------------------------------------------------------
Sample application designed to illustrate MVVM principles.

The application Model uses NorthWind data. It generates random sales data since
the actual Northwind database only has three years of data.

The application ViewModel uses the raw Model data to generate the following three
collections:

- Quarters: Used to select the current Quarter to analyze. The current item
is displayed in the application title, above VCR-style buttons used to navigate
the quarters.

- SalesByCustomer: Sales for the current quarter, aggregated by customer. This
collection is bound to a Map that shows the location and amount of sales. As
the user selects different quarters, the map is updated showing geographical
sales patterns.

- SalesByCategory: Sales for the current quarter, aggregated by product category.

The application View uses regular and custom controls bound to the ViewModel, and
has zero code-behind.
