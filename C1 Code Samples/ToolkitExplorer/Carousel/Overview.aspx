<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.Carousel.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="carousel" runat="server" Font-Overline="False" Title="Overview" Width="750px"
        Height="300px">
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
        </ul>
    </asp:Panel>
    <wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel">
    </wijmo:C1CarouselExtender>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#prevBtn").click(function () {
                $("#<%=carousel.ClientID%>").wijcarousel("previous");
            });
            $("#nextBtn").click(function () {
                $("#<%=carousel.ClientID%>").wijcarousel("next");
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the default <strong>carousel </strong>extander, which is
        useful for displaying images or other contents in a list. the carousel has next/prev
        button to navigate the next or previous images, it can be played automaticly.
        Other samples in the <strong>carousel</strong> section will demonstrate how to preview the next and previous picture, and change orientation of the carousel.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <input id="nextBtn" value="Next" type="button" /><input id="prevBtn" value="Previous"
        type="button" />
</asp:Content>
