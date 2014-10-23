DashboardNG with Custom Directives
----------------------------------------------------------------------------------------
Implements a sales dashboard using effective graphical controls built with Angular.

This sample illustrates how you can use Wijmo widgets to create custom AngularJS 
components tailored for specific types of application.

This sample implements a quarterly sales dashboard using sparklines and bullet charts 
in addition to traditional charts and gauges. The main view was created based on design 
principles described in Stephen Few's book "Information Dashboard Design: The Effective
Visual Communication of Data":

	http://www.amazon.com/Information-Dashboard-Design-Effective-Communication/dp/0596100167

The main screen shows a summary of sales by product. Each row represents a product and
shows a sparkline with quarterly sales, the product name, and a bullet chart that 
compares the current sales with a target value as well as 'good', 'satisfactory', and
'poor' ranges. Products with low sales are highlighted with a red mark.

Placing the mouse over the red mark shows details about the problem.

Clicking on a product name shows product details in the form of a radial
gauge and a line chart. The line chart includes a trend line based on a
linear regression.

At the bottom of the main page there is a link that switches the display to a chart
view of the same information. The chart view allows users to select among several
chart types.

All data in this sample is generated randomly.

This sample includes the following custom directives:

1) dash-popover: Based on the Bootstrap popover element, provides smart-positioning 
to avoid cropping the content when the popover is opened near the window edges.

2) dash-bullet: Based on the wijlineargauge widget, provides simple markup than
the standard wijmo directives.

3) dash-bullet-legend: Uses plain HTML, content matches the dash-bullet styles 
and constants.

4) dash-sparkline: Based on the wijlinechart widget, provides simple markup
that the standard wijmo directives.

5) dash-gauge: Based on the wijradialgauge widget, provides simple markup, 
value indicators, and target value/fill logic.

6) dash-chart: Based on several wijmo chart widgets, provides simple markup,
multi-type charts, and a built-in linear regression trend builder.

The Wijmo-based directives listed above are included mainly to demonstrate how 
you can write your own custom directives. They could be replaced with the standard 
directives shipped with Wijmo.

<product>Wijmo;HTML5</product>