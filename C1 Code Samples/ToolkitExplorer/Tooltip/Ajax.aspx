<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Ajax.aspx.cs" Inherits="ToolkitExplorer.Tooltip.Ajax" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tooltip"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script type="text/javascript">
	function ajaxcallback() {
		var ele = this;
		ele.wijtooltip("option", "content", "This is a tooltip for " + ele.html());
	}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<ul class="ui-helper-reset ui-widget-header ui-corner-all" style="padding: 1em;">
		<li class="tooltip"><a href="#">Anchor1</a></li>
		<li class="tooltip"><a href="#">Anchor2</a></li>
		<li class="tooltip"><a href="#">Anchor3</a></li>
		<li class="tooltip"><a href="#">Anchor4</a></li>
	</ul>
	<wijmo:C1TooltipExtender runat="server" ID="C1TooltipExtender1" AjaxCallback="ajaxcallback" TargetSelector=".tooltip>a">	
	</wijmo:C1TooltipExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This sample shows how to set tooltip content by AJAX.</p><br/>
<p>The following properties/events are used in this sample.</p>
<ul>
	<li>AjaxCallback</li>
</ul>
<p>Use "AjaxCallback" event to set tooltip's content at client side.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
