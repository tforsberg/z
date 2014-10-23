<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Sorting.aspx.cs" Inherits="ControlExplorer.Grid.Sorting" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView runat="server" ID="demo" DataSourceID="XmlDataSource1" EnableModelValidation="True" ShowHeader="false">
    </asp:GridView>
  
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/Players.xml" XPath="Players/Player[@Nationality='Canada' ]" />
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowSorting="true">
        <Columns>
            <wijmo:C1Field HeaderText="Number" DataType="Number" DataFormatString="n0" SortDirection="Ascending" /> 
            <wijmo:C1Field HeaderText="Nationality" />
            <wijmo:C1Field HeaderText="Player" />
            <wijmo:C1Field HeaderText="Position" />
            <wijmo:C1Field HeaderText="Handedness" />
            <wijmo:C1Field HeaderText="Age" />
            <wijmo:C1Field HeaderText="Acquired" />
            <wijmo:C1Field HeaderText="Birthplace" />
        </Columns>
    </wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows that setting the <b>allowSorting</b> option to true allows you to sort grid
        columns by clicking the column header.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
