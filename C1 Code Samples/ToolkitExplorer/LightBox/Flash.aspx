<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Flash.aspx.cs" Inherits="ToolkitExplorer.LightBox.Flash" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server">
		<a href="movies/skip.swf" rel="wijlightbox[stock];width=400;height=300">
			<img src="images/small/happygirl.png" title="Happy Girl" alt="Happy Girl" /></a> 
		<a href="movies/caveman.swf" rel="wijlightbox[stock];width=520;height=390">
			<img src="images/small/caveman.png" title="Cave Man" alt="Cave Man" /></a> 
		<a href="movies/old_man.swf" rel="wijlightbox[stock];width=600;height=450">
			<img src="images/small/oldman.png" title="Old Man" alt="Old Man" /></a> 
	</asp:Panel>

	<wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
		TargetControlID="Panel1" TextPosition="Outside" ControlsPosition="Outside" ShowCounter="false">
	</wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates displaying SWF content in the C1LightBox.
</p>

<p>
C1LightBox creates the Flash Object automatically if the URL points to a SWF file.
</p>

<p>
For URLs that don't explicitly show the file links, we can set the <b>Player</b> propertty to Swf to force using the Flash Object as content player.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
