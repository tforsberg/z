<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="ModalDialog.aspx.cs" Inherits="Dialog_ModalDialog" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Dialog"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="dialog" runat="server">
        <p>
            Adding the modal overlay screen makes the dialog look more prominent because it
            dims out the page content.</p>
    </asp:Panel>
    <wijmo:C1DialogExtender runat="server" ID="DialogExtender1" Width="400" Height="180"
        Title="Model dialog" TargetControlID="dialog" Modal="True" Stack="True" CloseText="Close">
        <ExpandingAnimation Duration="400" />
        <CollapsingAnimation Duration="300" />
    </wijmo:C1DialogExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
        Adding the modal overlay screen makes the dialog look more prominent because it
        dims out the page content.
    </p>
    <ul>
        <li>This feature is allowed if the property <b>Modal</b> is set to true . </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <input type="button" value="Show Dialog" onclick="$('#<%=dialog.ClientID%>').wijdialog('open')" />
</asp:Content>
