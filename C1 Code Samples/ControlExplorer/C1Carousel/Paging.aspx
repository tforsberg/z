<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Paging.aspx.cs" Inherits="ControlExplorer.C1Carousel.Paging" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h3>
        Numbers</h3>
    <wijmo:C1Carousel ID="C1Carousel1" runat="server" Width="750px" Height="300px" Display="1"
        ShowPager="true" PagerType="Numbers" EnableTheming="True">
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
        </Items>
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
    <br />
    <h3>
        Dots</h3>
    <br />
    <wijmo:C1Carousel ID="C1Carousel2" runat="server" Width="750px" Height="300px" Display="1"
        ShowPager="true" PagerType="Dots" EnableTheming="True">
        <Items>
            <wijmo:C1CarouselItem ID="C1CarouselItem7" runat="server" ImageUrl="http://lorempixum.com/750/300/city/1"
                Caption="City 1">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem8" runat="server" ImageUrl="http://lorempixum.com/750/300/city/2"
                Caption="City 2">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem9" runat="server" ImageUrl="http://lorempixum.com/750/300/city/3"
                Caption="City 3">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem10" runat="server" ImageUrl="http://lorempixum.com/750/300/city/4"
                Caption="City 4">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem11" runat="server" ImageUrl="http://lorempixum.com/750/300/city/5"
                Caption="City 5">
            </wijmo:C1CarouselItem>
        </Items>
        <PagerPosition>
            <My Left="Center" Top="Top"></My>
            <At Left="Center" Top="Bottom"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
    <br />
    <h3>
        Slider</h3>
    <br />
    <wijmo:C1Carousel ID="C1Carousel3" runat="server" Width="750px" Height="300px" Display="1"
        ShowPager="true" PagerType="Slider" EnableTheming="True">
        <Items>
            <wijmo:C1CarouselItem ID="C1CarouselItem13" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/1"
                Caption="World 1">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem14" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/2"
                Caption="World 2">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem15" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/3"
                Caption="World 3">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem16" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/4"
                Caption="World 4">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem17" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/5"
                Caption="World 5">
            </wijmo:C1CarouselItem>
        </Items>
        <PagerPosition>
            <My Left="Center" Top="Top"></My>
            <At Left="Center" Top="Bottom"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
    <br />
    <br />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how different type of paging can be applied to the <strong>
            C1Carousel </strong>control using the pagerType option.</p>
</asp:Content>
