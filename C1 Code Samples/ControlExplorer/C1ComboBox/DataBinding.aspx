<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.C1ComboBox.DataBinding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ComboBox ID="C1ComboBox1" runat="server" Width="160px" 
		DataSourceID="AccessDataSource1" DataTextField="UnitPrice" 
		DataTextFormatString="{0:C}" DataValueField="OrderID">
	</wijmo:C1ComboBox>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/C1NWind.mdb"
		SelectCommand="SELECT top 100 [UnitPrice], [OrderID] FROM [Order Details]"></asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
		<p>The <strong>C1ComboBox </strong>control supports data binding and can bind both text and value fields.</p>

		<p>Data binding is allowed if the following properties are set: </p>
		<ul>
		<li><strong>DataSourceID </strong>- sets the ID of the data source.</li>
		<li><strong>DataTextField </strong>-&nbsp; sets the field in the data source from 
			which to load text values.</li>
		<li><strong>DataValueField </strong>-&nbsp; sets the field in the data source from which to load item values.</li>
		</ul>
		<p>When the "Text" and "Value" are bound, the binding values will fill the drop-down list of 
			<strong>C1ComboBox</strong>.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
