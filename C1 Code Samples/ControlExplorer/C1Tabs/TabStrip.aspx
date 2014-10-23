<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TabStrip.aspx.cs" Inherits="ControlExplorer.C1Tabs.TabStrip" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Tabs" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .ui-tabs .ui-tabs-panel
        {
            padding-top: 0;
            padding-bottom: 0;
        }
        
        .ui-tabs-left, .ui-tabs-left .ui-tabs-nav
        {
            width: 140px;
        }
        
        .ui-tabs-left .wijmo-wijtabs-content
        {
            width: 0;
        }
        
        .message
        {
            font-size: 3em;
        }
    </style>
    <script type="text/javascript">

        function TabSelected(e, ui) {
            $("#<%=msg.ClientID%>").text("Tab <" + $(ui.tab).text() + "> is selected!");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Tabs ID="C1Tab1" runat="server" OnClientSelect="TabSelected">
        <Pages>
            <wijmo:C1TabPage ID="Page1" Text="General">
            </wijmo:C1TabPage>
            <wijmo:C1TabPage ID="Page2" Text="Controls">
            </wijmo:C1TabPage>
            <wijmo:C1TabPage ID="Page3" Text="About">
            </wijmo:C1TabPage>
        </Pages>
    </wijmo:C1Tabs>
    <wijmo:C1Tabs ID="C1Tabs2" runat="server" OnClientSelect="TabSelected" Alignment="Left" Width="100%">
        <Pages>
            <wijmo:C1TabPage ID="Page4" Text="Books">
            </wijmo:C1TabPage>
            <wijmo:C1TabPage ID="Page5" Text="CDs">
            </wijmo:C1TabPage>
            <wijmo:C1TabPage ID="Page6" Text="Tapes">
            </wijmo:C1TabPage>
        </Pages>
    </wijmo:C1Tabs>
    <asp:Label ID="msg" runat="server" Text="" CssClass="message ui-state-highlight"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to simulate a simple tabstrip UI with the <strong>C1Tabs</strong>.
    </p>
    <p>
        For horizontal tabstrip, we can add a C1Tabs control with blank content, and then changing the vertical padding to 0.
    </p>
    <p>
        For vertical tabstrip, a vertical C1Tabs control with blank content is necessary, meanwhile, the width of both the tabs and content area should be set to proper values.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
