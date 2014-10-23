<%@ Page Title="Orientation" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Orientation.aspx.cs" Inherits="ControlExplorer.C1Carousel.Orientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Carousel ID="C1Carousel1" runat="server" Width="720px" Height="150px" Display="4"
        EnableTheming="True">
        <Items>
            <cc1:C1CarouselItem runat="server" Caption="Pic 1" ImageUrl="http://lorempixum.com/200/150/sports/1">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem runat="server" Caption="Pic 2" ImageUrl="http://lorempixum.com/200/150/sports/2">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem runat="server" Caption="Pic 3" ImageUrl="http://lorempixum.com/200/150/sports/3">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem runat="server" Caption="Pic 4" ImageUrl="http://lorempixum.com/200/150/sports/4">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem runat="server" Caption="Pic 5" ImageUrl="http://lorempixum.com/200/150/sports/5">
            </cc1:C1CarouselItem>
        </Items>
    </cc1:C1Carousel>
    <br />
    <br />
    <br />
    <br />
    <cc1:C1Carousel ID="C1Carousel2" ButtonPosition="Inside" Orientation="Vertical"
        runat="server" ShowCaption="true" ShowPager="false" ShowControls="true" Width="160px"
        Height="640px" Display="4">
        <Items>
            <cc1:C1CarouselItem ID="C1CarouselItem1" runat="server" Caption="Pic 1" ImageUrl="http://lorempixum.com/200/150/sports/1">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem ID="C1CarouselItem2" runat="server" Caption="Pic 2" ImageUrl="http://lorempixum.com/200/150/sports/2">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem ID="C1CarouselItem3" runat="server" Caption="Pic 3" ImageUrl="http://lorempixum.com/200/150/sports/3">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem ID="C1CarouselItem4" runat="server" Caption="Pic 4" ImageUrl="http://lorempixum.com/200/150/sports/4">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem ID="C1CarouselItem5" runat="server" Caption="Pic 5" ImageUrl="http://lorempixum.com/200/150/sports/5">
            </cc1:C1CarouselItem>
        </Items>
    </cc1:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the orientation of the items of <strong>C1Carousel</strong>.
    </p>
    <ul>
        <li>The property <strong>Orientation</strong> is set to determine the orientation of the images.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
