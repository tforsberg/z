PortingFromSL
------------------------------------------------------------------------
Demonstrates how to port a Silverlight application to HTML5 and Wijmo.

This is an HTML5 version of a classic Microsoft Silverlight sample available on
MSDN and on-line:

- http://samples.msdn.microsoft.com/Silverlight/SampleBrowser/#/?sref=DataServicesQuickStart
- http://samples.msdn.microsoft.com/Silverlight/SampleBrowser/ClientBin/DataServicesQuickStart.html

The original sample was selected because it was written by Microsoft and demonstrates 
the basics of many typical Silverlight LOB applications, including:

- loading data with Silverlight Data Services
- populating CollectionView objects
- handling selection and hierarchical data (customers -> orders -> details)
- binding to controls (ComboBox, InputNumber, InputDate, FlexGrid)

The HTML5 version uses Bootstrap for CSS and layout, AngularJS for MVVM,
and Wijmo for the CollectionView and all controls.

The HTML5 version of the sample improves the original sample in the following
aspects:

- runs on desktop as well as mobile devices
- has an adaptive layout that renders well on small screens
- uses pure MVVM (the original sample used event handlers)
- is about 15% the size of the original sample (1.1meg vs about 160k)

