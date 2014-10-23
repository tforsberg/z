<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Preview.aspx.cs" Inherits="ControlExplorer.C1Carousel.Preview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Carousel ID="C1Carousel1" runat="server" Width="500px" Height="300px" Display="1"
        Loop="false" Preview="true" ShowControlsOnHover="false" EnableTheming="True">
        <Items>
            <wijmo:C1CarouselItem ID="C1CarouselItem1" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/1"
                Caption="Sport 1">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem2" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/2"
                Caption="Sport 2">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem3" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/3"
                Caption="Sport 3">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem4" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/4"
                Caption="Sport 4">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem5" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/5"
                Caption="Sport 5">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem6" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/6"
                Caption="Sport 6">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem7" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/7"
                Caption="Sport 7">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem8" runat="server" ImageUrl="http://lorempixum.com/750/300/sports/8"
                Caption="Sport 8">
            </wijmo:C1CarouselItem>
        </Items>
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to use the preview option to show a preview of the
        previous and next images in the <strong>C1Carousel </strong>control.</p>
</asp:Content>
