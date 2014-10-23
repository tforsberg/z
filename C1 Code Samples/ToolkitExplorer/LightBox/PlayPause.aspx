<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="PlayPause.aspx.cs" Inherits="ToolkitExplorer.LightBox.PlayPause" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <a href="http://lorempixum.com/600/400/sports/1" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/1" title="Sports 1" alt="Sports 1" /></a> 
		<a href="http://lorempixum.com/600/400/sports/2" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/2" title="Sports 2" alt="Sports 2" /></a> 
		<a href="http://lorempixum.com/600/400/sports/3" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/3" title="Sports 3" alt="Sports 3" /></a> 
		<a href="http://lorempixum.com/600/400/sports/4" rel="wijlightbox[stock];player=img">
			<img src="http://lorempixum.com/120/90/sports/4" title="Sports 4" alt="Sports 4" /></a>
    </asp:Panel>

    <wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
        TargetControlID="Panel1" Player="Img" ShowTimer="true" CtrlButtons="Play, Stop" Loop="false">
    </wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

    <p>
        This sample demonstrates how to display control buttons in C1LightBox.
    </p>
    <p>
        The <b>CtrlButtons</b> property determines the visibility of control buttons; it is a flag enum property with the following possible values:
    </p>
    <ul>
        <li>None - No control buttons are displayed.</li>
        <li>Play - Displays the Play button.</li>
        <li>Stop - Displays the Stop button.</li>
    </ul>
    <p>
        LightBox displays pages in order after clicking the Play button. To play
        automatically after initializing, set the <b>AutoPlay</b>
        property to True.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
