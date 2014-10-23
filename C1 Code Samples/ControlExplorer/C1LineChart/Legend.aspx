<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="Legend.aspx.cs" Inherits="C1LineChart_Legend" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.label + '\n' + this.x + ' : ' + this.y;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart ID="C1LineChart1" ShowChartLabels="false" runat="server" Height="475" Width="756">
        <Header Text="Smartphones historical sales"></Header>
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Text="Mobile OS" Visible="true" Compass="North" Orientation="Horizontal"></Legend>
        <Axis>
            <X Text="Year quarter" Compass="South"></X>
            <Y Text="Millions of units" Compass="West"></Y>
        </Axis>
        <SeriesList>
            <wijmo:LineChartSeries Label="Android" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="2012-Q1" />
                            <wijmo:ChartXData StringValue="2012-Q2" />
                            <wijmo:ChartXData StringValue="2012-Q3" />
                            <wijmo:ChartXData StringValue="2012-Q4" />
                            <wijmo:ChartXData StringValue="2013-Q1" />
                            <wijmo:ChartXData StringValue="2013-Q2" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="81.07" />
                            <wijmo:ChartYData DoubleValue="104.08" />
                            <wijmo:ChartYData DoubleValue="122.5" />
                            <wijmo:ChartYData DoubleValue="144.7" />
                            <wijmo:ChartYData DoubleValue="162.1" />
                            <wijmo:ChartYData DoubleValue="177.9" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="iOS" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="2012-Q1" />
                            <wijmo:ChartXData StringValue="2012-Q2" />
                            <wijmo:ChartXData StringValue="2012-Q3" />
                            <wijmo:ChartXData StringValue="2012-Q4" />
                            <wijmo:ChartXData StringValue="2013-Q1" />
                            <wijmo:ChartXData StringValue="2013-Q2" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="33.12" />
                            <wijmo:ChartYData DoubleValue="26.0" />
                            <wijmo:ChartYData DoubleValue="23.6" />
                            <wijmo:ChartYData DoubleValue="43.5" />
                            <wijmo:ChartYData DoubleValue="37.4" />
                            <wijmo:ChartYData DoubleValue="31.9" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="Windows Phone" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="2012-Q1" />
                            <wijmo:ChartXData StringValue="2012-Q2" />
                            <wijmo:ChartXData StringValue="2012-Q3" />
                            <wijmo:ChartXData StringValue="2012-Q4" />
                            <wijmo:ChartXData StringValue="2013-Q1" />
                            <wijmo:ChartXData StringValue="2013-Q2" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="2.71" />
                            <wijmo:ChartYData DoubleValue="5.4" />
                            <wijmo:ChartYData DoubleValue="4.1" />
                            <wijmo:ChartYData DoubleValue="6.2" />
                            <wijmo:ChartYData DoubleValue="7.0" />
                            <wijmo:ChartYData DoubleValue="7.4" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="Blackberry" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="2012-Q1" />
                            <wijmo:ChartXData StringValue="2012-Q2" />
                            <wijmo:ChartXData StringValue="2012-Q3" />
                            <wijmo:ChartXData StringValue="2012-Q4" />
                            <wijmo:ChartXData StringValue="2013-Q1" />
                            <wijmo:ChartXData StringValue="2013-Q2" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="9.94" />
                            <wijmo:ChartYData DoubleValue="7.4" />
                            <wijmo:ChartYData DoubleValue="9.0" />
                            <wijmo:ChartYData DoubleValue="7.3" />
                            <wijmo:ChartYData DoubleValue="6.3" />
                            <wijmo:ChartYData DoubleValue="6.2" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="Symbian" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="2012-Q1" />
                            <wijmo:ChartXData StringValue="2012-Q2" />
                            <wijmo:ChartXData StringValue="2012-Q3" />
                            <wijmo:ChartXData StringValue="2012-Q4" />
                            <wijmo:ChartXData StringValue="2013-Q1" />
                            <wijmo:ChartXData StringValue="2013-Q2" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="12.47" />
                            <wijmo:ChartYData DoubleValue="6.8" />
                            <wijmo:ChartYData DoubleValue="4.4" />
                            <wijmo:ChartYData DoubleValue="2.6" />
                            <wijmo:ChartYData DoubleValue="0.5" />
                            <wijmo:ChartYData DoubleValue="0.631" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
        </SeriesList>
    </wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        This sample demonstrates a set of powerful features for the <strong>C1LineChart</strong>. 
            This is a Line Chart that shows data that compares six quarter sales of different mobile OS with interactive Legend. 
    </p>
    <h3>Test the features</h3>
    <ul>
        <li>Hover over a data point to see the tooltip.</li>
        <li>Note this chart displays several different graphs at once</li>
        <li>Note the legend on the top of the chart</li>
        <li>Click series items in the legend to toggle their visibility on the chart surface.</li>
        <li>Play with legend options in the panel below to see its behavior.</li>
        <li>Go to the 'Sources' tab to see how to setup chart legend through widget initialization </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <asp:CheckBox ID="ckxEnableLegend" runat="server" Text="Legend enabled" Checked="true" />
                </li>
                <li>
                    <label>Compass:</label>
                    <asp:DropDownList ID="cbxCompass" runat="server">
                        <asp:ListItem Text="North" Value="North" Selected="true" />
                        <asp:ListItem Text="East" Value="East" />
                        <asp:ListItem Text="South" Value="South" />
                        <asp:ListItem Text="West" Value="West" />
                    </asp:DropDownList>
                </li>
                <li>
                    <label>Orientation:</label>
                    <asp:DropDownList ID="cbxOrientation" runat="server">
                        <asp:ListItem Text="Horizontal" Value="Horizontal" Selected="true" />
                        <asp:ListItem Text="Vertical" Value="Vertical" />
                    </asp:DropDownList>
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
            </div>
        </div>
    </div>
</asp:Content>

