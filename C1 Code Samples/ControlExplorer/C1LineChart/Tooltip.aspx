<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="Tooltip.aspx.cs" Inherits="C1LineChart_Tooltip" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            //Check if multiple data points are on one axis entry. For example, multiple data entries for a single date. 
            // Hint for Indicator line
            if ($.isArray(this)) {
                var content = "";
                //Multiple entries of data on this point, so we need to loop through them to create the hint content.
                for (var i = 0; i < this.length; i++) {
                    // Format y value as percent with two decimals (12.39%). 
                    content += this[i].lineSeries.label + ': ' + Globalize.format(this[i].y / 100, 'p2') + '\n';
                }
                return content;
            }
                // Hint for Tooltip
            else {
                //Only a single data point, so we return a formatted version of it. "/n" is a line break.
                return this.data.lineSeries.label + '\n' +
                    // Format y value as percent with two decimals (12.39%). 
                    this.x + ': ' + Globalize.format(this.y / 100, 'p2');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart ID="C1LineChart1" ShowChartLabels="false" runat="server" Height="475" Width="756">
        <Header Text="Video Cards - Hardware Survey"></Header>
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Legend Visible="true" Compass="South" Orientation="Horizontal"></Legend>
        <Axis>
            <X Text="Month" Compass="South"></X>
            <Y Text="Percentage (%)" Compass="West"></Y>
        </Axis>
        <Indicator Visible="true"></Indicator>
        <SeriesList>
            <wijmo:LineChartSeries Label="NVIDIA GeForce 9800" FitType="Spline" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="May" />
                            <wijmo:ChartXData StringValue="Jun" />
                            <wijmo:ChartXData StringValue="Jul" />
                            <wijmo:ChartXData StringValue="Aug" />
                            <wijmo:ChartXData StringValue="Sep" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="3.64" />
                            <wijmo:ChartYData DoubleValue="3.70" />
                            <wijmo:ChartYData DoubleValue="3.57" />
                            <wijmo:ChartYData DoubleValue="3.79" />
                            <wijmo:ChartYData DoubleValue="3.97" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="NVIDIA GeForce 8800" FitType="Spline" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="May" />
                            <wijmo:ChartXData StringValue="Jun" />
                            <wijmo:ChartXData StringValue="Jul" />
                            <wijmo:ChartXData StringValue="Aug" />
                            <wijmo:ChartXData StringValue="Sep" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="4.46" />
                            <wijmo:ChartYData DoubleValue="4.42" />
                            <wijmo:ChartYData DoubleValue="4.23" />
                            <wijmo:ChartYData DoubleValue="4.11" />
                            <wijmo:ChartYData DoubleValue="4.10" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="ATI Radeon HD 5700" FitType="Spline" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="May" />
                            <wijmo:ChartXData StringValue="Jun" />
                            <wijmo:ChartXData StringValue="Jul" />
                            <wijmo:ChartXData StringValue="Aug" />
                            <wijmo:ChartXData StringValue="Sep" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="4.22" />
                            <wijmo:ChartYData DoubleValue="4.92" />
                            <wijmo:ChartYData DoubleValue="5.46" />
                            <wijmo:ChartYData DoubleValue="5.84" />
                            <wijmo:ChartYData DoubleValue="6.82" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="ATI Radeon HD 5800" FitType="Spline" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="May" />
                            <wijmo:ChartXData StringValue="Jun" />
                            <wijmo:ChartXData StringValue="Jul" />
                            <wijmo:ChartXData StringValue="Aug" />
                            <wijmo:ChartXData StringValue="Sep" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="4.66" />
                            <wijmo:ChartYData DoubleValue="5.20" />
                            <wijmo:ChartYData DoubleValue="5.62" />
                            <wijmo:ChartYData DoubleValue="6.02" />
                            <wijmo:ChartYData DoubleValue="7.04" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
            <wijmo:LineChartSeries Label="Mobile Intel 4 Series Express" FitType="Spline" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="May" />
                            <wijmo:ChartXData StringValue="Jun" />
                            <wijmo:ChartXData StringValue="Jul" />
                            <wijmo:ChartXData StringValue="Aug" />
                            <wijmo:ChartXData StringValue="Sep" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="1.91" />
                            <wijmo:ChartYData DoubleValue="1.82" />
                            <wijmo:ChartYData DoubleValue="1.94" />
                            <wijmo:ChartYData DoubleValue="1.89" />
                            <wijmo:ChartYData DoubleValue="1.72" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
        </SeriesList>
    </wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p><strong>C1LineChart</strong> allows you to see both a concrete value and all values in concrete 'x' value</p>
    <p>The source in this sample will show you how to setup indicator and tootips</p>
    <h3>Test the features</h3>
    <ul>
        <li>Hover over a data point to see the tooltip.</li>
        <li>Mouse down and drag across the chart surface to see the Indicator Line and the values it highlights.</li>
    </ul>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

