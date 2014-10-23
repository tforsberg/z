<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="LightBox.aspx.cs" Inherits="ToolkitExplorer.Carousel.LightBox" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type = "text/javascript">
		function onItemClick(event, ui) {
			var a = ui.el.children("a"), img = a.children("img:eq(0)"),
                    url = a.attr("href"), title = img.attr("title");
			if (!a.is(":wijmo-wijlightbox")) {
			    a.wijlightbox();
			}
			a.trigger("click");
			event.preventDefault();
		}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="carousel" runat="server" CssClass="ui-corner-all ui-widget-content" Width="650px"
		Height="90px">
		<ul>
			<li><a href="http://lorempixum.com/750/300/sports/1">
				<img alt="1" src="http://lorempixum.com/200/150/sports/1" title="Word Caption 1" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/2">
				<img alt="2" src="http://lorempixum.com/200/150/sports/2" title="Word Caption 2" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/3">
				<img alt="3" src="http://lorempixum.com/200/150/sports/3" title="Word Caption 3" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/4">
				<img alt="4" src="http://lorempixum.com/200/150/sports/4" title="Word Caption 4" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/5">
				<img alt="5" src="http://lorempixum.com/200/150/sports/5" title="Word Caption 5" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/6">
				<img alt="6" src="http://lorempixum.com/200/150/sports/6" title="Word Caption 6" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/7">
				<img alt="7" src="http://lorempixum.com/200/150/sports/7" title="Word Caption 7" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/8">
				<img alt="8" src="http://lorempixum.com/200/150/sports/8" title="Word Caption 8" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/9">
				<img alt="9" src="http://lorempixum.com/200/150/sports/9" title="Word Caption 9" />
			</a></li>
			<li><a href="http://lorempixum.com/750/300/sports/10">
				<img alt="10" src="http://lorempixum.com/200/150/sports/10" title="Word Caption 10" />
			</a></li>
		</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel" 
		Display="5" Step = "4" Loop ="false" OnClientItemClick = "onItemClick">
	</wijmo:C1CarouselExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
</asp:Content>
