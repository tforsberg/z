<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="GroupArea.aspx.cs" Inherits="ControlExplorer.C1GridView.GroupArea" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1"
        AutoGenerateColumns="false" ShowGroupArea="true" AllowColMoving="true" AllowSorting="true">
        <Columns>
            <wijmo:C1BoundField DataField="ProductName" SortExpression="ProductName" HeaderText="Name" Aggregate="Count">
                <GroupInfo Position="Header" OutlineMode="StartCollapsed" />
            </wijmo:C1BoundField>
            <wijmo:C1BoundField DataField="OrderID" SortExpression="OrderID" HeaderText="OrderID"></wijmo:C1BoundField>
            <wijmo:C1BoundField DataField="Quantity" SortExpression="Quantity" HeaderText="Quantity" Aggregate="Sum"></wijmo:C1BoundField>
            <wijmo:C1BoundField DataField="Total" SortExpression="Total" HeaderText="Totals" Aggregate="Sum"></wijmo:C1BoundField>
        </Columns>
    </wijmo:C1GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 50 Products.ProductName, d.OrderID, d.Quantity, (d.UnitPrice * d.Quantity) as Total FROM Products INNER JOIN (SELECT details.ProductID, details.OrderID, details.UnitPrice, details.Quantity FROM [Order Details] AS details INNER JOIN (SELECT OrderID FROM Orders WHERE Year(OrderDate) = 1994) AS tmp ON details.OrderID = tmp.OrderID) as d ON Products.ProductID = d.ProductID ORDER BY d.ProductID">
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1GridView</strong> supports data grouping against one or more columns.
    </p>

    <p>
        The column will be grouped if the <strong>GroupInfo.Position</strong> property is set to a value other than None.
    </p>
    <p>
        End-user grouping is allowed if the following properties are set to True:
    </p>
    <ul>
        <li><strong>ShowGroupArea</strong> - to show the group area.</li>
        <li><strong>AllowColMoving</strong> - to allow end-users to drag columns.</li>
    </ul>
    
    <p>
        End-users can group data by dragging column headers to the Group Area.
        Set the <strong>AllowSort</strong> property to True and use sorting to make sure that identical data values will be placed within the single group section.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
