<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.C1AutoComplete.DataBinding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1AutoComplete" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1AutoComplete ID="C1AutoComplete1" runat="server" Width="250px"
        DataSourceID="AccessDataSource1">
    </wijmo:C1AutoComplete>
	<asp:AccessDataSource ID="AccessDataSource1" runat="server" 
	DataFile="~/App_Data/C1NWind.mdb" 
	SelectCommand="SELECT ProductID, ProductName FROM Products">
	</asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1AutoComplete</strong> supports data binding. It can bind label, value,
        and category fields.
    </p>
    <p>
        Data binding is allowed if the following properties are set:
    </p>
    <ul>
        <li><strong>DataSourceID </strong>- sets the ID of the data source.</li>
        <li><strong>DataLabelField </strong>-&nbsp; sets the field in the data source from
            which to load label fields.</li>
        <li><strong>DataValueField </strong>-&nbsp; sets the field in the data source from
            which to load value fields.</li>
        <li><strong>DataCategoryField </strong>-&nbsp; sets the field in the data source from
            which to load category fields.</li></ul>
</asp:Content>
