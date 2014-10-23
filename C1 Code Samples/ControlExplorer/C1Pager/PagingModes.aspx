<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="PagingModes.aspx.cs" Inherits="ControlExplorer.C1Pager.Modes" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Pager" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h6>NextPrevious</h6>
    <wijmo:C1Pager runat="server" ID="C1PagerNextPrevious" PageCount="150" PageIndex="40" Mode="NextPrevious" />
    <wijmo:C1Pager runat="server" ID="C1PagerNextPrevious2" PageCount="150" PageIndex="40" Mode="NextPrevious"
        FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" />
    <wijmo:C1Pager runat="server" ID="C1PagerNextPrevious3" PageCount="150" PageIndex="40" Mode="NextPrevious"
        FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" FirstPageText="<<"
        PreviousPageText="<" NextPageText=">" LastPageText=">>" />

    <h6>NextPreviousFirstLast</h6>
    <wijmo:C1Pager runat="server" ID="C1PagerNextPreviousFirstLast" PageCount="150" PageIndex="40" Mode="NextPreviousFirstLast" />
    <wijmo:C1Pager runat="server" ID="C1PagerrNextPreviousFirstLast2" PageCount="150" PageIndex="40" Mode="NextPreviousFirstLast"
        FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" />
    <wijmo:C1Pager runat="server" ID="C1PagerNextPreviousFirstLast3" PageCount="150" PageIndex="40" Mode="NextPreviousFirstLast"
        FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" FirstPageText="<<" PreviousPageText="<"
        NextPageText=">" LastPageText=">>" />

    <h6>Numeric</h6>
    <wijmo:C1Pager runat="server" ID="C1PagerNumeric" PageCount="150" PageIndex="40" Mode="Numeric" />

    <h6>NumericFirstLast</h6>
    <wijmo:C1Pager runat="server" ID="C1PagerNumericFirstLast" PageCount="150" PageIndex="40" Mode="NumericFirstLast" />
    <wijmo:C1Pager runat="server" ID="C1PagerNumericFirstLast2" PageCount="150" PageIndex="40" Mode="NumericFirstLast"
        FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" />
    <wijmo:C1Pager runat="server" ID="C1PagerNumericFirstLast3" PageCount="150" PageIndex="40" Mode="NumericFirstLast"
        FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" FirstPageText="<<" PreviousPageText="<"
        NextPageText=">" LastPageText=">>" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
       The Paging Modes sample illustrates the different ways that the <strong>C1Pager
        </strong>control can be configured by
       setting the <b>Mode</b> property.
        The Mode property has four possible settings: <span>NextPreviousFirstLast</span>, 
        <span class="style1">Numeric</span>, <span>Previous</span>, and 
        <span class="style1">NextPrevious.</span></p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
