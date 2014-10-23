<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ColumnResizing.aspx.cs" Inherits="ControlExplorer.Grid.ColumnResizing" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="False" />

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/C1NWind.mdb" 
        SelectCommand="SELECT TOP 10 [EmployeeID], [LastName], [FirstName], [Title] FROM [Employees]">
    </asp:AccessDataSource>
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowColSizing="true">
        <Columns>
            <wijmo:C1Field HeaderText="ID" />
            <wijmo:C1Field HeaderText="Last Name" />
            <wijmo:C1Field HeaderText="First Name" />
            <wijmo:C1Field HeaderText="Title" />
        </Columns>
    </wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
    wijgrid allows columns resizing when the <b>allowColSizing</b> option is set to true.
    The column width can be changed by dragging the right border of its title.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
