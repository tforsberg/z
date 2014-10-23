ShoppingCartNG with Custom Directives
--------------------------------------------------------------------------------------------
Implements a simple store with a shopping cart built with Angular.

This sample uses Wijmo, AngularJS, and Bootstrap.

The sample has three views: the store, product details, and shopping cart. Users can 
add products to the cart from the store, and they can edit the cart by changing
product quantities. When they are done, they can check out using PayPal or Google 
Wallet payment services.

The application does not require any server support. It does not prompt users for
any personal information. All transaction details handled by PayPal or Google.

Bootstrap is used to provide consistent styles, icons, and a fluid layout that 
adapts itself to desktop and mobile devices.

Wijmo is used to implement custom AngularJS directives written specifically for
this app. The directives illustrate how to create custom controls based on 
Wijmo widgets, with support for two-way data binding and default attribute
values.

For details about AngularJS, visit http://angularjs.org/.

For details about Bootstrap, visit http://twitter.github.io/bootstrap/.

For details about this application, visit
	http://www.codeproject.com/Articles/576246/A-Shopping-Cart-Application-Built-with-AngularJS.

This sample includes the following custom directives:

1) store-nutrient-gauge: Based on the wijlineargauge widget, shows an animated gauge 
with pre-defined ranges that correspond to a nutrient scale (0: poor to 4: rich).

2) store-product-quantity: Based in the wijinputnumber widget, allows users to select
the quantity of a given product that they want to add to the shopping cart.

These directives are included to demonstrate how you can write your own custom directives.
Both could be replaced with the standard directives shipped with Wijmo.

<product>Wijmo;HTML5</product>