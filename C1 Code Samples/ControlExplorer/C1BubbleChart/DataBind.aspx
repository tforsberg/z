<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataBind.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.DataBind" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" DataSourceID="AccessDataSource1" Height="475" Width = "756">
<Animation Duration="500" Easing="EaseOutElastic"></Animation>

<Footer Compass="South" Visible="False"></Footer>

<Axis>
	<X>
		<TextStyle Rotation="-45">
		</TextStyle>
	</X>
<Y Visible="False" Compass="West">
<Labels TextAlign="Center"></Labels>

<GridMajor Visible="True"></GridMajor>
</Y>
</Axis>
<DataBindings>
<wijmo:C1BubbleChartBinding XField="CategoryName" XFieldType="String" YField="Sales" YFieldType="Number" Y1Field="CT" />
</DataBindings>
</wijmo:C1BubbleChart>

<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
		DataFile="~/App_Data/C1NWind.mdb" 
		SelectCommand="select CategoryName, sum(ProductSales) as Sales, count(1) as CT from (SELECT DISTINCTROW Categories.CategoryName as CategoryName, Products.ProductName, Sum([Order Details Extended].ExtendedPrice) AS ProductSales
FROM Categories INNER JOIN (Products INNER JOIN (Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID) ON Products.ProductID = [Order Details Extended].ProductID) ON Categories.CategoryID = Products.CategoryID
WHERE (((Orders.OrderDate) Between #1/1/95# And #12/31/95#))
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
ORDER BY Products.ProductName) group by CategoryName;">
	</asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>The <strong>C1BubbleChart </strong>supports binding data from an external data source on the server.</p>
	<p>
		DataBinding is allowed by setting the <b>DataSourceID</b> or <b>DataSource</b> and <b>DataBindings</b>.
		The following properties are used to bind X, Y values to the specified data field:</p>
	<ul>
		<li><strong>DataSourceID </strong>- for specifying the data source which is loacted in the App_Data/C1NWind.mdb</li>
		<li><strong>DataBindings </strong>- for specifying the series bindings</li>
		<li><strong>C1BubbleChartBinding.XField </strong>- for binding X to the specified field name</li>
		<li><strong>C1BubbleChartBinding.XFieldType</strong> - for binding XType to the specified field name</li>
		<li><strong>C1BubbleChartBinding.YField </strong>- for binding Y to the specified field name</li>
		<li><strong>C1BubbleChartBinding.YFieldType </strong>- for binding YType to the specified field name</li>
		<li><strong>C1BubbleChartBinding.Y1Field </strong>- for binding Y1 to the specified field name</li>
	</ul>
	<p>DataBindings is a collection that contains the <strong>C1BubbleChartBinding</strong> instances.  
		<strong>C1BubbleChartBinding </strong>includes the following properties:</p>
	<ul>
		<li><strong>DataMember </strong>- for specifying the name of the list of data if the data source contains more than one list</li>
		<li><strong>HintField </strong>- for binding Hint content to the specified field name</li>
	</ul>
	<p>If the <strong>HintField </strong>property is set, then moving the mouse to a series will show the hint value that has the same index with the series.</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
