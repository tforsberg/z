<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="Splitter_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Splitter"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		.splitterContainer
		{
			height: 210px;
		}
		
		.vsplitter, .hsplitter
		{
			width: 200px;
			height: 200px;
		}
		
		.layout
		{
			float: left;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div class="splitterContainer">
		<div class="layout">
			<p>
				vertical:</p>
			<asp:Panel runat="server" ID="vsplitter" CssClass="vsplitter">
				<div>
					panel1
				</div>
				<div>
					panel2
				</div>
			</asp:Panel>
			<wijmo:C1SplitterExtender runat="server" ID="SplitterExtender1" TargetControlID="vsplitter" Orientation="Vertical" />
		</div>
		<div class="layout" style="width: 100px;">
			&nbsp;</div>
		<div class="layout">
			<p>
				horizontal:</p>
			<asp:Panel runat="server" ID="hsplitter" CssClass="hsplitter">
				<div>
					panel1
				</div>
				<div>
					panel2
				</div>
			</asp:Panel>
			<wijmo:C1SplitterExtender runat="server" ID="SplitterExtender2" TargetControlID="hsplitter" Orientation="Horizontal" />
		</div>
	</div>
</asp:Content>
<asp:Content ID = "Content3" ContentPlaceHolderID = "Description" runat ="server">
	<p>The C1SplitterExtender can convert a Panel to a splitter control which consists a movable bar that divides a container's display area into two resizable panels.</p>
	<p>The following properties are used in this sample</p>
	<ul>
		<li>Orientation</li>
	</ul>
</asp:Content>
<asp:Content ID = "Content4" ContentPlaceHolderID = "ControlOptions" runat = "server">
</asp:Content>