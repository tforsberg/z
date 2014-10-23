<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Video.aspx.cs" Inherits="ControlExplorer.C1Gallery.Video" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Gallery ID="gallery" runat="server" ShowTimer="True" Width="750px" Height="600px"
        Mode="Swf" ThumbnailOrientation="Horizontal" ThumbsDisplay="4" ShowPager="false">
        <Items>
            <cc1:C1GalleryItem LinkUrl="https://www.youtube.com/v/J---aiyznGQ?version=3" ImageUrl="http://cdn.wijmo.com/images/keyboardcat.png" />
            <cc1:C1GalleryItem LinkUrl="http://www.youtube.com/v/FzRH3iTQPrk?version=3" ImageUrl="http://cdn.wijmo.com/images/panda.png" />
            <cc1:C1GalleryItem LinkUrl="http://www.youtube.com/v/z3U0udLH974?version=3" ImageUrl="http://cdn.wijmo.com/images/talkingcats.png" />
        </Items>
    </cc1:C1Gallery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates that we can play videos with <strong>C1Gallery </strong>control.
    </p>
    <p>
        The property <b>Mode</b> should set to "Swf".
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
