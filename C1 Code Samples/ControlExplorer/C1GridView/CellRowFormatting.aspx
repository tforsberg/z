<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CellRowFormatting.aspx.cs" Inherits="ControlExplorer.C1GridView.CellRowFormatting" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView runat="server" ID="C1GridView1" AutogenerateColumns="False" AllowPaging="true" PageSize="15" DataSourceID="SqlDataSource1" AllowColSizing="True">
		<CallbackSettings Action="Paging" />
		<Columns>
			<wijmo:C1BoundField DataField="ShipCountry" HeaderText="Country" SortExpression="Country">
			</wijmo:C1BoundField>
			<wijmo:C1TemplateField HeaderText="Flag">
				<ItemStyle HorizontalAlign="Center" />
				<ItemTemplate>
					<img src='<%# GetCountryImage(Eval("ShipCountry").ToString()) %>' alt=<%# Eval("ShipCountry") %> />
				</ItemTemplate>
			</wijmo:C1TemplateField>
			<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" DataFormatString="c">
			</wijmo:C1BoundField>
			<wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" DataFormatString="n0">
			</wijmo:C1BoundField>
			<wijmo:C1TemplateField HeaderText="Discount">
				<ItemTemplate>
					<span style='color:<%# double.Parse(Eval("Discount").ToString())>=0.1?"red":"#000" %>;'>
						<%# Eval("Discount","{0:p}") %>
					</span>
				</ItemTemplate>
				<ItemStyle HorizontalAlign="Center" />
			</wijmo:C1TemplateField>
			<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" DataFormatString="MMM-dd-yyyy">
				<ItemStyle HorizontalAlign="Center" />
			</wijmo:C1BoundField>
			<wijmo:C1CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued">
			</wijmo:C1CheckBoxField>
		</Columns>
	</wijmo:C1GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT TOP 20 Products.ProductName, Products.Discontinued, Orders.OrderDate, [Order Details].UnitPrice, [Order Details].Quantity, [Order Details].Discount, Orders.ShipCountry FROM (([Order Details] INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID) INNER JOIN Products ON [Order Details].ProductID = Products.ProductID) ORDER BY Orders.OrderDate DESC"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This demo using <b>ItemTemplate</b> property to customize the column layout.</p>
</asp:Content>
