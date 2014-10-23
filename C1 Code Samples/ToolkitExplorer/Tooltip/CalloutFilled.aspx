<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="CalloutFilled.aspx.cs" Inherits="ControlExplorer.Tooltip.CalloutFilled" %>

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
    <h3>
        <asp:HyperLink runat="server" ID="HyperLink1" ToolTip="tooltip">Anchor</asp:HyperLink>
        <wijmo:C1TooltipExtender ID="TooltipExtender1" runat="server" TargetControlID="HyperLink1">
        </wijmo:C1TooltipExtender>
    </h3>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1TooltipExtender</strong> supports showing a solid box for the callout.</p>
    <p>
        The <strong>calloutFilled</strong> client-side property is used in this samples.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <%--<label>
        Fill</label>
    <asp:CheckBox ID="chbCalloutFilled" runat="server" AutoPostBack="true" OnCheckedChanged="chbCalloutFilled_CheckedChanged" />--%>
    <label>
        Fill</label>
    <input type="checkbox" id="calloutFilled" checked="checked" />
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $("#calloutFilled").change(function () {
                $("#<%=HyperLink1.ClientID %>").wijtooltip("option", "calloutFilled",  this.checked);
            });

        });     
    </script>
</asp:Content>
