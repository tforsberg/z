<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="HeaderIcons.aspx.cs" Inherits="ControlExplorer.C1GridView.HeaderIcons" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false">
		<CallbackSettings Action="Paging" />
		<Columns>
			<wijmo:C1BoundField DataField="OrderID" HeaderText="<span class='ui-icon ui-icon-flag'/>OrderID</span>" />
			<wijmo:C1BoundField DataField="CustomerID" HeaderText="<span class='ui-icon ui-icon-gear'/>CustomerID</span>" />
			<wijmo:C1BoundField DataField="OrderDate" HeaderText="<span class='ui-icon ui-icon-tag'/>OrderDate</span>" />
			<wijmo:C1BoundField DataField="ShipName"  HeaderText="<span class='ui-icon ui-icon-calculator'/>ShipName</span>" />
			<wijmo:C1BoundField DataField="ShipCity"  HeaderText="<span class='ui-icon ui-icon-calendar'/>ShipCity</span>" />
			<wijmo:C1BoundField DataField="ShipCountry"  HeaderText="<span class='ui-icon ui-icon-home'/>ShipCountry</span>" />
		</Columns>
	</wijmo:C1GridView>

	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
		ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 15 * FROM ORDERS">
	</asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This demo shows how to use <b>HeaderText</b> property to show icons in the column headers.
	</p>
</asp:Content>
