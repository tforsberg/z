<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExtremeValues.aspx.cs" Inherits="C1LineChart_ExtremeValues" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function hintContent() {
            return this.x + ' * ' + this.x + ' = ' + this.y;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1LineChart ShowChartLabels="false" runat="server" ID="C1LineChart1" Height="400" Width="756">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Header Text="Parabola">
        </Header>
        <Legend Visible="false">
            <Size Width="30" Height="3"></Size>
        </Legend>
        <SeriesList>
            <wijmo:LineChartSeries Label="Parabola" FitType="Spline" LegendEntry="true">
                <Markers Visible="false" Type="Circle">
                </Markers>
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData DoubleValue="-10" />
                            <wijmo:ChartXData DoubleValue="-9" />
                            <wijmo:ChartXData DoubleValue="-8" />
                            <wijmo:ChartXData DoubleValue="-7" />
                            <wijmo:ChartXData DoubleValue="-6" />
                            <wijmo:ChartXData DoubleValue="-5" />
                            <wijmo:ChartXData DoubleValue="-4" />
                            <wijmo:ChartXData DoubleValue="-3" />
                            <wijmo:ChartXData DoubleValue="-2" />
                            <wijmo:ChartXData DoubleValue="-1" />
                            <wijmo:ChartXData DoubleValue=" 0" />
                            <wijmo:ChartXData DoubleValue="1" />
                            <wijmo:ChartXData DoubleValue="2" />
                            <wijmo:ChartXData DoubleValue="3" />
                            <wijmo:ChartXData DoubleValue="4" />
                            <wijmo:ChartXData DoubleValue="5" />
                            <wijmo:ChartXData DoubleValue="6" />
                            <wijmo:ChartXData DoubleValue="7" />
                            <wijmo:ChartXData DoubleValue="8" />
                            <wijmo:ChartXData DoubleValue="9" />
                            <wijmo:ChartXData DoubleValue="10" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartXData DoubleValue="100" />
                            <wijmo:ChartXData DoubleValue="81" />
                            <wijmo:ChartXData DoubleValue="64" />
                            <wijmo:ChartXData DoubleValue="49" />
                            <wijmo:ChartXData DoubleValue="36" />
                            <wijmo:ChartXData DoubleValue="25" />
                            <wijmo:ChartXData DoubleValue="16" />
                            <wijmo:ChartXData DoubleValue="9" />
                            <wijmo:ChartXData DoubleValue="4" />
                            <wijmo:ChartXData DoubleValue="1" />
                            <wijmo:ChartXData DoubleValue="0" />
                            <wijmo:ChartXData DoubleValue="1" />
                            <wijmo:ChartXData DoubleValue="4" />
                            <wijmo:ChartXData DoubleValue="9" />
                            <wijmo:ChartXData DoubleValue="16" />
                            <wijmo:ChartXData DoubleValue="25" />
                            <wijmo:ChartXData DoubleValue="36" />
                            <wijmo:ChartXData DoubleValue="49" />
                            <wijmo:ChartXData DoubleValue="64" />
                            <wijmo:ChartXData DoubleValue="81" />
                            <wijmo:ChartXData DoubleValue="100" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
        </SeriesList>
        <Axis>
            <X AutoMin="true" AutoMax="true" Visible="true">
            </X>
            <Y AutoMin="true" AutoMax="true" Visible="true" Compass="West">
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
                    <asp:CheckBox ID="ckxEnableAutoMinX" runat="server" Text="AutoMin enabled" Checked="true" />
                </li>
                <li>
                    <label>Min value:</label>
                    <wijmo:C1InputNumeric ID="numberXMin" runat="server" Width="80px" Value="-5">
                    </wijmo:C1InputNumeric>
                </li>
                <li style="white-space:nowrap;">
                    <asp:CheckBox ID="ckxEnableAutoMaxX" runat="server" Text="AutoMax enabled" Checked="true" />
                </li>
                <li>
                    <label>Max value:</label>
                    <wijmo:C1InputNumeric ID="numberXMax" runat="server" Width="80px" Value="5">
                    </wijmo:C1InputNumeric>
                </li>
                <li class="fullwidth">
                    <label class="settinglegend" for="ckxShowXAxis">Y axis</label>
                </li>
                <li>
                    <asp:CheckBox ID="ckxEnableAutoMinY" runat="server" Text="AutoMin enabled" Checked="true" />
                </li>
                <li>
                    <label>Min value:</label>
                    <wijmo:C1InputNumeric ID="numberYMin" runat="server" Width="80px" Value="-5">
                    </wijmo:C1InputNumeric>
                </li>
                <li style="white-space:nowrap;">
                    <asp:CheckBox ID="ckxEnableAutoMaxY" runat="server" Text="AutoMax enabled" Checked="true" />
                </li>
                <li>
                    <label>Max value:</label>
                    <wijmo:C1InputNumeric ID="numberYMax" runat="server" Width="80px" Value="25">
                    </wijmo:C1InputNumeric>
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" runat="server" OnClick="btnApply_Click" Text="Apply" Width="70px" Height="25px" />
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how flexible are <strong>C1LineChart</strong> scale options.
    </p>
    <h3>Test the features</h3>
    <ul>
        <li>Hover over a bar point to see the tooltip.</li>
        <li>Note the minimum and the maximum values of both charts 'X' and 'Y'.</li>
        <li>Play with axis options in the panel below to see it features.</li>
        <li>Note the chart adjusts to the new scale.</li>
    </ul>

</asp:Content>
