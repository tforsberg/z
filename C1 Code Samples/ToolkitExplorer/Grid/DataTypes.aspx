<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DataTypes.aspx.cs" Inherits="ControlExplorer.Grid.DataTypes" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table runat="server" ID="demo1"></asp:Table>
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo1" AllowSorting="true">
        <Columns>
            <wijmo:C1Field />
            <wijmo:C1Field DataType="Currency"/>
            <wijmo:C1Field DataType="Number" />
            <wijmo:C1Field DataType="Number" DataFormatString="p0" />
            <wijmo:C1Field DataType="Boolean" />
        </Columns>
    </wijmo:C1GridExtender>
    
    <h4>Original Data</h4>
    <asp:GridView runat="server" id="demo2" CssClass="ui-widget-content" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="ProductID" HeaderText="ProductID" />
            <asp:BoundField DataField="UnitPrice" HeaderText="UnitPrice" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            <asp:BoundField DataField="Discount" HeaderText="Discount" />
            <asp:BoundField DataField="Discontinued" HeaderText="Discontinued" />
        </Columns>
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        In this sample wijgrid shows the same data but column data types are explicitly specified:
    </p>
    <ul>
        <li>ProductID: <b>dataType</b> = &quot;string&quot;</li>
        <li>UnitPrice: <b>dataType</b> = &quot;currency&quot;</li>
        <li>Quantity: <b>dataType</b> = &quot;number&quot;</li>
        <li>Discount: <b>dataType</b> = &quot;number&quot;, <b>dataFormatString</b> = &quot;p0&quot;</li>
        <li>Discontinued: <b>dataType</b> = &quot;boolean&quot;</li>
    </ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>