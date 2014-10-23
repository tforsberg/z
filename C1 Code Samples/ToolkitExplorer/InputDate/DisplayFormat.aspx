<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DisplayFormat.aspx.cs" Inherits="ControlExplorer.C1InputDate.DisplayFormat" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate3"  TargetControlID="TextBox1" runat="server" DisplayFormat="F">
    </wijmo:C1InputDateExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates that when the <b>DateFormat</b> Property is set to a different value width the format, when date widget lost focus, the display format will be applied to the display the text.
    </p>
</asp:Content>
