<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Carousel.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Carousel ID="C1Carousel1" runat="server" Width="750px" Height="300px" Display="1"
        EnableTheming="True">
        <Items>
            <wijmo:C1CarouselItem runat="server" ImageUrl="http://lorempixum.com/750/300/sports/1" Caption="Sport 1">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem runat="server" ImageUrl="http://lorempixum.com/750/300/sports/2" Caption="Sport 2">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem runat="server" ImageUrl="http://lorempixum.com/750/300/sports/3" Caption="Sport 3">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem runat="server" ImageUrl="http://lorempixum.com/750/300/sports/4" Caption="Sport 4">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem runat="server" ImageUrl="http://lorempixum.com/750/300/sports/5" Caption="Sport 5">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem runat="server" ImageUrl="http://lorempixum.com/750/300/sports/6" Caption="Sport 6">
            </wijmo:C1CarouselItem>
        </Items>
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the default <strong>C1Carousel </strong>control, which is useful for displaying images or other content in a list. 
        The carousel has next/prev button to navigate images, it can also be played automatically. 
        Other samples in the <strong>C1Carousel</strong> section will demonstrate how to use data binding, load data on demand, and change orientation of the carousel.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
