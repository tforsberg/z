<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Videos.aspx.cs" Inherits="ControlExplorer.C1Carousel.Videos" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Carousel ID="C1Carousel1" runat="server" Width="600px" Height="338px" Display="1"
        EnableTheming="True"  CssClass="ui-corner-all ui-widget-content" ShowControlsOnHover="true">
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
        <Items>
            <wijmo:C1CarouselItem ID="C1CarouselItem1" runat="server">
                <Template>
                    <iframe src="https://www.youtube.com/v/J---aiyznGQ?version=3"
                                width="600" height="338" frameborder="0"></iframe>
                </Template>
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem2" runat="server">
                <Template>
                    <iframe src="http://www.youtube.com/v/FzRH3iTQPrk?version=3"
                                width="600" height="338" frameborder="0"></iframe>
                </Template>
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem3" runat="server">
                <Template>
                    <iframe src="http://www.youtube.com/v/z3U0udLH974?version=3"
                                width="600" height="338" frameborder="0"></iframe>
                </Template>
            </wijmo:C1CarouselItem>
        </Items>
    </wijmo:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>This sample demonstrates how to play a video in a <strong>C1Carousel</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
