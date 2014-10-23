<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Orientation.aspx.cs"
	Inherits="ControlExplorer.C1Gallery.Orientation" Title="Orientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
	TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h3>Orientation is "Vertical", at left side</h3>
	<div>
		<cc1:C1Gallery ID="Gallery" runat="server" ShowTimer="false" Width="750" Height="200" ShowCounter="false"
			ThumbnailOrientation="Vertical" ThumbsDisplay="2" ShowPager="false" ThumbnailDirection="Before" ThumbsLength="150">
			<Items>
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/1" ImageUrl="http://lorempixum.com/200/150/sports/1" Title="Word Caption 1" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/2" ImageUrl="http://lorempixum.com/200/150/sports/2" Title="Word Caption 2" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/3" ImageUrl="http://lorempixum.com/200/150/sports/3" Title="Word Caption 3" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/4" ImageUrl="http://lorempixum.com/200/150/sports/4" Title="Word Caption 4" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/5" ImageUrl="http://lorempixum.com/200/150/sports/5" Title="Word Caption 5" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/6" ImageUrl="http://lorempixum.com/200/150/sports/6" Title="Word Caption 6" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/7" ImageUrl="http://lorempixum.com/200/150/sports/7" Title="Word Caption 7" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/8" ImageUrl="http://lorempixum.com/200/150/sports/8" Title="Word Caption 8" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/9" ImageUrl="http://lorempixum.com/200/150/sports/9" Title="Word Caption 9" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/10" ImageUrl="http://lorempixum.com/200/150/sports/10" Title="Word Caption 10" />
			</Items>
		</cc1:C1Gallery>
	</div>
	<h3>Orientation is "Vertical", at right side
	</h3>
	<div>
		<cc1:C1Gallery runat="server" Width="750" Height="200" ID="GelleryRV" ThumbnailOrientation="Vertical" ThumbsDisplay="2" ShowCounter="false" ThumbsLength="150" ShowTimer="false">
			<Items>
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/1" ImageUrl="http://lorempixel.com/200/150/city/1" Title="Word Caption 1" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/2" ImageUrl="http://lorempixel.com/200/150/city/2" Title="Word Caption 2" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/3" ImageUrl="http://lorempixel.com/200/150/city/3" Title="Word Caption 3" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/4" ImageUrl="http://lorempixel.com/200/150/city/4" Title="Word Caption 4" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/5" ImageUrl="http://lorempixel.com/200/150/city/5" Title="Word Caption 5" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/6" ImageUrl="http://lorempixel.com/200/150/city/6" Title="Word Caption 6" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/7" ImageUrl="http://lorempixel.com/200/150/city/7" Title="Word Caption 7" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/8" ImageUrl="http://lorempixel.com/200/150/city/8" Title="Word Caption 8" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/9" ImageUrl="http://lorempixel.com/200/150/city/9" Title="Word Caption 9" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixel.com/750/300/city/10" ImageUrl="http://lorempixel.com/200/150/city/10" Title="Word Caption 10" />
			</Items>
		</cc1:C1Gallery>
	</div>
	<h3>Orientation is "Horizontal", at top</h3>
	<div>
		<cc1:C1Gallery ID="C1Gallery1" Width="750" Height="411" runat="server" ThumbnailDirection="Before" ShowCounter="false" ShowTimer="false">
			<Items>
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/1" ImageUrl="http://lorempixum.com/200/150/sports/1" Title="Word Caption 1" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/2" ImageUrl="http://lorempixum.com/200/150/sports/2" Title="Word Caption 2" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/3" ImageUrl="http://lorempixum.com/200/150/sports/3" Title="Word Caption 3" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/4" ImageUrl="http://lorempixum.com/200/150/sports/4" Title="Word Caption 4" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/5" ImageUrl="http://lorempixum.com/200/150/sports/5" Title="Word Caption 5" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/6" ImageUrl="http://lorempixum.com/200/150/sports/6" Title="Word Caption 6" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/7" ImageUrl="http://lorempixum.com/200/150/sports/7" Title="Word Caption 7" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/8" ImageUrl="http://lorempixum.com/200/150/sports/8" Title="Word Caption 8" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/9" ImageUrl="http://lorempixum.com/200/150/sports/9" Title="Word Caption 9" />
				<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/10" ImageUrl="http://lorempixum.com/200/150/sports/10" Title="Word Caption 10" />
			</Items>
		</cc1:C1Gallery>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how the orientation of the thumbnails can be determined using the <b>ThumbnailOrientation</b> property.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
