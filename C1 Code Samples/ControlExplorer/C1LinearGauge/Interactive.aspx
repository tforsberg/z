<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Interactive.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.Interactive" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge"
	TagPrefix="Wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider"
	TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<Wijmo:C1LinearGauge runat="server" ID="Gauge1" Width="400" Height="100" Value="50" >
		<Animation Duration="400" />
		<Labels>
            <LabelStyle FontSize="12pt" FontWeight="800">
                <Fill Color="#1E395B"></Fill>
            </LabelStyle>
		</Labels>
		<TickMajor Position="Inside" Offset="-11" Interval="20" Factor="12">
            <TickStyle Width="2">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
		</TickMajor>
		<TickMinor Position="Inside" Offset="-11" Visible="true" Interval="4" Factor="10"> 
            <TickStyle Width="1">
                <Fill Color="#1E395B"></Fill>
            </TickStyle>
		</TickMinor>
		<Pointer Shape="Tri" Length="0.5">
            <PointerStyle Stroke="#1E395B">
                <Fill Color="#1E395B"></Fill>
            </PointerStyle>
		</Pointer>
		<Face>
            <FaceStyle StrokeWidth="4">
                <Fill LinearGradientAngle="270" ColorBegin="#FFFFFF" ColorEnd="#7BA0CC" Type="LinearGradient"></Fill>
            </FaceStyle>
		</Face>
	</Wijmo:C1LinearGauge>
	<Wijmo:C1Slider ID="slider" runat="server" Width="400" Value="50" />
    <br/>
	<p>
		Drag and release the slider to change the gauge's value</p>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $("#<%= slider.ClientID %>").bind("c1sliderchange", function (event, ui) {
	            $("#<%= Gauge1.ClientID %>").c1lineargauge("option", "value", ui.value);
	        });
	    });
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>  This sample use a C1Slider and <strong>C1LinearGauge</strong> to show the interactive between them. Move the slider's value to see the gauge change value.</p>
</asp:Content>
