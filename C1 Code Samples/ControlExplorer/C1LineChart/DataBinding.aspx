<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="DataBinding.aspx.cs" Inherits="C1LineChart_DataBinding" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.y;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1LineChart ID="C1LineChart1" runat="server" DataSourceID="AccessDataSource1" ShowChartLabels="false" Height="475" Width = "756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<X>
				<Labels>
					<AxisLabelStyle  FontSize="11pt" Rotation="-45">
						<Fill Color="#7f7f7f"></Fill>
					</AxisLabelStyle>
				</Labels>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7f7f7f" />
				</TickMajor>
			</X>
			<Y Visible="False" Compass="West">
				<Labels TextAlign="Center">
					<AxisLabelStyle FontSize="11pt">
						<Fill Color="#7f7f7f"></Fill>
					</AxisLabelStyle>
				</Labels>
				<GridMajor Visible="True">
					<GridStyle Stroke="#353539" StrokeDashArray="- " />
				</GridMajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7f7f7f" />
				</TickMajor>
				<TickMinor Position="Outside">
					<TickStyle Stroke="#7f7f7f" />
				</TickMinor>
			</Y>
		</Axis>
		<Header Text="Sales"></Header>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="8" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#00a6dd" StrokeWidth="5" Opacity="0.8" />
		</SeriesStyles>
		<DataBindings>
			<wijmo:C1ChartBinding XField="CategoryName" XFieldType="String" YField="Sales" YFieldType="Number" />
		</DataBindings>
	</wijmo:C1LineChart>
	
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="select CategoryName, sum(ProductSales) as Sales from (SELECT DISTINCTROW Categories.CategoryName as CategoryName, Products.ProductName, Sum([Order Details Extended].ExtendedPrice) AS ProductSales
FROM Categories INNER JOIN (Products INNER JOIN (Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID) ON Products.ProductID = [Order Details Extended].ProductID) ON Categories.CategoryID = Products.CategoryID
WHERE (((Orders.OrderDate) Between #1/1/95# And #12/31/95#))
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
ORDER BY Products.ProductName) group by CategoryName;">
	</asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>The <strong>C1LineChart</strong> supports binding data from an external data source on the server.</p><br/>
	<p>
		DataBinding is allowed by setting the <b>DataSourceID</b> or <b>DataSource</b> and <b>DataBindings</b>.
		The following properties are used to bind X, Y values to the specified data field.</p>
	<ul>
		<li><strong>DataSourceID</strong> - for specifying the data source which is located in the App_Data/C1NWind.mdb</li>
		<li><strong>DataBindings</strong> - for specifying the series bindings</li>
		<li><strong>C1ChartBinding.XField</strong> - for binding X to the specified field name</li>
		<li><strong>C1ChartBinding.XFieldType</strong> - for binding XType to the specified field name</li>
		<li><strong>C1ChartBinding.YField</strong> - for binding Y to the specified field name</li>
		<li><strong>C1ChartBinding.YFieldType</strong> - for binding YType to the specified field name</li>
	</ul>
	<p>DataBindings is a collection which contains the <strong>C1ChartBinding</strong> instances.  <strong>C1ChartBinding</strong> has the following properties.</p>
	<ul>
		<li><strong>DataMember</strong> -  for specifying the name of the list of data if the data source contains more than one list</li>
		<li><strong>HintField</strong> -  for binding Hint content to the specified field name</li>
	</ul>
	<p>If the <strong>HintField</strong> property is set, then moving the mouse to a series will show the hint value which has the same index as the series.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

