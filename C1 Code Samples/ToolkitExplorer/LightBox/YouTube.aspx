<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="YouTube.aspx.cs" Inherits="ToolkitExplorer.LightBox.YouTube" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Panel ID="Panel1" runat="server">
        <a title="Keyboard Cat" href="https://www.youtube.com/v/J---aiyznGQ?version=3" rel="wijlightbox;player=swf"><img class=border alt="" src="images/small/keyboardcat.png"/></a>
		<a title="Sneezing Panda" href="http://www.youtube.com/v/FzRH3iTQPrk?version=3" rel="wijlightbox;player=swf"><img class=border alt="" src="images/small/panda.png"/></a>
		<a title="Talking Cats" href="http://www.youtube.com/v/z3U0udLH974?version=3" rel="wijlightbox;player=swf"><img class=border alt="" src="images/small/talkingcats.png"/></a>
    </asp:Panel>

    <wijmo:C1LightBoxExtender ID="Panel1_C1LightBoxExtender" runat="server" 
        TargetControlID="Panel1" Player="Swf" TextPosition="Outside" ControlsPosition="Outside">
    </wijmo:C1LightBoxExtender>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This is a video content sample with source from YouTube.
</p>

<p>
Since the external links are Flash movies, we set the <b>Player</b> property "Swf" to force creation of the Flash Object player.
</p>

<p>
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
