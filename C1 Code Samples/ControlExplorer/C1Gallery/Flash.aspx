<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Flash.aspx.cs" Inherits="ControlExplorer.C1Gallery.Flash" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Gallery ID="gallery" runat="server" ShowTimer="True" Width="700px" Height="600px"
        ThumbnailOrientation="Horizontal" ThumbsDisplay="4" ShowPager="false" Mode="Swf">
        <Items>
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/skip.swf" ImageUrl="http://cdn.wijmo.com/images/happygirl.png"
                Caption="Happy Girl" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/caveman.swf" ImageUrl="http://cdn.wijmo.com/images/caveman.png"
                Caption="Cave Man" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/old_man.swf" ImageUrl="http://cdn.wijmo.com/images/oldman.png"
                Caption="Old Man" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/skip.swf" ImageUrl="http://cdn.wijmo.com/images/happygirl.png"
                Caption="Happy Girl" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/caveman.swf" ImageUrl="http://cdn.wijmo.com/images/caveman.png"
                Caption="Cave Man" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/old_man.swf" ImageUrl="http://cdn.wijmo.com/images/oldman.png"
                Caption="Old Man" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/skip.swf" ImageUrl="http://cdn.wijmo.com/images/happygirl.png"
                Caption="Happy Girl" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/caveman.swf" ImageUrl="http://cdn.wijmo.com/images/caveman.png"
                Caption="Cave Man" />
            <cc1:C1GalleryItem LinkUrl="http://cdn.wijmo.com/movies/old_man.swf" ImageUrl="http://cdn.wijmo.com/images/oldman.png"
                Caption="Old Man" />
        </Items>
    </cc1:C1Gallery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the flash mode of <strong>C1Gallery </strong>control, which
        has an inner flash player in the frame.
    </p>
    <p>
        The property <b>Mode</b> should set to "Swf".
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
