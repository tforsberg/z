MVC Stock Portfolio
-------------------------------------------------------------------------------
MVC Stock Portfolio (Basic)
-------------------------------------------------------------------------------
This application is built with MVC3 and requires Visual Studio 2010 SP1 with 
the ASP.NET MVC3 Tools Update to be installed.

This app uses data from Yahoo Finance and blends server-side and client-side 
code to create a great UX. First we make a clean Object Model that represent 
Stocks (Stock.cs) and abstract the calls to the Yahoo Finance API. The Yahoo 
Finance Service uses YQL so we create a better API using JsonResults 
to return strongly-typed Stock objects and history data. It makes client-side
 development much easier to work with JSON. 

After the Model and Controllers are created we create a rich jQuery-powered 
view. The View does not load any data from its ActionResult but instead loads 
all data via JsonResult web services. The JavaScript in this application is 
meant to show best practices in client-side development. The first step is to 
"namespace" our app by creating the  stockApp object in StockApp.js. That is 
our app object that we will use to scope the JavaScript in this View. You will 
see that we add familiar methods like init, loadData, etc to organize the 
application. We also have some events to help organize how the app reacts to 
changes like dateChange and stockChange. 

So in initialization we call JsonResults to load in the stocks we are 
interested in that get bound to the grid. After that we load in history 
data for a single current stock. That data is drawn in two charts that make 
up a zoom chart for exploring history data. We also create a nice time range 
picker using wijmo inputs and calendar that ties to the zoom charts selected 
range.

Lastly we create a mobile version of our application using jQuery Mobile and 
Wijmo. We use a different layout page to make the page mobile-friendly which 
we include jQuery Mobile references in. Then we use similar JavaScript in 
this page to load in data from our JsonResult services and render it in a 
mobile ListView and Wijmo Line Chart. 

If you would like to see what a simplified version of this application 
would look like then take a look at WijMarket. This app is meant to be 
a rich (complex) finished version while WijMarket is meant to be a learning 
tool.
