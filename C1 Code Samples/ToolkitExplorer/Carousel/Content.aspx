<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Content.aspx.cs" Inherits="ToolkitExplorer.Carousel.Content" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		#<%=carousel.ClientID%> img
		{
			float: left;
			background: #fafafa;
			border: solid 1px #999DB2;
			-moz-border-radius: 4px;
			-webkit-border-radius: 4px;
			border-radius: 4px;
			padding: 5px;
			margin: 0 1em 0 0;
		}
		#<%=carousel.ClientID%> li
		{
			padding: 1em 2em;
		}
		#<%=carousel.ClientID%> .image-shadow
		{
			float: left;
			padding-bottom: 9px;
		}
		#<%=carousel.ClientID%> p
		{
			font-style: italic;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="carousel" runat="server" CssClass="ui-corner-all ui-widget-content" Width="750px"
		Height="300px">
		<ul>
			<li>
				<div class="image-shadow">
					<img src="http://lorempixum.com/200/150/city/1" alt="City 1" />
				</div>
				<h3>
					Lorem Ipsum</h3>
				<p>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque gravida, justo
					in fringilla cursus, dui orci ornare augue, at placerat odio lectus vitae lorem.
					Duis consequat mauris erat, vel vulputate velit. </p>
			</li>
			<li>
				<div class="image-shadow">
					<img src="http://lorempixum.com/200/150/city/2" alt="City 2" />
				</div>
				<h3>
					Vestibulum</h3>
				<p>
					Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
					Curae; Integer lobortis venenatis porttitor. Phasellus semper orci vel nibh aliquam
					sed tempor felis cursus.</p>
			</li>
			<li>
				<div class="image-shadow">
					<img src="http://lorempixum.com/200/150/city/3" alt="City 3" />
				</div>
				<h3>
					Phasellus</h3>
				<p>
					Phasellus ornare nulla quis tellus euismod sit amet tincidunt nulla tincidunt. In
					hac habitasse platea dictumst. Integer et eros in quam mollis tempor. Duis facilisis
					vestibulum arcu.</p>
			</li>
			<li>
				<div class="image-shadow">
					<img src="http://lorempixum.com/200/150/city/4" alt="City 4" />
				</div>
				<h3>
					Venenatis</h3>
				<p>
					Vestibulum venenatis faucibus eros, vitae vulputate ipsum tempor ut. Donec ut ligula
					a metus volutpat sagittis. Duis sodales, lorem nec suscipit imperdiet, sapien metus
					tempor nibh, dapibus pulvinar lorem lacus molestie lacus.
				</p>
			</li>
		</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel" Display="1">
	</wijmo:C1CarouselExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
</asp:Content>
