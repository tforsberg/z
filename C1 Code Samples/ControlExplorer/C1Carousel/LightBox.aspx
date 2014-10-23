<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="LightBox.aspx.cs" Inherits="ControlExplorer.C1Carousel.LightBox" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function onItemClick(event, ui) {
            var a = ui.el.children("a"), img = a.children("img:eq(0)"),
			url = a.attr("href"), title = img.attr("title");
            if (!a.is(":wijmo-wijlightbox")) {
                a.attr("rel", "wijlightbox[stock];player=img");
                var text = a.siblings(".wijmo-wijcarousel-text").children("span").text();
                a.children("img").attr("alt", text);
                a.wijlightbox();
            }
            a.trigger("click");
            event.preventDefault();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Carousel ID="C1Carousel1" runat="server" Display="5" Step="4" Loop="true"
        EnableTheming="True" OnClientItemClick="onItemClick" Width="650px" Height="90px">
        <Items>
            <wijmo:C1CarouselItem ID="C1CarouselItem1" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/1"
                LinkUrl="http://lorempixum.com/750/300/sports/1" Caption="Sports 1">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem2" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/2"
                LinkUrl="http://lorempixum.com/750/300/sports/2" Caption="Sports 2">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem3" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/3"
                LinkUrl="http://lorempixum.com/750/300/sports/3" Caption="Sports 3">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem4" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/4"
                LinkUrl="http://lorempixum.com/750/300/sports/4" Caption="Sports 4">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem5" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/5"
                LinkUrl="http://lorempixum.com/750/300/sports/5" Caption="Sports 5">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem6" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/6"
                LinkUrl="http://lorempixum.com/750/300/sports/6" Caption="Sports 6">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem7" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/7"
                LinkUrl="http://lorempixum.com/750/300/sports/7" Caption="Sports 7">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem8" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/8"
                LinkUrl="http://lorempixum.com/750/300/sports/8" Caption="Sports 8">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem9" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/9"
                LinkUrl="http://lorempixum.com/750/300/sports/9" Caption="Sports 9">
            </wijmo:C1CarouselItem>
            <wijmo:C1CarouselItem ID="C1CarouselItem10" runat="server" ImageUrl="http://lorempixum.com/200/150/sports/10"
                LinkUrl="http://lorempixum.com/750/300/sports/10" Caption="Sports 10">
            </wijmo:C1CarouselItem>
        </Items>
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
    <wijmo:C1LightBox runat="server" CssClass="ui-helper-hidden-accessible">
    </wijmo:C1LightBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how the wijlightbox widget can be integrated with the <strong>
            C1Carousel </strong>control to show images from a carousel in a lightbox.</p>
</asp:Content>
