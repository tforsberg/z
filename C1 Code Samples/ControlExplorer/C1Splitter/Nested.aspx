<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Nested.aspx.cs" Inherits="ControlExplorer.C1Splitter.Nested" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Splitter" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function refresh() {
            $("#<%=hsplitter.ClientID%>").c1splitter("refresh");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Splitter ID="vsplitter" runat="server" OnClientExpanded="refresh" OnClientCollapsed="refresh" OnClientSized="refresh">
        <Panel2>
            <ContentTemplate>
                <wijmo:C1Splitter ID="hsplitter" runat="server" FullSplit="True" Orientation="Horizontal">
                </wijmo:C1Splitter>
            </ContentTemplate>
        </Panel2>
    </wijmo:C1Splitter>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Splitter</strong> supports templating , which you can use to make a nested splitter.</p>
    <p>
        In order to make the nested sample, the following properties and events are used in this sample.</p>
    <ul>
        <li>ContentTemplate</li>
        <li>FullSplit</li>
        <li>Orientation</li>
        <li>OnClientExpanded</li>
        <li>OnClientCollapsed</li>
        <li>OnClientSized</li>
    </ul>
    <p>
        This sample uses the ContentTemplate to nest the hsplitter in the vsplitter. Here, the <strong>FullSplit</strong> property is used to fill the vsplitter's whole panel2 and with the <strong>OnClientExpanded</strong>/<strong>OnClientCollapsed</strong>/<strong>OnClientSized</strong> events the nested splitter(hsplitter) can be refreshed after the vsplitter is resized(expanded/collapsed/sized).</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
