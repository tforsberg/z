<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Logarithmic.aspx.cs" Inherits="ToolkitExplorer.LinearGauge.Logarithmic" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Gauge"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        Logarithmic Gauge</h2>
    <asp:Panel ID="linearGauge" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1LinearGaugeExtender runat="server" ID="LinearGaugeExtender1" Height="60"
        Width="400" TargetControlID="linearGauge" Value="50" Islogarithmic="true">
       <Labels>
        <LabelStyle FontSize="12pt" FontWeight="800">
            <Fill Color="#1E395B"></Fill>
        </LabelStyle>
	</Labels>
	<Pointer Shape="Rect" Length="0.5">
        <PointerStyle Stroke="#1E395B">
            <Fill Color="#1E395B"></Fill>
        </PointerStyle>
	</Pointer>
	<TickMajor Position="Inside" Factor="2" Interval="20">
        <TickStyle StrokeWidth="0">
            <Fill Color="#1E395B"></Fill>
        </TickStyle>
	</TickMajor>
	<TickMinor Visible="true" Interval="4" Position="Inside">
        <TickStyle StrokeWidth="0">
            <Fill Color="#1E395B"></Fill>
        </TickStyle>
	</TickMinor>

<Animation Duration="2000" Easing="EaseOutBack"></Animation>
	<Face>
        <FaceStyle Stroke="#7BA0CC" StrokeWidth="4">
            <Fill ColorBegin="White" ColorEnd="#D9E3F0" LinearGradientAngle="270" 
				Type="LinearGradient">
			</Fill>
        </FaceStyle>
	</Face>
    </wijmo:C1LinearGaugeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <input type="checkbox" id="checkbox1" checked="checked" />
    <label for="checkbox1">
        IsLogarithmic</label>
    <script type="text/javascript">
        $(document).ready(function () {

            $("#checkbox1").change(function () {
                $("#<%= linearGauge.ClientID %>").wijlineargauge("option", "islogarithmic", $(this).is(":checked"));
            });
        });
	
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to control the ticks nonuniform use <b>Islogarithmic</b> and <b>LogarithmicBase</b> properties</p>
</asp:Content>
