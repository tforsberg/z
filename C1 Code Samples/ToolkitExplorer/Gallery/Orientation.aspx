<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Orientation.aspx.cs"
    Inherits="ToolkitExplorer.Gallery.Orientation" Title="Orientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gallery"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Orientation is "vertical", at left side</h3>
    <asp:Panel ID="gallery" runat="server" Font-Overline="False" Title="Overview" Width="750"
        Height="256">
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
        </ul>
    </asp:Panel>
    <wijmo:C1GalleryExtender runat="server" ID="CarouselExtender2" ThumbnailDirection="After"
        ShowControlsOnHover="false" ThumbsDisplay="3" ThumbsLength="120" ThumbnailOrientation="Vertical"
        TargetControlID="gallery">
    </wijmo:C1GalleryExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the orinetation and position of the thumbnails of gallery.
    </p>
    <ul>
        <li>The property <b>ThumbnailOrientation</b> is set to determine the orientation of
            the thumbnails.</li>
        <li>The property <b>ThumbnailDirection</b> is set to determine the positon of the thumbnails.(The
            value should be "Before" or "After")</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    Orientation:&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="OrientationDDL" runat="server">
        <asp:ListItem>Vertical</asp:ListItem>
        <asp:ListItem>Horizontal</asp:ListItem>
    </asp:DropDownList>
    <br />
    Direction:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="DirectionDDL" runat="server">
        <asp:ListItem>After</asp:ListItem>
        <asp:ListItem>Before</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Button ID="ApplyBt" runat="server" Text="Apply" OnClick="ApplyBt_Click" />
</asp:Content>
