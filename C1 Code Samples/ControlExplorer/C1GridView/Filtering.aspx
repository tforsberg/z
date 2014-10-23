<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Filtering.aspx.cs" Inherits="ControlExplorer.C1GridView.Filtering" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .selectedRow > td
        {
            font-weight: bold !important;
        }
    </style>
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
          
                        <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="false"
                            DataKeyNames="CustomerID" AutoGenerateSelectButton="true" SelectedIndex="0" ShowFilter="true" ClientSelectionMode="None"
                            OnFiltering="Filter" OnDataBound="C1GridView1_DataBound">
                            <Columns>
                                <wijmo:C1BoundField DataField="CompanyName" HeaderText="Company" FilterOperator="Contains" />
                                <wijmo:C1BoundField DataField="City" HeaderText="City" FilterOperator="Contains"/>
                                <wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" FilterOperator="Equals" />
                            </Columns>
                            <SelectedRowStyle CssClass="selectedRow" BackColor="Orange" />
                        </wijmo:C1GridView>
                   
        </ContentTemplate>
    </asp:UpdatePanel>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 10 Customers.CustomerID, CompanyName, City, Count(*) as Quantity FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID GROUP BY Customers.CustomerID, CompanyName, City">
    </asp:SqlDataSource>
    
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1GridView</strong> supports an intuitive user interface for filtering the rows in the grid.
    </p>

    <p>
        The column will be filtered if the following column properties are set:
    </p>
    <ul>
      <li><strong>FilterOperator</strong> - the type of filtering to be performed.</li>
      <li><strong>FilterValue</strong> - the value which is used to filter the grid.</li>
    </ul>

    <p>
        End-user filtering is allowed if the <strong>ShowFilter</strong> property is set to True.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
