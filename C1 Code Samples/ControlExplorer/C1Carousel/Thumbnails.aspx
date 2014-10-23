<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Thumbnails.aspx.cs" Inherits="ControlExplorer.C1Carousel.Thumbnails" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function _click() {
            var li = $(this);
            li.css({ "margin-top": "" });
            li.siblings("li")
            .removeClass("ui-state-active").css({ "margin-top": "" });
        }

        function _mouseOver() {
            var li = $(this);
            if (!li.hasClass("ui-state-active")) {
                li.stop().animate({ "margin-top": 10 }, 500);
            }
        }

        function _mouseOut() {
            var li = $(this);
            if (!li.hasClass("ui-state-active")) {
                li.stop().animate({
                    "margin-top": 0 
                }, 500, function () {
                    li.css("margin-top", "")
                });
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Carousel ID="C1Carousel1" runat="server" Width="750px" Height="300px" Display="1"
        ShowPager="true" PagerType="Thumbnails" ShowCaption="false" EnableTheming="True">
        <PagerPosition>
            <My Left="Left" Top="Bottom" />
            <At Left="Left" Top="Bottom" />
            <Offset Left="0" Top="50" />
        </PagerPosition>
        <Thumbnails Images="http://www.componentone.com/newimages/walls/StudioEnterprise2011v2/secharts2011_thumb.png,http://www.componentone.com/newimages/walls/WindowsPhone2011/wp72011_thumb.png,http://www.componentone.com/newimages/Walls/SilverlightWPF2011v2/slwpf_thumb.png"
            OnClientClick="_click" OnClientMouseOut="_mouseOut" OnClientMouseOver="_mouseOver" />
        <Items>
            <cc1:C1CarouselItem ID="C1CarouselItem1" runat="server" ImageUrl="http://www.componentone.com/newimages/Walls/StudioEnterprise2011v2/productheaderse2011.png"
                Caption="Sport 1">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem ID="C1CarouselItem2" runat="server" ImageUrl="http://www.componentone.com/newimages/Walls/WindowsPhone2011/productheader_windowsphone7.png"
                Caption="Sport 2">
            </cc1:C1CarouselItem>
            <cc1:C1CarouselItem ID="C1CarouselItem3" runat="server" ImageUrl="http://www.componentone.com/newimages/Walls/SilverlightWPF2011v2/productheader_slwpf_2011v2.png"
                Caption="Sport 3">
            </cc1:C1CarouselItem>
        </Items>
    </cc1:C1Carousel>
	<br/>
	<br/>
	<br/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to use custom image thumbnails for paging and previewing
        carousel panes.</p>
    <ul>
        <li>The property <b>Thumbnails</b> is set to determine the images of the thumbnails.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
