<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Origin.aspx.cs" Inherits="ControlExplorer.C1LineChart.Origin" %>

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
    <wijmo:C1LineChart ShowChartLabels="false" runat="server" ID="C1LineChart1" Height="400" Width="756">
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
                <li>
                    <asp:CheckBox ID="ckxShowXAxis" runat="server" Text="Axis visible" Checked="true" />
                </li>
                <li>
                    <label for="numberXOrigion">Axis origin:</label>
                    <wijmo:C1InputNumeric ID="numberXOrigion" runat="server" Width="100px" Value="0.00">
                    </wijmo:C1InputNumeric>
                </li>
                <li>
                    <label for="cbxXTickMajorPos">Tick Major position:</label>
                    <asp:DropDownList ID="cbxXTickMajorPos" runat="server">
                        <asp:ListItem Value="Cross" Text="Cross" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Inside" Text="Inside"></asp:ListItem>
                        <asp:ListItem Value="Outside" Text="Outside"></asp:ListItem>
                        <asp:ListItem Value="None" Text="None"></asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label for="cbxXTickMinorPos">Tick Minor position:</label>
                    <asp:DropDownList ID="cbxXTickMinorPos" runat="server">
                        <asp:ListItem Value="Cross" Text="Cross"></asp:ListItem>
                        <asp:ListItem Value="Inside" Text="Inside"></asp:ListItem>
                        <asp:ListItem Value="Outside" Text="Outside"></asp:ListItem>
                        <asp:ListItem Value="None" Text="None" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li class="fullwidth">
                    <label class="settinglegend" for="ckxShowYAxis">Y axis</label>
                </li>
                <li>
                    <asp:CheckBox ID="ckxShowYAxis" runat="server" Text="Axis visible" Checked="true" />
                </li>
                <li>
                    <label>Axis origin:</label>
                    <wijmo:C1InputNumeric ID="numberYOrigion" runat="server" Width="100px" Value="0.00">
                    </wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>Tick Major position:</label>
                    <asp:DropDownList ID="cbxYTickMajorPos" runat="server">
                        <asp:ListItem Value="Cross" Text="Cross" Selected="True"></asp:ListItem>
                        <asp:ListItem Value="Inside" Text="Inside"></asp:ListItem>
                        <asp:ListItem Value="Outside" Text="Outside"></asp:ListItem>
                        <asp:ListItem Value="None" Text="None"></asp:ListItem>
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Tick Minor position:</label>
                    <asp:DropDownList ID="cbxYTickMinorPos" runat="server">
                        <asp:ListItem Value="Cross" Text="Cross"></asp:ListItem>
                        <asp:ListItem Value="Inside" Text="Inside"></asp:ListItem>
                        <asp:ListItem Value="Outside" Text="Outside"></asp:ListItem>
                        <asp:ListItem Value="None" Text="None" Selected="True"></asp:ListItem>
                    </asp:DropDownList>
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
        The <strong>C1LineChart</strong> control supports negative values and can display them nicely using the Origin property for each axis. The <strong>Origin</strong> property tell the axis where to draw its starting point. This is optimal for displaying positive and negative values on the same chart.
    </p>
</asp:Content>
