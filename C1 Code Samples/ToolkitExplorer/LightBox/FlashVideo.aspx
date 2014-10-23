<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="FlashVideo.aspx.cs" Inherits="ToolkitExplorer.LightBox.FlashVideo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

	<asp:Panel ID="Panel1" runat="server">
		<a id="lightbox" href="../movies/racing.flv" rel="wijlightbox;width=600;height=400">
		    <img src="images/small/flash.png" title="Auto Scrollers Racing" alt="Auto Scrollers Racing" /></a> 
	</asp:Panel>

	<wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
		TargetControlID="Panel1" TextPosition="Outside" ControlsPosition="Outside" ShowCounter="false">
	</wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates how to display Flash Video in the C1LightBox.
</p>

<p> The <b>FlvPlayer</b> property specifies the name and path of the specified Flash Video Player.
This sample uses a JW Player (player.swf) in the "player" folder.
</p>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
