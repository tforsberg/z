<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="DataBinding.aspx.cs" Inherits="C1PieChart_DataBinding" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type="text/javascript">
		function hintContent() {
		    return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
		<wijmo:C1PieChart ID="C1PieChart1" runat="server" Radius="140" DataSourceID="AccessDataSource1" Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
			<Hint>
				<Content Function="hintContent" />
			</Hint>
			<Header Text="Steam - Mac Hardware">
			</Header>
			<SeriesStyles>
				<wijmo:ChartStyle StrokeWidth="1.5" Stroke="#AFE500">
					<Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#C3FF00" ColorEnd="#AFE500"></Fill>
				</wijmo:ChartStyle>
				<wijmo:ChartStyle StrokeWidth="1.5" Stroke="#7FC73C">
					<Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#8EDE43" ColorEnd="#7FC73C"></Fill>
				</wijmo:ChartStyle>
				<wijmo:ChartStyle StrokeWidth="1.5" Stroke="#5F9996">
					<Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#6AABA7" ColorEnd="#5F9996"></Fill>
				</wijmo:ChartStyle>
				<wijmo:ChartStyle StrokeWidth="1.5" Stroke="#3E5F77">
					<Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#466A85" ColorEnd="#3E5F77"></Fill>
				</wijmo:ChartStyle>
				<wijmo:ChartStyle StrokeWidth="1.5" Stroke="#959595">
					<Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#A6A6A6" ColorEnd="#959595"></Fill>
				</wijmo:ChartStyle>
			</SeriesStyles>
			<Footer Compass="South" Visible="False">
			</Footer>
			<DataBindings>
				<wijmo:C1PieChartBinding DataField="Sales" LabelField="CategoryName"  />
			</DataBindings>
		</wijmo:C1PieChart>
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
	<p>The <strong>C1PieChart </strong>supports binding data from an external data source on the server.</p><br/>
	<p>
		Data binding is allowed by setting the <b>DataSourceID</b> or <b>DataSource</b> and <b>DataBindings</b>.
		The following properties are used to bind <strong>Data </strong>and <strong>Label</strong> 
		values to the specified data field:</p>
	<ul>
		<li><strong>DataSourceID</strong> - for specifying the data source which is located in the App_Data/C1NWind.mdb.</li>
		<li><strong>DataBindings </strong>- for specifying the series bindings.</li>
		<li><strong>C1PieChartBinding.DataField</strong> - for binding X to the specified field name.</li>
		<li><strong>C1PieChartBinding.LabelField </strong>- for binding XType to the specified field name.</li>
	</ul>
	<p><strong>DataBindings</strong> is a collection which contains the <strong>C1PieChartBinding</strong> instances.  
		<strong>C1PieChartBinding</strong> has another following properties.</p>
	<ul>
		<li><strong>DataMember </strong>- for specifying the name of the list of data if the data source contains more than one list.</li>
		<li><strong>HintField </strong>- for binding Hint content to the specified field name.</li>
		<li><strong>OffsetField </strong>- for binding offset to the specified field name.</li>
	</ul>
	<p>If the<strong> HintField </strong>property is set, then moving the mouse to a series will show the hint value which has the same index with the series.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

