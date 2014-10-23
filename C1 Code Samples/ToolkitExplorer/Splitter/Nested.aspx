<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Nested.aspx.cs" Inherits="Splitter_Nested" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Splitter"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		.vsplitter
		{
			width: 300px;
			height: 200px;
		}
	</style>
	<script type="text/javascript">
		function refresh() {
			$("#<%=hsplitter.ClientID%>").wijsplitter("refresh");
		}
	</script> 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	Compound:
	<asp:Panel runat="server" ID="vsplitter" CssClass="vsplitter">
		<div>
			panel1	 
		</div>
		<div>
			<asp:Panel runat="server" ID="hsplitter">
				<div>
					panel2</div>
				<div>
					panel3</div>
			</asp:Panel>
		</div>
	</asp:Panel>
	<wijmo:C1SplitterExtender runat="server" ID="SplitterExtender1" TargetControlID="vsplitter" Orientation="Vertical" OnClientExpanded="refresh" OnClientCollapsed="refresh" OnClientSized = "refresh" />
	<wijmo:C1SplitterExtender runat="server" ID="SplitterExtender2" TargetControlID="hsplitter" Orientation="Horizontal" FullSplit="true" />
</asp:Content>
<asp:Content ID = "Content3" ContentPlaceHolderID = "Description" runat ="server">
	<p>The sample shows how to make a nested splitter with C1SplitterExtender.</p><br/>
	<p>In order to make the nested sample, the following properties and events are used in this sample.</p>
	<ul>
	<li>FullSplit</li>
	<li>Orientation</li>
	<li>OnClientExpanded</li>
	<li>OnClientCollapsed</li>
	<li>OnClientSized</li>
	</ul>
	<br/>
	<p>Simply put the div tags for the hsplitter with the div tags of the first splitter, then apply C1SplitterExtender to the first and second splitter markup accordingly. Here, FullSplit property is used to fill the vsplitter's whole panel2 and with the OnClientExpanded/OnClientCollapsed/OnClientSized events the nested splitter(hsplitter) can be refreshed after the vsplitter is resized(expanded/collapsed/sized).</p>
</asp:Content>
<asp:Content ID = "Content4" ContentPlaceHolderID = "ControlOptions" runat = "server">
</asp:Content>