<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Sorting.aspx.cs" Inherits="ControlExplorer.C1GridView.Sorting" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True" style="top: 0px; left: 0px" AllowPaging="true" PageSize="15">
		<CallbackSettings Action="All" />		
		<Columns>
			<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" DataFormatString="c">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" DataFormatString="n0">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" DataFormatString="p">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" DataFormatString="MMM-dd-yyyy">
				<ItemStyle HorizontalAlign="Center" />
			</wijmo:C1BoundField>
			<wijmo:C1CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued">
			</wijmo:C1CheckBoxField>
		</Columns>
	</wijmo:C1GridView>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT TOP 40 Products.ProductName, Products.Discontinued, Orders.OrderDate, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount FROM (([Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Products ON [Order Details].ProductID = Products.ProductID) ORDER BY Orders.OrderDate DESC"></asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		<strong>C1GridView</strong> supports sorting.
	</p>

	<p>
		Sorting is allowed if the <strong>AllowSorting</strong> property is set to True.
		End-user sorting is allowed if the <strong>SortExpression</strong> property of the column is set to non-empty value.
	</p>

	<p>The following properties are used in this sample:</p>
	<ul>
		<li><strong>AllowSorting</strong> - to enable sorting.</li>
	</ul>

	<p>The following column properties are used in this sample:</p>
	<ul>
		<li><strong>SortExpression</strong> - to specify a sort expression that will be used by the control to sort data.</li>
		<li><strong>SortDirection</strong> - to automatically sort the <strong>Total</strong> column in descending order.</li>
	</ul>

	<p>Click a column header to sort by that column.</p>
</asp:Content>
