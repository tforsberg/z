<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="ControlExplorer.C1Gallery.Paging" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Gallery ID="gallery" runat="server" ShowTimer="True" Width="750px" Height="300px"
        ThumbnailOrientation="Vertical" ThumbsDisplay="3" ShowPager="true">
        <Items>
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/1" ImageUrl="http://lorempixum.com/200/150/sports/1" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/2" ImageUrl="http://lorempixum.com/200/150/sports/2" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/3" ImageUrl="http://lorempixum.com/200/150/sports/3" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/4" ImageUrl="http://lorempixum.com/200/150/sports/4" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/5" ImageUrl="http://lorempixum.com/200/150/sports/5" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/6" ImageUrl="http://lorempixum.com/200/150/sports/6" />
        </Items>
    </cc1:C1Gallery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the paging of the gallery.
    </p>
    <p>
        The property <b>ShowPager</b> is set to determine whether should show the pager.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
