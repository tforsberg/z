<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ColumnResizing.aspx.cs" Inherits="ControlExplorer.C1GridView.ColumnResizing" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView runat="server" ID="C1GridView1" AllowPaging="true" PageSize="15" AutogenerateColumns="False" DataSourceID="SqlDataSource1" AllowColSizing="true">
		<CallbackSettings Action="Paging" />
		<Columns>
			<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" DataFormatString="c" SortExpression="UnitPrice">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="Quantity" DataFormatString="n0" HeaderText="Quantity" SortExpression="Quantity">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="Discount" HeaderText="Discount" DataFormatString="p" SortExpression="Discount">
			</wijmo:C1BoundField>
			
			<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" DataFormatString="MMM-dd-yyyy" SortExpression="OrderDate">
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
	The C1GridView allows users to resize columns when the <b>AllowColSizing</b> property is set to true. The column width can be changed by dragging the right border of its title.</p>
</asp:Content>
