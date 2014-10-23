<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Preview.aspx.cs"
    Inherits="ToolkitExplorer.Carousel.Preview" Title="Untitled Page" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="carousel" runat="server" Font-Overline="False" Title="Overview" Width="500"
        Height="200">
        <ul>
            <li>
                <img src="http://lorempixum.com/750/300/sports/1" />
                <span>
                    <h3>
                        Word Caption 1</h3>
                    Word Caption 1</span> </li>
            <li>
                <img src="http://lorempixum.com/750/300/sports/2"/>
                <span>
                    <h3>
                        Word Caption 2</h3>
                    Word Caption 2</span> </li>
            <li>
                <img src="http://lorempixum.com/750/300/sports/3"/>
                <span>
                    <h3>
                        Word Caption 3</h3>
                    Word Caption 3</span> </li>
            <li>
                <img src="http://lorempixum.com/750/300/sports/4"/>
                <span>
                    <h3>
                        Word Caption 4</h3>
                    Word Caption 4</span> </li>
           <li>
                <img src="http://lorempixum.com/750/300/sports/5"/>
                <span>
                    <h3>
                        Word Caption 5</h3>
                    Word Caption 5</span> </li>
                   <li>
                <img src="http://lorempixum.com/750/300/sports/6"/>
                <span>
                    <h3>
                        Word Caption 6</h3>
                    Word Caption 6</span> </li>
        </ul>
    </asp:Panel>
    <wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel"
        Preview="true" Loop="false">
    </wijmo:C1CarouselExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        In this sample, you will see the preview mode of carousel, the next and previous
        picture will show partially for preview.
    </p>
    <p>
        Preview mode is allowed if the property <strong>Preview</strong> is set to true
        and <strong>Loop</strong> is set to false.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
