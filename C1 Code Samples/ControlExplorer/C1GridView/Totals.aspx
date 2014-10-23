<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Totals.aspx.cs" Inherits="ControlExplorer.C1GridView.Totals" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView runat="server" ID="C1GridView1" AutogenerateColumns="False" DataSourceID="SqlDataSource1" AllowColMoving="True" ShowFooter="True">
				<Columns>
					<wijmo:C1BoundField DataField="ShipCountry" HeaderText="ShipCountry" SortExpression="ShipCountry" Aggregate="Count" FooterText="Count: <b>{0}</b>">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice" Aggregate="Average" FooterText="Avg: <b>{0}</b>">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" Aggregate="Sum" FooterText="Sum: <b>{0}</b>">
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="Discount" HeaderText="Discount" SortExpression="Discount" Aggregate="Max" FooterText="Max: <b>{0}</b>">
					</wijmo:C1BoundField>
					<wijmo:C1CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued">
					</wijmo:C1CheckBoxField>
					<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate">
					</wijmo:C1BoundField>
				</Columns>
			</wijmo:C1GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" SelectCommand="SELECT TOP 15 Orders.ShipCountry, Orders.OrderDate, [Order Details].Quantity, [Order Details].UnitPrice, [Order Details].Discount, Products.ProductName, Products.Discontinued FROM ((Orders INNER JOIN [Order Details] ON Orders.OrderID = [Order Details].OrderID) INNER JOIN Products ON [Order Details].ProductID = Products.ProductID)"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	 <p>
                This sample shows how to use the <b>Aggregate</b>, <b>ShowFooter</b>, and 
                <b>FooterText</b> properties to calculate totals for specific columns.
            </p>
</asp:Content>
