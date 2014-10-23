<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs"
    Inherits="ToolkitExplorer.Gallery.Paging" Title="Paging" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gallery"
    TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Pager"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="gallery" runat="server" Font-Overline="False" Title="Overview" Width="750"
        Height="300">
                <ul class="">
            <li class=""><a href="http://lorempixum.com/750/300/sports/1">
                <img alt="1" src="http://lorempixum.com/200/150/sports/1" title="Word Caption 1" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/2">
                <img alt="2" src="http://lorempixum.com/200/150/sports/2" title="Word Caption 2" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/3">
                <img alt="3" src="http://lorempixum.com/200/150/sports/3" title="Word Caption 3" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/4">
                <img alt="4" src="http://lorempixum.com/200/150/sports/4" title="Word Caption 4" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/5">
                <img alt="5" src="http://lorempixum.com/200/150/sports/5" title="Word Caption 5" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/6">
                <img alt="6" src="http://lorempixum.com/200/150/sports/6" title="Word Caption 6" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/7">
                <img alt="7" src="http://lorempixum.com/200/150/sports/7" title="Word Caption 7" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/8">
                <img alt="8" src="http://lorempixum.com/200/150/sports/8" title="Word Caption 8" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/9">
                <img alt="9" src="http://lorempixum.com/200/150/sports/9" title="Word Caption 9" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/10">
                <img alt="10" src="http://lorempixum.com/200/150/sports/10" title="Word Caption 10" />
            </a></li>
        </ul>
    </asp:Panel>
    <wijmo:C1GalleryExtender runat="server" ID="CarouselExtender2" ThumbnailDirection="After"
        ShowControlsOnHover="false" ShowPager="true" ThumbsDisplay="3" ThumbsLength="120" TargetControlID="gallery">
    </wijmo:C1GalleryExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the paging of the gallery.
    </p>
    <ul>
        <li>The property <b>ShowPager</b> is set to determine whether should show the pager.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
