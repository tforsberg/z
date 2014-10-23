<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="CustomizeSimple.aspx.cs" Inherits="ControlExplorer.C1Editor.CustomizeSimple" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="530" Mode="Simple"></wijmo:C1Editor>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		<strong>C1Editor</strong> supports toolbar customization when using the simple toolbar mode. 
	 The ToolBars can then use custom event handlers.
	</p>
	<p>Simple toolbar customization is allowed if the following options are set to corresponding values: </p>
		<ul style="list-style-type:none">
			<li><strong>Mode </strong>-takes effect when the value is "Simple".</li>
			<li><strong>SimpleModeCommands </strong>-custom buttons shown in the toolbar.</li>
		</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
