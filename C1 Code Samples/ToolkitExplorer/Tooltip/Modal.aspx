<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Modal.aspx.cs" Inherits="ControlExplorer.Tooltip.Modal" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tooltip"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<style type="text/css">
	#content a
	{
	    color:#000000;
	    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" ToolTip="tooltip">Anchor</asp:HyperLink>
    <wijmo:C1TooltipExtender ID="TooltipExtender1" runat="server" CloseBehavior="Sticky"
        Modal="true" TargetControlID="HyperLink1">
    </wijmo:C1TooltipExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to create a modal tooltip. The modal tooltip must be closed to continue using the page.</p>
    <p>
        The <strong>Modal</strong> property is used in this sample to make a modal tooltip.</p>
    <p>
        When the <strong>Modal</strong> checkbox is checked, hovering over "Hover on the element" causes a modal tooltip to appear.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<%--<label for="isModal">
        Modal</label>
    <asp:CheckBox ID="chbIsModal" runat="server" AutoPostBack="true" Checked="true" 
        oncheckedchanged="chbIsModal_CheckedChanged" />--%>
    <label for="isModal">
        Modal</label>
    <input type="checkbox" id="isModal" checked="checked" />
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $("#isModal").click(function () {
                $("#<%=HyperLink1.ClientID %>").wijtooltip("option", "modal", !!$("#isModal").is(":checked"));
            });

        });
    </script>
</asp:Content>
