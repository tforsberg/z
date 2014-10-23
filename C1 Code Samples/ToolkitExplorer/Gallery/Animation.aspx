<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ToolkitExplorer.Gallery.Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gallery"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
    	$(document).ready(function () {
    		var transitions = {
    			animated: "fade",
    			duration: 1000,
    			easing: null
    		}

    		$('#<%=showEffectTypes.ClientID%>').change(function () {
    			var ee = $("#<%=showEffectTypes.ClientID%> option:selected").val();
    			$.extend(transitions, { animated: ee });
    			$("#<%=gallery.ClientID%>").wijgallery("option", "transitions", transitions);
    		});
    	});
    </script>
    <h3>
        Animation</h3>
    <asp:Panel ID="gallery" runat="server" Font-Overline="False" Title="Overview" Width="750"
        Height="256">
        <ul class="">
            <li class=""><a href="http://lorempixum.com/750/300/sports/1">
                <img alt="1" src="http://lorempixum.com/200/150/sports/1" title="Word Caption 1" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/2">
                <img alt="2" src="http://lorempixum.com/200/150/sports/2" title="Word Caption 2" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/3">
                <img alt="3" src="http://lorempixum.com/200/150/sports/3" title="Word Caption 3" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/4">
                <img alt="4" src="http://lorempixum.com/200/150/sports/4" title="Word Caption 4" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/5">
                <img alt="5" src="http://lorempixum.com/200/150/sports/5" title="Word Caption 5" />
            </a></li>
            <li class=""><a href="http://lorempixum.com/750/300/sports/6">
                <img alt="6" src="http://lorempixum.com/200/150/sports/6" title="Word Caption 6" />
            </a></li>
        </ul>
    </asp:Panel>
    <wijmo:C1GalleryExtender runat="server" ID="CarouselExtender2" ShowTimer="True"
        ThumbnailOrientation="Vertical" ThumbsDisplay="3" ShowPager="false" TargetControlID="gallery">
        <Transitions>
            <Animated Disabled="false" Effect="slide" />
        </Transitions>
    </wijmo:C1GalleryExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
        <label for="showingEffectTypes">
            Animation
        </label>
        <asp:DropDownList ID="showEffectTypes" runat="server">
            <asp:ListItem Value="blind" Selected="True">Blind</asp:ListItem>
            <asp:ListItem Value="clip">Clip</asp:ListItem>
            <asp:ListItem Value="drop">Drop</asp:ListItem>
            <asp:ListItem Value="explode">Explode</asp:ListItem>
            <asp:ListItem Value="fade">Fade</asp:ListItem>
            <asp:ListItem Value="fold">Fold</asp:ListItem>
            <asp:ListItem Value="highlight">Highlight</asp:ListItem>
            <asp:ListItem Value="puff">Puff</asp:ListItem>
            <asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
            <asp:ListItem Value="scale">Scale</asp:ListItem>
            <asp:ListItem Value="size">Size</asp:ListItem>
            <asp:ListItem Value="slide">Slide</asp:ListItem>
        </asp:DropDownList>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates animation effects when transitioning from one image to
        the next.
    </p>
    Set following properties to support this feature;
    <ul>
        <li><b>Transitions</b></li>
    </ul>
</asp:Content>
