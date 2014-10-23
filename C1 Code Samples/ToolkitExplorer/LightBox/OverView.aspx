<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="OverView.aspx.cs" Inherits="ToolkitExplorer.LightBox.OverView" %>
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
        TargetControlID="Panel1" Player="Img">
    </wijmo:C1LightBoxExtender>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
The C1LightBox is used to display images and content in a popup interface without ever leaving the page to view media.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
