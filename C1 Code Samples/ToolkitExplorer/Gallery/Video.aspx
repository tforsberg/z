<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Video.aspx.cs" Inherits="ToolkitExplorer.Gallery.Video" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gallery"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Video</h3>
    <asp:Panel ID="gallery" runat="server" Font-Overline="False" Title="Overview" Width="750"
        Height="600">
        <ul class="">
            <li class=""><a href="https://www.youtube.com/v/J---aiyznGQ?version=3">
                <img src="http://cdn.wijmo.com/images/keyboardcat.png" title="Happy Girl" alt="Happy Girl" /></a> </li>
            <li class=""><a href="http://www.youtube.com/v/FzRH3iTQPrk?version=3">
                <img src="http://cdn.wijmo.com/images/panda.png" title="Cave Man" alt="Cave Man" /></a> </li>
            <li class=""><a href="http://www.youtube.com/v/z3U0udLH974?version=3">
                <img src="http://cdn.wijmo.com/images/talkingcats.png" title="Old Man" alt="Old Man" /></a> </li>
        </ul>
    </asp:Panel>
    <wijmo:C1GalleryExtender runat="server" ID="CarouselExtender2" ShowTimer="True"
        Mode="Swf" ThumbnailOrientation="Horizontal" ThumbsDisplay="4" ShowPager="false"
        TargetControlID="gallery">
    </wijmo:C1GalleryExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the swf mode of <strong>C1Gallery </strong>extender, which
        has a inner flash player in the the frame.
    </p>
    <ul>
        <li>The property <b>Mode</b> should set to "Swf".</li>
    </ul>
</asp:Content>
