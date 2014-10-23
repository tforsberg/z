<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="ContentUrl.aspx.cs" Inherits="Dialog_ContentUrl" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Dialog"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="dialog" runat="server">
    </asp:Panel>
    <wijmo:C1DialogExtender runat="server" ID="DialogExtender1" Width="840" Height="640"
        Title="Wijmo" TargetControlID="dialog" Stack="True" CloseText="Close" ContentUrl="http://www.wijmo.com">
        <CollapsingAnimation>
            <Animated Effect="blind" />
        </CollapsingAnimation>
    </wijmo:C1DialogExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows a dialog with a inner iframe that link to another url.
    </p>
    <ul>
        <li>The property <b>ContentUrl</b> is a URL string specifies the URL for the iframe
            element inside dialog. </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
