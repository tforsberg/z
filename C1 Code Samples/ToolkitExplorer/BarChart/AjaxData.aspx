<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="AjaxData.aspx.cs" Inherits="BarChart_AjaxData" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
		function pageLoad() {
			var netflx = "http://odata.netflix.com/Catalog/Genres('Horror Movies')/Titles?$inlinecount=allpages&$callback=callback&$top=10&$format=json&$orderby=AverageRating desc";

			$("#<%= barchart.ClientID %>").wijbarchart("option", "hint", { content: hintContent });
			$.ajax({
				dataType: "jsonp",
				url: netflx,
				jsonpCallback: "callback",
				success: callback
			});
		}
		
		function callback(result) {
			// unwrap result
			var names = [];
			var ratings = [];

			var movies = result["d"]["results"];

			for (var i = 0; i < movies.length; i++) {

				names.push(movies[i].Name);
				ratings.push(movies[i].AverageRating);
			}

			$("#<%= barchart.ClientID %>").wijbarchart("option", "seriesList", [
					{
						label: "Horror",
						legendEntry: true,
						data: {
							x: names,
							y: ratings
						}
					}
				]);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:Panel ID="barchart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1BarChartExtender runat = "server" ID="BarChartExtender1"
		TargetControlID="barchart">
		<Axis>
			<Y Text="Average Rating" Min="0" Max="5" AutoMin="false" AutoMax="false" Compass="West"></Y>
			<X Text=""></X>
		</Axis>
		<Header Text="Top 10 Movies by Genre - Netflix OData"></Header>
	</wijmo:C1BarChartExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates how to create a chart using data from an external data source. In this example, we are using data from the Netflix OData feed.
	</p>
	<ul>
		<li>Data URL: <a href="http://odata.netflix.com/Catalog/Genres('Horror Movies')/Titles?$inlinecount=allpages&$callback=callback&$top=10&$format=json&$orderby=AverageRating desc">http://odata.netflix.com/Catalog/Genres('Horror Movies')/Titles?$inlinecount=allpages&$callback=callback&$top=10&$format=json&$orderby=AverageRating desc</a> </li>
		<li>API Documentation: <a href="http://developer.netflix.com/docs/oData_Catalog">http://developer.netflix.com/docs/oData_Catalog</a> </li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
