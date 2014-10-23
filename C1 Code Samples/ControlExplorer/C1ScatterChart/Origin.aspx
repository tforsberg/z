<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Wijmo.Master" CodeBehind="Origin.aspx.cs" Inherits="ControlExplorer.C1ScatterChart.Origin" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
      <style>
        #mapContainer > div {
            background: transparent;
        }

        #mapContainer {
            background-image: url('../Images/blank-world-map.png');
            background-repeat: no-repeat;
            background-position-x: 58px;
            background-position-y: 75px;
        }
    </style>
    <script type="text/javascript">
        function hintContent() {
            return "Longitude: " + this.x + "°\nLatitude: " + this.y + "°";
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="mapContainer">
        <wijmo:C1ScatterChart ID="C1ScatterChart1" runat="server" Height="475" Width="756">
        <Hint Title-Content="Earthquake coordinates" OffsetY="-10">
            <Content Function="hintContent" />
        </Hint>    
        <Animation Enabled="true" />
        <Header Text="Earquakes"></Header>
        <Axis>
            <X Origin="0" Min="-180" Max="180">
                <Labels>
                    <AxisLabelStyle FontSize="11" Rotation="-45">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle>
                </Labels>
                <GridMajor Visible="false"></GridMajor>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f"></TickStyle>
                </TickMajor>
            </X>
            <Y Origin="0" Min="-90" Max="90" Compass="West">
                <GridMajor Visible="true"></GridMajor>
                <Labels>
                    <AxisLabelStyle FontSize="11">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle>
                </Labels>
                <GridMajor Visible="true">
                    <GridStyle Stroke="#353539" StrokeDashArray="-"></GridStyle>
                </GridMajor>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f"></TickStyle>
                </TickMajor>
            </Y>
        </Axis>
        <Legend Visible="false"></Legend>
        <SeriesStyles>
            <wijmo:ChartStyle Stroke="#afe500">
                <Fill RadialGradientFocusPointX="0.25"  LinearGradientAngle="30" RadialGradientFocusPointY="0.75" Color="#fff" ColorBegin="#0c0" ColorEnd="#000"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Stroke="#ff9900">
                <Fill Color="#00cc00" ColorBegin="#0c0" ColorEnd="#cc0000" LinearGradientAngle="90"></Fill>
            </wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle>
                <Fill Color="#00cc00" ColorBegin="#0c0" ColorEnd="#cc0000"  LinearGradientAngle="90"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle>
                <Fill Color="#0000cc"></Fill>
            </wijmo:ChartStyle>
        </SeriesHoverStyles>
    </wijmo:C1ScatterChart>
    </div>
</asp:Content>