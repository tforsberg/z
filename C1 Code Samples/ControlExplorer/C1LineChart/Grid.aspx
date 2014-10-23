<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Grid.aspx.cs" Inherits="C1LineChart_Grid" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function hintContent() {
            return this.label + '\n' + 'x: ' + this.x + '; y: ' + this.y;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1LineChart ShowChartLabels="false" runat="server" ID="C1LineChart1" Height="450" Width="756">
        <Hint OffsetY="-10">
            <Content Function="hintContent" />
            <ContentStyle FontSize="10pt"></ContentStyle>
        </Hint>
        <Header Text="Parabola and Hyperbola">
        </Header>
        <SeriesStyles>
            <wijmo:ChartStyle StrokeWidth="3" StrokeOpacity="0.7" />
            <wijmo:ChartStyle StrokeWidth="3" StrokeOpacity="0.7" />
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle StrokeWidth="4" StrokeOpacity="1" />
            <wijmo:ChartStyle StrokeWidth="4" StrokeOpacity="1" />
        </SeriesHoverStyles>
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Visible="false">
            <Size Width="30" Height="3"></Size>
        </Legend>
        <Animation Enabled="false" />
        <SeriesTransition Enabled="false" />
        <SeriesList>
            <wijmo:LineChartSeries Label="Parabola" FitType="Spline" LegendEntry="true">
                <Markers Visible="false" Type="Circle">
                </Markers>
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData DoubleValue="-2" />
                            <wijmo:ChartXData DoubleValue="-1" />
                            <wijmo:ChartXData DoubleValue="0" />
                            <wijmo:ChartXData DoubleValue="1" />
                            <wijmo:ChartXData DoubleValue="2" />
                            <wijmo:ChartXData DoubleValue="3" />
                            <wijmo:ChartXData DoubleValue="4" />
                            <wijmo:ChartXData DoubleValue="5" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="4" />
                            <wijmo:ChartYData DoubleValue="1" />
                            <wijmo:ChartYData DoubleValue="0" />
                            <wijmo:ChartYData DoubleValue="1" />
                            <wijmo:ChartYData DoubleValue="4" />
                            <wijmo:ChartYData DoubleValue="9" />
                            <wijmo:ChartYData DoubleValue="16" />
                            <wijmo:ChartYData DoubleValue="25" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="Hyperbola" FitType="Spline">
                <Markers Visible="false">
                </Markers>
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData DoubleValue="0.2" />
                            <wijmo:ChartXData DoubleValue="0.25" />
                            <wijmo:ChartXData DoubleValue="0.33" />
                            <wijmo:ChartXData DoubleValue="0.5" />
                            <wijmo:ChartXData DoubleValue="1" />
                            <wijmo:ChartXData DoubleValue="2" />
                            <wijmo:ChartXData DoubleValue="3" />
                            <wijmo:ChartXData DoubleValue="4" />
                            <wijmo:ChartXData DoubleValue="5" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="5" />
                            <wijmo:ChartYData DoubleValue="4" />
                            <wijmo:ChartYData DoubleValue="3" />
                            <wijmo:ChartYData DoubleValue="2" />
                            <wijmo:ChartYData DoubleValue="1" />
                            <wijmo:ChartYData DoubleValue="0.5" />
                            <wijmo:ChartYData DoubleValue="0.33" />
                            <wijmo:ChartYData DoubleValue="0.25" />
                            <wijmo:ChartYData DoubleValue="0.2" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
        </SeriesList>
        <Axis>
            <X Min="-2" Max="5" Origin="0" Visible="true">
                <TickMajor Position="Cross">
                    <Style Stroke="#000000"></Style>
                </TickMajor>
                <TickMinor Position="None">
                    <Style Stroke="#333333"></Style>
                </TickMinor>
                <GridMajor Visible="true">
                    <Style Stroke="#555555" StrokeDashArray="--.."></Style>
                </GridMajor>
                <GridMinor Visible="true">
                    <Style Stroke="#aaaaaa" StrokeDashArray="."></Style>
                </GridMinor>
            </X>
            <Y Compass="West" Min="-1" Max="5" AutoMin="false" AutoMax="false" Visible="true" Origin="0">
                <TickMajor Position="Cross">
                    <Style Stroke="#000000"></Style>
                </TickMajor>
                <TickMinor Position="None">
                    <TickStyle Stroke="#333333"></TickStyle>
                </TickMinor>
            </Y>
        </Axis>
    </wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">

    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label class="settinglegend" for="ckxShowXAxis">X axis</label>
                </li>
                <li style="white-space:nowrap;">
                    <asp:CheckBox ID="ckxShowXMajorGid" runat="server" Text="Grid major visible" Checked="true" />
                </li>
                <li style="white-space:nowrap;">
                    <asp:CheckBox ID="ckxShowXMinorGid" runat="server" Text="Grid minor visible" Checked="true" />
                </li>
                <li class="fullwidth">
                    <label class="settinglegend" for="ckxShowXAxis">Y axis</label>
                </li>
                <li style="white-space:nowrap;">
                    <asp:CheckBox ID="ckxShowYMajorGid" runat="server" Text="Grid major visible" Checked="true" />
                </li>
                <li style="white-space:nowrap;">
                    <asp:CheckBox ID="ckxShowYMinorGid" runat="server" Text="Grid minor visible" Checked="true" />
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how you can striate your graph using <strong>C1LineChart</strong>.
    </p>
    <h3>Test the features</h3>
    <ul>
        <li>Note the grid striating the cart.</li>
        <li>Note the grid lines pattern on different line groups.</li>
        <li>Go to the 'Sources' tab to see how to setup grid lines on your chart </li>
    </ul>

</asp:Content>
