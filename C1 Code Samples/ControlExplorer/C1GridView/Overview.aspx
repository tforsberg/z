<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1GridView.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1"
        AutoGenerateColumns="false" ShowRowHeader="true" AllowSorting="true" CallbackSettings-Action="All">
        <Columns>
            <wijmo:C1BoundField HeaderText="ID" DataField="EmployeeID" SortExpression="EmployeeID" />
            <wijmo:C1BoundField HeaderText="Last name" DataField="LastName" SortExpression="LastName" />
            <wijmo:C1BoundField HeaderText="First name" DataField="FirstName" SortExpression="FirstName" />
            <wijmo:C1BoundField HeaderText="Date of birth" DataField="BirthDate" DataFormatString="d" SortExpression="BirthDate" />
        </Columns>
    </wijmo:C1GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1Nwind.mdb;Persist Security Info=True" ProviderName="System.Data.OleDb"
        SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [BirthDate] FROM [Employees]">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
  <p>
    The <strong>C1GridView</strong> displays the values of a data source in a table where each column represents a field and each row represents a record.
    This sample demonstrates a simple sortable grid.
  </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
