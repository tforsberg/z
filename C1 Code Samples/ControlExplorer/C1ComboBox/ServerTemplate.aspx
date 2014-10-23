<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ServerTemplate.aspx.cs" Inherits="ControlExplorer.C1ComboBox.ServerTemplate" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox runat="server" ID="ComboBox1" DataSourceID="SqlDataSource1" Width="500px" DataTextField="CategoryName" DataValueField="CategoryID">
		<ItemsTemplate>
			<label>CatalogName:<%# DataBinder.Eval(Container.DataItem, "CategoryName")%></label>
		</ItemsTemplate>
		
	</wijmo:C1ComboBox>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb" SelectCommand="SELECT [CategoryID], [CategoryName], [Description] FROM [Categories]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>This demo use <b>ItemsTemplate</b> to customize the combobox items.</p>
</asp:Content>
