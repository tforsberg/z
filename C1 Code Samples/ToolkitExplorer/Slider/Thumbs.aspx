<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Thumbs.aspx.cs" Inherits="Slider_Thumbs" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Slider"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		.hSlider
		{
			width: 300px;
		}
		.header2
		{
			margin-bottom: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<h2 class = "header2">
		Thumbs</h2>
	<asp:TextBox ID="hSlider" runat="server" CssClass="hSlider" Text="100;400">
	</asp:TextBox>
	<wijmo:C1SliderExtender runat="server" ID="SliderExtender1" TargetControlID="hSlider"
		Max="500" Range="false" Min="0" Step="50" Orientation="Horizontal" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1SliderExtender supports bounds settings, user can input two values which indicate the upper and lower bound.</p> <br/>
	<p>Bound setting is allowed if the following properties are set to corresponding values:</p>
	<ul>
		<li>Values</li>
	</ul>
	<p>In general the length of 'values' should be two.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
