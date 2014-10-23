<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="IFrame.aspx.cs" Inherits="ToolkitExplorer.Gallery.IFrame" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gallery"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        IFrame</h3>
    <asp:Panel ID="gallery" runat="server" Font-Overline="False" Title="Overview" Width="750"
        Height="600">
                    <ul class="">
                        <li class=""><a href="http://www.yahoo.com/">
                            <img src="http://cdn.wijmo.com/images/yahoo_thumb.png" title="Yahoo" alt="Yahool" /></a>
                        </li>
                        <li class=""><a href="http://www.componentone.com">
                            <img src="http://cdn.wijmo.com/images/componentone_thumb.png" title="ComponentOne"
                                alt="ComponentOne" /></a> </li>
                        <li class=""><a href="http://www.microsoft.com">
                            <img src="http://cdn.wijmo.com/images/microsoft_thumb.png" title="Microsoft" alt="Microsoft" /></a>
                        </li>
                    </ul>
    </asp:Panel>
    <wijmo:C1GalleryExtender runat="server" ID="CarouselExtender2" ShowTimer="false" ShowCaption="false" ShowControlsOnHover="false"
        ThumbnailOrientation="Horizontal" ThumbsLength="100" ThumbsDisplay="4" ShowPager="false" Mode="Iframe"
        TargetControlID="gallery">
    </wijmo:C1GalleryExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the iframe mode of <strong>C1Gallery </strong>extender, which has a inner iframe that links to another URL.
    </p>
     <ul>
        <li>The property <b>Mode</b> should set to "Iframe".</li>
    </ul>
</asp:Content>
