<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="KeyNav.aspx.cs" Inherits="ToolkitExplorer.LightBox.KeyNav" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server">
		<a href="http://lorempixum.com/600/400/sports/1" rel="wijlightbox[stock];player=img">
            <img src="http://lorempixum.com/120/90/sports/1"  title="Grass Field" alt="Grass Field with a car in the background" /></a>
        <a href="http://lorempixum.com/600/400/sports/2" rel="wijlightbox[stock];player=img">
            <img src="http://lorempixum.com/120/90/sports/2"  title="Mountains" alt="Mountains and a blue cloudy sky" /></a>
        <a href="http://lorempixum.com/600/400/sports/3"  rel="wijlightbox[stock];player=img">
            <img src="http://lorempixum.com/120/90/sports/3" title="Bridge" alt="Bridge with mountains" /></a>
        <a href="http://lorempixum.com/600/400/sports/4" rel="wijlightbox[stock];player=img">
            <img src="http://lorempixum.com/120/90/sports/4"  title="Building" alt="Building with interesting architecture" /></a>
	</asp:Panel>

	<wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
		TargetControlID="Panel1" Player="Img" TextPosition="TitleOverlay" KeyNav="true">
	</wijmo:C1LightBoxExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates keyboard navigation.
</p>

<p>
The keyboard navigation is enabled by setting the <b>KeyNav</b> property to True.
</p>

<p>
The following keys are supported by default:
</p>
<ul>
<li>LEFT/DOWN - Moves to the previous page.</li>
<li>RIGHT/UP - Moves to the next page.</li>
<li>HOME - Moves to the first page.</li>
<li>END - Moves to the last page.</li>
</ul>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
