<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Aggregates.aspx.cs" Inherits="ControlExplorer.C1GridView.Aggregates" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    </script>

    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    
    <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1"
        AutoGenerateColumns="false">
        <Columns>
            <wijmo:C1BoundField DataField="ProductName" HeaderText="Name" Aggregate="Count">
                <GroupInfo Position="Header" OutlineMode="StartCollapsed" />
            </wijmo:C1BoundField>
            <wijmo:C1BoundField DataField="OrderID" HeaderText="OrderID"></wijmo:C1BoundField>
            <wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" Aggregate="Sum"></wijmo:C1BoundField>
            <wijmo:C1BoundField DataField="Total" HeaderText="Totals" Aggregate="Sum"></wijmo:C1BoundField>
        </Columns>
    </wijmo:C1GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 50 Products.ProductName, d.OrderID, d.Quantity, (d.UnitPrice * d.Quantity) as Total FROM Products INNER JOIN (SELECT details.ProductID, details.OrderID, details.UnitPrice, details.Quantity FROM [Order Details] AS details INNER JOIN (SELECT OrderID FROM Orders WHERE Year(OrderDate) = 1994) AS tmp ON details.OrderID = tmp.OrderID) as d ON Products.ProductID = d.ProductID ORDER BY d.ProductID">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1GridView</strong> supports aggregates calculation against one or more grouped columns (see: GroupArea sample).
    </p>

    <p>
        It is possible to calculate aggregate values for each group of data rows. An aggregate can be calculate for any column with compatible data type if the
        column is preceded by a grouped column. <strong>C1GridView</strong> supports aggregate functions like Sum, Count, Min, Max and other.
   </p>

    <p>
         The following column properties are used in this sample:
    </p>
    <ul>
        <li><strong>GroupInfo.Position</strong> - to group the ProductID column.</li>
        <li><strong>Aggregate</strong> - to specify aggregates for the ProductName, Quantity and Total columns.</li>
    </ul>
</asp:Content>

