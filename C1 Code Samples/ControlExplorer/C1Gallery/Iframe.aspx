<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Iframe.aspx.cs" Inherits="ControlExplorer.C1Gallery.Iframe" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Gallery ID="gallery" runat="server" ShowTimer="false" ShowCaption="false" ShowControlsOnHover="false" Width="750px" Height="600px"
        ThumbnailOrientation="Horizontal" ThumbsLength="100" ThumbsDisplay="4" ShowPager="false" Mode="Iframe">
        <Items>
            <cc1:C1GalleryItem LinkUrl="http://www.componentone.com" ImageUrl="http://cdn.wijmo.com/images/componentone_thumb.png" Caption="ComponentOne" />
            <cc1:C1GalleryItem LinkUrl="http://windows.microsoft.com/en-US/windows/home" ImageUrl="http://cdn.wijmo.com/images/microsoft_thumb.png" Caption="Microsoft" />
        </Items>
    </cc1:C1Gallery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the iframe mode of <strong>C1Gallery </strong>control, which has an inner iframe that links to another URL.
    </p>
    <p>
        The property <b>Mode</b> should set to "Iframe".
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
