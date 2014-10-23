<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Flickr.aspx.cs" Inherits="ToolkitExplorer.Carousel.Flickr" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
<script type="text/javascript">
	var count = 15,
		tags = "Siberian Tiger";

	function loadItems() {
		$.getJSON("http://api.flickr.com/services/feeds/photos_public.gne?tags=" + tags + "&tagmode=any&format=json&jsoncallback=?", function (data) {
			var images = [];
			$.each(data.items, function (idx, item) {
				var img = {};
				img.imageUrl = item.media.m;
				img.caption = item.title;
				images.push(img);

				if (idx == count - 1) {
					return false;
				}
			});

			$("#<%=carousel.ClientID%>").wijcarousel("option", "data", images);
		});
	}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="carousel" runat="server" CssClass="ui-corner-all ui-widget-content" Width="750px"
		Height="300px">
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel" Display="3" ShowCaption = "false"
		OnClientLoadCallback = "loadItems">
	</wijmo:C1CarouselExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
</asp:Content>
