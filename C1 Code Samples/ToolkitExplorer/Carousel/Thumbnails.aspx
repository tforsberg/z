<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Thumbnails.aspx.cs" Inherits="ToolkitExplorer.Carousel.Thumbnails" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="carousel" runat="server" Font-Overline="False" Title="Overview" Width="750"
		Height="300">
		<ul>
			<li>
				<img src="http://www.componentone.com/newimages/Walls/StudioEnterprise2011v2/productheaderse2011.png" />
				<span>
					<h3>
						Word Caption 1</h3>
					Word Caption 1</span> </li>
			<li>
				<img src="http://www.componentone.com/newimages/Walls/WindowsPhone2011/productheader_windowsphone7.png" />
				<span>
					<h3>
						Word Caption 2</h3>
					Word Caption 2</span> </li>
			<li>
				<img src="http://www.componentone.com/newimages/Walls/SilverlightWPF2011v2/productheader_slwpf_2011v2.png" />
				<span>
					<h3>
						Word Caption 3</h3>
					Word Caption 3</span> </li>
		</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel" ShowCaption="false"
		ShowPager="true" PagerType="Thumbnails">
		<PagerPosition>
			<My Left="Left" Top="Bottom" />
			<At Left="Left" Top="Bottom" />
			<Offset Left="0" Top="50" />
		</PagerPosition>
		<Thumbnails Images="http://www.componentone.com/newimages/walls/StudioEnterprise2011v2/secharts2011_thumb.png,http://www.componentone.com/newimages/walls/WindowsPhone2011/wp72011_thumb.png,http://www.componentone.com/newimages/Walls/SilverlightWPF2011v2/slwpf_thumb.png"
			OnClientClick="_click" OnClientMouseOut="_mouseOut" OnClientMouseOver="_mouseOver" />
	</wijmo:C1CarouselExtender>
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
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	This sample illustrates how to use custom image thumbnails for paging and previewing
	carousel panes.
	<ul>
		<li>The property <b>Thumbnails</b> is set to determine the images of the thumbnails.</li>
	</ul>
</asp:Content>
