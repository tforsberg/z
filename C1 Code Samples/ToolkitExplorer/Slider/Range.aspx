<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Range.aspx.cs" Inherits="Slider_Range" %>

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
		Range</h2>
	<asp:TextBox ID="hSlider" runat="server" CssClass="hSlider" Text="100;400">
	</asp:TextBox>
	<wijmo:C1SliderExtender runat="server" ID="SliderExtender1" TargetControlID="hSlider"
		DragFill="false" Max="500" Range="true" Min="0" Step="2" Orientation="Horizontal" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1SliderExtender supports capturing a range of values with two drag handles.</p><br/>
	<p>Range with two drag handles is allowed if the following properties are set to corresponding values:</p>
	<ul>
	<li>Range: true</li>
	<li>Values</li>
	</ul>
	<p>The space between the handles is filled with a different background color to indicate those values are selected.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
