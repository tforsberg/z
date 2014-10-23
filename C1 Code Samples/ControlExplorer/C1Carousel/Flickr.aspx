<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Flickr.aspx.cs" Inherits="ControlExplorer.C1Carousel.Flickr" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
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

                $("#<%=C1Carousel1.ClientID%>").c1carousel("option", "data", images);
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Carousel ID="C1Carousel1" runat="server" Width="750px" Height="300px" Display="3"
        ShowCaption="false" EnableTheming="True" OnClientLoadCallback="loadItems">
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
    </wijmo:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how you can load images from a photo sharing site, like
        Flickr, into a <strong>C1Carousel </strong>control.</p>
</asp:Content>
