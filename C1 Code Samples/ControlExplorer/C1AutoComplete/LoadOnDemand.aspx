<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="LoadOnDemand.aspx.cs" Inherits="ControlExplorer.C1AutoComplete.LoadOnDemand" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1AutoComplete"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1AutoComplete ID="C1AutoComplete1" runat="server" Width="250px"
        LoadOnDemand="true" DataSourceID="SqlDataSource1">
    </wijmo:C1AutoComplete>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT ProductID, ProductName FROM Products">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1AutoComplete </strong>supports retrieving data (items) dynamically. Child
        data items are loaded using AJAX when you type into the field. To enable loading
        data on demand set the LoadOnDemand property to true.</p>
</asp:Content>
