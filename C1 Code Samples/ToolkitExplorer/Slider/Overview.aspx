<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="Slider_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Slider"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		.sliderContainer
		{
		}
		.layout
		{
			float: left;
			margin: 0 10px;
		}
		.layout h6
		{
			margin-bottom: 10px;
		}
		.header2
		{
			margin-bottom: 10px;
		}
		.hSlider
		{
			width: 200px;
		}
		.vSlider
		{
			height: 200px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div class="sliderContainer ui-helper-clearfix">
		<div class="layout">
			<h2 class = "header2">
				Horizontal Slider</h2>
				<asp:TextBox ID="hSlider" runat="server" CssClass="hSlider" Text="50">
				</asp:TextBox>
				<wijmo:C1SliderExtender runat="server" ID="SliderExtender1" TargetControlID="hSlider"
					Orientation="Horizontal" />
		</div>
		<div class="layout">
			<h2 class = "header2">
				Vertical Slider</h2>
				<asp:TextBox ID="vSlider" runat="server" CssClass="vSlider" Text="50" >
				</asp:TextBox>
				<wijmo:C1SliderExtender runat="server" ID="SliderExtender2" TargetControlID="vSlider"
					Orientation="Vertical" />
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The C1SliderExtender provide a simple, familiar way for end-users to choose a value in a predefined range.
	</p>
	<p>
		User can control the orientation and appearance.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
