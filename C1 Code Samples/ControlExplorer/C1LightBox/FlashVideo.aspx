<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="FlashVideo.aspx.cs" Inherits="ControlExplorer.C1LightBox.FlashVideo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" TextPosition="Outside" 
        ControlsPosition="Outside" ShowCounter="false" 
        FlashInstall="player/expressInstall.swf" FlvPlayer="player/player.swf">
    <Items>
        <wijmo:C1LightBoxItem ID="LightBoxItem1" 
            ImageUrl="http://cdn.wijmo.com/images/flash.png" 
            LinkUrl="http://cdn.wijmo.com/movies/racing.flv" Title="Auto Scrollers Racing" 
            Text="Auto Scrollers Racing"/>
    </Items>
</wijmo:C1LightBox>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
This sample demonstrates how to display Flash Video in the <strong>C1LightBox</strong> control.
</p>

<p> The <b>FlvPlayer</b> property specifies the name and path of the specified Flash Video Player.
This sample uses a JW Player (player.swf) in the "player" folder.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
