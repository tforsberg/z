<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Modes.aspx.cs" Inherits="Pager_Modes" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Pager" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h6>
        nextPrevious</h6>
    <wijmo:C1PagerExtender runat="server" ID="pagerNextPreviousExtender" TargetControlID="pagerNextPrevious"
        PageCount="150" PageIndex="40" Mode="NextPrevious" />
    <wijmo:C1PagerExtender runat="server" ID="pagerNextPrevious2Extender" TargetControlID="pagerNextPrevious2"
         PageCount="150" PageIndex="40" Mode="NextPrevious" FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" />
    <wijmo:C1PagerExtender runat="server" ID="pagerNextPrevious3Extender" TargetControlID="pagerNextPrevious3"
         PageCount="150" PageIndex="40" Mode="NextPrevious" FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass=""
         FirstPageText="<<" PreviousPageText="<" NextPageText=">" LastPageText=">>" />

    <asp:Panel ID="pagerNextPrevious" runat="server" />
    <asp:Panel ID="pagerNextPrevious2" runat="server" />
    <asp:Panel ID="pagerNextPrevious3" runat="server" />
    <h6>
        nextPreviousFirstLast</h6>
    <wijmo:C1PagerExtender runat="server" ID="pagerNextPreviousFirstLastExtender" TargetControlID="pagerNextPreviousFirstLast"
        PageCount="150" PageIndex="40" Mode="NextPreviousFirstLast" />
    <wijmo:C1PagerExtender runat="server" ID="pagerNextPreviousFirstLast2Extender" TargetControlID="pagerNextPreviousFirstLast2"
         PageCount="150" PageIndex="40" Mode="NextPreviousFirstLast" FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" />
    <wijmo:C1PagerExtender runat="server" ID="pagerNextPreviousFirstLast3Extender" TargetControlID="pagerNextPreviousFirstLast3"
         PageCount="150" PageIndex="40" Mode="NextPreviousFirstLast" FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass=""
         FirstPageText="<<" PreviousPageText="<" NextPageText=">" LastPageText=">>" />

    <asp:Panel ID="pagerNextPreviousFirstLast" runat="server" />
    <asp:Panel ID="pagerNextPreviousFirstLast2" runat="server" />
    <asp:Panel ID="pagerNextPreviousFirstLast3" runat="server" />
    <h6>
        Numeric</h6>
    <wijmo:C1PagerExtender runat="server" ID="pagerNumericExtender" TargetControlID="pagerNumeric"
        PageCount="150" PageIndex="40" Mode="Numeric" />

    <asp:Panel ID="pagerNumeric" runat="server" />
    <h6>
        numericFirstLast</h6>
    <wijmo:C1PagerExtender runat="server" ID="pagerNumericFirstLastExtender" TargetControlID="pagerNumericFirstLast"
        PageCount="150" PageIndex="40" Mode="NumericFirstLast" />
    <wijmo:C1PagerExtender runat="server" ID="pagerNumericFirstLast2Extender" TargetControlID="pagerNumericFirstLast2"
         PageCount="150" PageIndex="40" Mode="NumericFirstLast" FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass="" />
    <wijmo:C1PagerExtender runat="server" ID="pagerNumericFirstLast3Extender" TargetControlID="pagerNumericFirstLast3"
         PageCount="150" PageIndex="40" Mode="NumericFirstLast" FirstPageClass="" PreviousPageClass="" NextPageClass="" LastPageClass=""
         FirstPageText="<<" PreviousPageText="<" NextPageText=">" LastPageText=">>" />

    <asp:Panel ID="pagerNumericFirstLast" runat="server" />
    <asp:Panel ID="pagerNumericFirstLast2" runat="server" />
    <asp:Panel ID="pagerNumericFirstLast3" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
       The Paging Modes sample illustrates the different ways that the wijpager widget can be configured by
       setting the <b>mode</b> option.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
