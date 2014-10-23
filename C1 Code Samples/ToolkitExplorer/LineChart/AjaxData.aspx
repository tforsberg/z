<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="AjaxData.aspx.cs" Inherits="LineChart_AjaxData" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<script type="text/javascript">
		function hintContent() {
			return this.x + '\n ' + this.y + '';
		}

		function pageLoad() {
			var netflx = "http://odata.netflix.com/Catalog/Genres('Horror Movies')/Titles?$inlinecount=allpages&$callback=callback&$top=10&$format=json&$orderby=AverageRating desc";

			$("#<%= linechart.ClientID %>").wijlinechart("option", "hint", { content: hintContent });
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

			$("#<%= linechart.ClientID %>").wijlinechart("option", "seriesList", [
					{
						label: "Horror",
						legendEntry: true,
						fitType: "spline",
						data: {
							x: names,
							y: ratings
						},
						markers: {
							visible: true,
							type: "circle"
						}
					}
				]);
		}
	</script>
	<asp:Panel ID="linechart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1LineChartExtender runat = "server" ID="LineChartExtender1" TargetControlID="linechart">
		<Footer Compass="South" Visible="False"></Footer>
		<Legend>
			<Size Width="30" Height="3"></Size>
		</Legend>
		<Axis>
			<Y Text="Average Rating" Min="0" Max="5" AutoMin="false" AutoMax="false" Compass="West" />
			<X>
				<Labels>
					<AxisLabelStyle Rotation="-45"></AxisLabelStyle>
				</Labels>
			</X> 
		</Axis>
		<Header Text="Top 10 Movies by Genre - Netflix OData" />
	</wijmo:C1LineChartExtender>
	
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