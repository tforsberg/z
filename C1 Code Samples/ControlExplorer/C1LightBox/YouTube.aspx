<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="YouTube.aspx.cs" Inherits="ControlExplorer.C1LightBox.YouTube" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Swf" TextPosition="Outside" ControlsPosition="Outside" >
	<Items>
		<wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Keyboard Cat"
			ImageUrl="~/C1LightBox/images/small/keyboardcat.png" 
			LinkUrl="https://www.youtube.com/v/J---aiyznGQ?version=3" />
		<wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Sneezing Panda"
			ImageUrl="~/C1LightBox/images/small/panda.png" 
			LinkUrl="http://www.youtube.com/v/FzRH3iTQPrk?version=3" />
		<wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Talking Cats"
			ImageUrl="~/C1LightBox/images/small/talkingcats.png" 
			LinkUrl="http://www.youtube.com/v/z3U0udLH974?version=3" />
	</Items>
</wijmo:C1LightBox>


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
