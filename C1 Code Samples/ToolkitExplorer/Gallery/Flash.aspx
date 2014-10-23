<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Flash.aspx.cs" Inherits="ToolkitExplorer.Gallery.Flash" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gallery"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Flash</h3>
    <asp:Panel ID="gallery" runat="server" Font-Overline="False" Title="Overview" Width="700"
        Height="600">
        <ul class="">
            <li class=""><a href="http://cdn.wijmo.com/movies/skip.swf">
                <img src="http://cdn.wijmo.com/images/happygirl.png" title="Happy Girl" alt="Happy Girl" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/caveman.swf">
                <img src="http://cdn.wijmo.com/images/caveman.png" title="Cave Man" alt="Cave Man" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/old_man.swf">
                <img src="http://cdn.wijmo.com/images/oldman.png" title="Old Man" alt="Old Man" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/skip.swf">
                <img src="http://cdn.wijmo.com/images/happygirl.png" title="Happy Girl" alt="Happy Girl" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/caveman.swf">
                <img src="http://cdn.wijmo.com/images/caveman.png" title="Cave Man" alt="Cave Man" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/old_man.swf">
                <img src="http://cdn.wijmo.com/images/oldman.png" title="Old Man" alt="Old Man" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/skip.swf">
                <img src="http://cdn.wijmo.com/images/happygirl.png" title="Happy Girl" alt="Happy Girl" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/caveman.swf">
                <img src="http://cdn.wijmo.com/images/caveman.png" title="Cave Man" alt="Cave Man" /></a> </li>
            <li class=""><a href="http://cdn.wijmo.com/movies/old_man.swf">
                <img src="http://cdn.wijmo.com/images/oldman.png" title="Old Man" alt="Old Man" /></a> </li>
        </ul>
    </asp:Panel>
    <wijmo:C1GalleryExtender runat="server" ID="CarouselExtender2" ShowTimer="True"
        ThumbnailOrientation="Horizontal" ThumbsDisplay="4" ShowPager="false" Mode="Swf"
        TargetControlID="gallery">
    </wijmo:C1GalleryExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the flash mode of <strong>C1Gallery </strong>extender, which
        has a inner flash player in the frame.
    </p>
    <ul>
        <li>The property <b>Mode</b> should set to "Swf".</li>
    </ul>
</asp:Content>
