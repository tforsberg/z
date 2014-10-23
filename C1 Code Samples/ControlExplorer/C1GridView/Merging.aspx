<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Merging.aspx.cs" Inherits="ControlExplorer.C1GridView.RowMerge" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false">
		<Columns>
			<wijmo:C1BoundField DataField="ProductName" SortExpression="ProductName" HeaderText="Name" RowMerge="Free" />
			<wijmo:C1BoundField DataField="OrderID" SortExpression="OrderID" HeaderText="OrderID" />
			<wijmo:C1BoundField DataField="Quantity" SortExpression="Quantity" HeaderText="Quantity" />
			<wijmo:C1BoundField DataField="Total" SortExpression="Total" HeaderText="Totals" />
		</Columns>
	</wijmo:C1GridView>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
		ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 15 Products.ProductName, d.OrderID, d.Quantity, (d.UnitPrice * d.Quantity) as Total FROM Products INNER JOIN (SELECT details.ProductID, details.OrderID, details.UnitPrice, details.Quantity FROM [Order Details] AS details INNER JOIN (SELECT OrderID FROM Orders WHERE Year(OrderDate) = 1994) AS tmp ON details.OrderID = tmp.OrderID) as d ON Products.ProductID = d.ProductID ORDER BY d.ProductID">
	</asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		The <strong>C1GridView</strong> supports row merging. Identical values of the particular column can be spanned within a single cell.
	</p>

	<p>
		Row merging is allowed if the <strong>RowMerge</strong> property of the column is set to value other than None.
	</p>

	<p>The following column properties are used in this sample:</p>
	<p>
		<strong>RowMerge</strong> - to merge identical values of the <strong>ProductName</strong> column.
	</p>
</asp:Content>
