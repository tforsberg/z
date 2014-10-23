<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<Wijmo:C1RadialGauge runat="server" ID="Gauge1" Value="100" Max="150" StartAngle="-45" SweepAngle="270">
		
<TickMajor Position="Inside" Factor="2" Visible="True" Offset="27" Interval="25"></TickMajor>

<TickMinor Position="Inside" Visible="True" Offset="30" Interval="5"></TickMinor>

<Pointer Length="0.8" Width="4" Offset="0.15"></Pointer>

		<Labels Offset="30">
		</Labels>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>
		<Ranges>
			<Wijmo:GaugelRange EndDistance="0.58" EndValue="10" EndWidth="5" 
				StartDistance="0.6" StartValue="0" StartWidth="2">
				<RangeStyle Stroke="#7BA0CC" StrokeWidth="0">
					<Fill Color="#7BA0CC">
					</Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.54" EndValue="125" EndWidth="20" 
				StartDistance="0.58" StartValue="10" StartWidth="5">
				<RangeStyle Stroke="White" StrokeWidth="0">
					<Fill ColorBegin="#B4D5F0" ColorEnd="#B4D5F0" Type="LinearGradient">
					</Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
			<Wijmo:GaugelRange EndDistance="0.5" EndValue="150" EndWidth="25" 
				StartDistance="0.54" StartValue="125" StartWidth="20">
				<RangeStyle Stroke="#7BA0CC" StrokeWidth="0">
					<Fill Color="#7BA0CC">
					</Fill>
				</RangeStyle>
			</Wijmo:GaugelRange>
		</Ranges>
		
	</Wijmo:C1RadialGauge>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample illustrates how to create a customized C1RadialGauge control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
