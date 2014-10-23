<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Overview.aspx.cs" Inherits="Pager_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Pager" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel runat="server" ID="demo"></asp:Panel> 
    <wijmo:C1PagerExtender runat="server" ID="PagerExtender" TargetControlID="demo" PageCount="150" PageIndex="40" Mode="NumericFirstLast" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        Wijmo Pager allows users to scroll through elements or pages by clicking on a visible element.
        The wijpager widget allows you to use several modes; for example, you can set it up to use a numeric
        paging system or a next/previous system.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
