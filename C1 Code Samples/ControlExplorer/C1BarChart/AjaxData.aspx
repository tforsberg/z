<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="AjaxData.aspx.cs" Inherits="C1BarChart_AjaxData" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<Y Text="Prices" AutoMin="true" AutoMax="true" Compass="West"></Y>
			<X Text="Products"></X>
		</Axis>
		<Header Text="Top 10 Products by Unit Price - Northwind OData"></Header>
	</wijmo:C1BarChart>
	<script type = "text/javascript">
	  function hintContent() {
	    return this.data.label + '\n ' + this.y + '';
	  }
	  $(document).ready(function () {
	    var netflx = "http://demo.componentone.com/aspnet/Northwind/northwind.svc/Products?$format=json&$top=10&$orderby=Unit_Price%20desc";

	    $.ajax({
	      dataType: "jsonp",
	      url: netflx,
	      jsonp: "$callback",
	      success: callback
	    });
	  });

	  function callback(result) {
	    // unwrap result
	    var names = [];
	    var prices = [];

	    var products = result["d"];

	    for (var i = 0; i < products.length; i++) {

	      names.push(products[i].Product_Name);
	      prices.push(products[i].Unit_Price);
	    }

	    $("#<%= C1BarChart1.ClientID %>").c1barchart("option", "seriesList", [
					{
					  label: "Prices",
					  legendEntry: true,
					  data: {
					    x: names,
					    y: prices
					  }
					}
			]);
    }
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates how to create a chart using data from an external data source from the client side. In this example, we are using data from the Netflix OData feed.
	</p>
	<ul>
		<li><strong>Data URL:</strong> <a href="http://demo.componentone.com/aspnet/Northwind/northwind.svc/Products?$format=json&$top=10&$orderby=Unit_Price%20desc">http://demo.componentone.com/aspnet/Northwind/northwind.svc/Products?$format=json&$top=10&$orderby=Unit_Price%20desc</a> </li>
		
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

