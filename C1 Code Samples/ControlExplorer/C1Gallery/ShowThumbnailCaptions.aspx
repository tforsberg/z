<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="ShowThumbnailCaptions.aspx.cs" Inherits="ControlExplorer.C1Gallery.ShowThumbnailCaptions" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <cc1:C1Gallery ID="gallery" runat="server" ShowTimer="True" Width="750px" Height="416px"
        ThumbsDisplay="4" ShowPager="false" ShowThumbnailCaptions="true">
        <Items>
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/1" ImageUrl="http://lorempixum.com/200/150/sports/1"
                Caption="Word Caption 1" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/2" ImageUrl="http://lorempixum.com/200/150/sports/2"
                Caption="Word Caption 2" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/3" ImageUrl="http://lorempixum.com/200/150/sports/3"
                Caption="Word Caption 3" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/4" ImageUrl="http://lorempixum.com/200/150/sports/4"
                Caption="Word Caption 4" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/5" ImageUrl="http://lorempixum.com/200/150/sports/5"
                Caption="Word Caption 5" />
            <cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/6" ImageUrl="http://lorempixum.com/200/150/sports/6"
                Caption="Word Caption 6" />
        </Items>
    </cc1:C1Gallery>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<ul>
				<li><asp:CheckBox ID="cbShowThumbCap" runat="server" Text="ShowThumbnailCaptions" Checked="true"  AutoPostBack="true"
        oncheckedchanged="cbShowThumbCap_CheckedChanged" /></li>
			</ul>
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to show the caption of thumbnails.
    </p>
    <p>
        The property <b>ShowThumbnailCaptions</b> is set to determine 
        whether the caption of thumbnails should be shown.
    </p>
</asp:Content>
