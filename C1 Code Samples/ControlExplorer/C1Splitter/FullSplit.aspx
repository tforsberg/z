<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="FullSplit.aspx.cs" Inherits="ControlExplorer.C1Splitter.FullSplit" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Splitter" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="height: 300px">
        <wijmo:C1Splitter runat="server" ID="C1Splitter1" Orientation="Vertical" FullSplit="true" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        A full-size splitter is enabled when the <strong>FullSplit</strong> property is set to True.</p>
    <p>
        If the container's size is changed, then the client-side <strong>refresh</strong> method should be triggered to ensure proper sizing. Example:
    </p>
    <pre>$(selector).c1splitter("refresh").</pre>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
