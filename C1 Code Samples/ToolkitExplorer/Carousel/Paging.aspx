<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Paging.aspx.cs" Inherits="ToolkitExplorer.Carousel.Paging" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Carousel"
	TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="carousel1" runat="server" Width="750px" Height="300px">
		<ul>
			<li>
				<img alt="1" src="http://lorempixum.com/750/300/sports/1" title="Word" /><span>Word Caption 1</span></li>
			<li>
				<img alt="2" src="http://lorempixum.com/750/300/sports/2" title="Word2" /><span>Word Caption 2</span></li>
			<li>
				<img alt="3" src="http://lorempixum.com/750/300/sports/3" title="Word3" /><span>Word Caption 3</span></li>
			<li>
				<img alt="4" src="http://lorempixum.com/750/300/sports/4" title="Word4" /><span>Word Caption 4</span></li>
			<li>
				<img alt="5" src="http://lorempixum.com/750/300/sports/5" title="Word5" /><span>Word Caption 5</span></li>
			</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="CarouselExtender1" TargetControlID="carousel1" 
		Display="1" ShowPager = "true" PagerType = "Numbers">
	</wijmo:C1CarouselExtender>
	<br /><br />
	<h3>Dots</h3><br />
	<asp:Panel ID="carousel2" runat="server" Width="750px" Height="300px">
		<ul>
			<li>
				<img alt="1" src="http://lorempixum.com/750/300/city/1" title="Word" /><span>Word Caption 1</span></li>
			<li>
				<img alt="2" src="http://lorempixum.com/750/300/city/2" title="Word2" /><span>Word Caption 2</span></li>
			<li>
				<img alt="3" src="http://lorempixum.com/750/300/city/3" title="Word3" /><span>Word Caption 3</span></li>
			<li>
				<img alt="4" src="http://lorempixum.com/750/300/city/4" title="Word4" /><span>Word Caption 4</span></li>
			<li>
				<img alt="5" src="http://lorempixum.com/750/300/city/5" title="Word5" /><span>Word Caption 5</span></li>
		</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="C1CarouselExtender1" TargetControlID="carousel2" 
		Display="1" ShowPager = "true" PagerType = "Dots">
		<PagerPosition>
			<My Left="Center" Top = "Top"></My>
			<At Left="Center" Top="Bottom"></At>
		</PagerPosition>
	</wijmo:C1CarouselExtender>
	<br /><h3>Slider</h3><br />
	<asp:Panel ID="carousel3" runat="server" Width="750px" Height="300px">
		<ul>
			<li>
				<img alt="1" src="http://lorempixum.com/750/300/abstract/1" title="Word" /><span>Word Caption 1</span></li>
			<li>
				<img alt="2" src="http://lorempixum.com/750/300/abstract/2" title="Word2" /><span>Word Caption 2</span></li>
			<li>
				<img alt="3" src="http://lorempixum.com/750/300/abstract/3" title="Word3" /><span>Word Caption 3</span></li>
			<li>
				<img alt="4" src="http://lorempixum.com/750/300/abstract/4" title="Word4" /><span>Word Caption 4</span></li>
			<li>
				<img alt="5" src="http://lorempixum.com/750/300/abstract/5" title="Word5" /><span>Word Caption 5</span></li>
		</ul>
	</asp:Panel>
	<wijmo:C1CarouselExtender runat="server" ID="C1CarouselExtender2" TargetControlID="carousel3" 
		Display="1" ShowPager = "true" PagerType = "Slider">
		<PagerPosition>
			<My Left="Center" Top = "Top"></My>
			<At Left="Center" Top="Bottom"></At>
		</PagerPosition>
	</wijmo:C1CarouselExtender>
	<br/><br/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
</asp:Content>
