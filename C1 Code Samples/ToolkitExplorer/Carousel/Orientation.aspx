<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Orientation.aspx.cs" Inherits="ToolkitExplorer.Carousel.Orientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="carousel1" runat="server" Font-Overline="False" Title="Overview" Width="500"
        Height="90">
        <ul>
            <li>
                <img alt="1" src="http://lorempixum.com/200/150/sports/1" title="Word1" /><span>Word
                    Caption 1</span></li>
            <li>
                <img alt="2" src="http://lorempixum.com/200/150/sports/2" title="Word2" /><span>Word
                    Caption 2</span></li>
            <li>
                <img alt="3" src="http://lorempixum.com/200/150/sports/3" title="Word3" /><span>Word
                    Caption 3</span></li>
            <li>
                <img alt="4" src="http://lorempixum.com/200/150/sports/4" title="Word4" /><span>Word
                    Caption 4</span></li>
            <li>
                <img alt="5" src="http://lorempixum.com/200/150/sports/5" title="Word5" /><span>Word
                    Caption 5</span></li>
            <li>
                <img alt="6" src="http://lorempixum.com/200/150/sports/6" title="Word6" /><span>Word
                    Caption 6</span></li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="carousel2" runat="server" Font-Overline="False" Title="Overview" Width="120"
        Height="400">
        <ul>
            <li>
                <img alt="1" src="http://lorempixum.com/200/150/sports/1" title="Word1" /><span>Word
                    Caption 1</span></li>
            <li>
                <img alt="2" src="http://lorempixum.com/200/150/sports/2" title="Word2" /><span>Word
                    Caption 2</span></li>
            <li>
                <img alt="3" src="http://lorempixum.com/200/150/sports/3" title="Word3" /><span>Word
                    Caption 3</span></li>
            <li>
                <img alt="4" src="http://lorempixum.com/200/150/sports/4" title="Word4" /><span>Word
                    Caption 4</span></li>
            <li>
                <img alt="5" src="http://lorempixum.com/200/150/sports/5" title="Word5" /><span>Word
                    Caption 5</span></li>
            <li>
                <img alt="6" src="http://lorempixum.com/200/150/sports/6" title="Word6" /><span>Word
                    Caption 6</span></li>
        </ul>
    </asp:Panel>
    <wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" Orientation="Horizontal"
        Display="4" Step="2" TargetControlID="carousel1">
    </wijmo:C1CarouselExtender>
    <wijmo:C1CarouselExtender runat="server" ID="CarouselExtender2" Orientation="Vertical"
        Display="4" Step="2" TargetControlID="carousel2">
    </wijmo:C1CarouselExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the orinetation of the items of carousel.
    </p>
    <ul>
        <li>The property <b>Orinetation</b> is set to determine the orientation of the images.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
