<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Dragfill.aspx.cs" Inherits="Slider_Dragfill" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Slider"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<style type="text/css">
		.hSlider
		{
			width: 300px;
			height: 100px;
		}
		.header2
		{
			margin-bottom: 10px;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<h2 class = "header2">
		Dragfill</h2>
    <asp:Panel ID="hSlider" runat="server" CssClass="hSlider">
    </asp:Panel>
	<wijmo:C1SliderExtender runat="server" ID="SliderExtender1" TargetControlID="hSlider"
		DragFill="true" Max="500" Range="true" Min="0" Step="2" Orientation="Horizontal" 
        Values="100,400" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1SliderExtender supports dragging the fill between the two drag handles.</p><br/>
	<p>The fill dragging is allowed if the following properties are set to corresponding values:</p>
	<ul>
	<li>Range: true</li>
	<li>DragFill: true</li>
	<li>Values</li>
	</ul>
	<p>"Values"used to specify multiple handles when the "Range" to be set to true.</p>
	<p>End-user can drag the range area, the space between the handles is filled with a different background color to indicate
	those values are selected.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
