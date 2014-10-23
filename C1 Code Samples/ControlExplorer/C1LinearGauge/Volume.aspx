<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Volume.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.Volume" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="Wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .gauge
        {
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="ui-widget ui-widget-content ui-corner-all ui-helper-clearfix" style="width: 62px; padding: 4px; margin-left:200px">
        <Wijmo:C1LinearGauge runat="server" ID="Gauge" Value="50" Width="40px" Height="400" Orientation="Vertical" XAxisLength="1" XAxisLocation="0.01" CssClass="gauge">
            <TickMajor Factor="2" Visible="false" Offset="0" Interval="50">
                <TickStyle Opacity="0.4" StrokeWidth="0">
                    <Fill Color="#000000">
                    </Fill>
                </TickStyle>
            </TickMajor>
            <TickMinor Visible="False" Offset="0" Interval="5">
            </TickMinor>
            <Pointer Length="1.2" Width="4" Offset="0" Shape="Tri">
                <PointerStyle Stroke="#000">
                    <Fill Color="#444"></Fill>
                </PointerStyle>
            </Pointer>
            <Labels Visible="False">
            </Labels>
            <Animation Duration="200" Easing="EaseInCubic" Enabled="true"></Animation>
            <Face>
                <FaceStyle StrokeWidth="0" Width="0">
                </FaceStyle>
            </Face>
            <Ranges>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="10" EndWidth="0.1" StartDistance="0.8" StartValue="0" StartWidth="0.05">
                    <RangeStyle StrokeWidth="0.5" Stroke="#f1f1f1">
                        <Fill ColorBegin="#D6E0E6" ColorEnd="#D2DCE2" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="20" EndWidth="0.2" StartDistance="0.8" StartValue="10" StartWidth="0.1">
                    <RangeStyle StrokeWidth="0.5" Stroke="#f1f1f1">
                        <Fill ColorBegin="#CED8DE" ColorEnd="#CAD4DA" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="30" EndWidth="0.3" StartDistance="0.8" StartValue="20" StartWidth="0.2">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#C6D0D6" ColorEnd="#C2CCD2" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="40" EndWidth="0.4" StartDistance="0.8" StartValue="30" StartWidth="0.3">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#BEC8CE" ColorEnd="#BAC4CA" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="50" EndWidth="0.5" StartDistance="0.8" StartValue="40" StartWidth="0.4">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#B6C0C6" ColorEnd="#B2BCC2" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="60" EndWidth="0.6" StartDistance="0.8" StartValue="50" StartWidth="0.5">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#AEB8BE" ColorEnd="#AAB4BA" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="70" EndWidth="0.7" StartDistance="0.8" StartValue="60" StartWidth="0.6">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#A6B0B6" ColorEnd="#A2ACB2" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="80" EndWidth="0.8" StartDistance="0.8" StartValue="70" StartWidth="0.7">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#9EA8AE" ColorEnd="#9AA4AA" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="90" EndWidth="0.9" StartDistance="0.8" StartValue="80" StartWidth="0.8">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#09A5D8" ColorEnd="#19A3D0" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
                <Wijmo:GaugelRange EndDistance="0.8" EndValue="100" EndWidth="1.0" StartDistance="0.8" StartValue="90" StartWidth="0.9">
                    <RangeStyle StrokeWidth="0" Stroke="#f1f1f1">
                        <Fill ColorBegin="#1891C9" ColorEnd="#1789BE" LinearGradientAngle="90" Type="LinearGradient">
                        </Fill>
                    </RangeStyle>
                </Wijmo:GaugelRange>
            </Ranges>
        </Wijmo:C1LinearGauge>
        <div style="float: left;">
            <Wijmo:C1Slider ID="slider" runat="server" Height="390" Value="50" Orientation="Vertical" />
        </div>
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%= slider.ClientID %>").bind("c1sliderchange", function (event, ui) {
                $("#<%= Gauge.ClientID %>").c1lineargauge("option", "value", ui.value);
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample use a <strong>C1Slider</strong> and <strong>C1LinearGauge</strong> to create a volume control. The gauge is used to display volume levels while the slider is used to set the value.</p>
</asp:Content>
