<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Overview.aspx.cs" Inherits="Dialog_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Dialog"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="dialog" runat="server" Font-Overline="False">
        <h2>
            Dialog</h2>
        <br />
        <span>This is the default dialog which is useful for displaying information. The dialog
            window can be moved, resized and closed with the 'x' icon.</span>
    </asp:Panel>
    <wijmo:C1DialogExtender runat="server" ID="DialogExtender1" Width="550" Height="240"
        Title="Overview" TargetControlID="dialog">
    </wijmo:C1DialogExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This is the default dialog which is useful for displaying information. The dialog
        window can be moved, resized and closed with the 'x' icon.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <input type="button" value="Hide Dialog" onclick="$('#<%=dialog.ClientID%>').wijdialog('close')" />
    <input type="button" value="Show Dialog" onclick="$('#<%=dialog.ClientID%>').wijdialog('open')" />
</asp:Content>
