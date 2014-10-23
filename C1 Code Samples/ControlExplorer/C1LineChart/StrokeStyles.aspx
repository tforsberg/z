<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="StrokeStyles.aspx.cs" Inherits="C1LineChart_StrokeStyles" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart ID="C1LineChart1" ShowChartLabels="false" runat="server" Height="475" Width="756">
        <Header Text="Video Cards - Hardware Survey"></Header>
        <Hint Enable="false">
        </Hint>
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Visible="true" Compass="South" Orientation="Horizontal"></Legend>
        <Axis>
            <X Text="Graphics Card" Compass="South"></X>
            <Y Text="Percentage (%)" Compass="West"></Y>
        </Axis>
        <SeriesStyles>
            <wijmo:ChartStyle Stroke="#2d2d2d" StrokeWidth="3" StrokeOpacity="0.7" StrokeDashArray=""></wijmo:ChartStyle>
            <wijmo:ChartStyle Stroke="#5f9996" StrokeWidth="3" StrokeOpacity="0.7"></wijmo:ChartStyle>
            <wijmo:ChartStyle Stroke="#afe500" StrokeWidth="3" StrokeOpacity="0.7"></wijmo:ChartStyle>
            <wijmo:ChartStyle Stroke="#b2c76d" StrokeWidth="3" StrokeOpacity="0.7"></wijmo:ChartStyle>
            <wijmo:ChartStyle Stroke="#959595" StrokeWidth="3" StrokeOpacity="0.7"></wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle StrokeWidth="5" StrokeOpacity="1"></wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="5" StrokeOpacity="1"></wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="5" StrokeOpacity="1"></wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="5" StrokeOpacity="1"></wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="5" StrokeOpacity="1"></wijmo:ChartStyle>
        </SeriesHoverStyles>
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
    <p>
        This sample demonstrates how easy you can customize lines visualization using <strong>C1LineChart</strong> and make every graph look unique.
    </p>
    <h3>Test the features</h3>
    <ul>
        <li>Note the colors of each line in chart area and in the legend.</li>
        <li>Note lines highlighting on mouse hover - they become thicker and clear.</li>
        <li>Play with controls below to see all the divercity of display options Wijmo Line Chart offer.</li>
        <li>Note how lines become wider when you change 'stroke-width' option</li>
        <li>Note you can change line paleness and brightness using 'stroke-opacity' option.</li>
        <li>Note how easy you can decorate lines using 'stroke-dasharray' option.</li>
        <li>Note the legend elements updating according to selected 'stroke-dasharray' option.</li>
        <li>Note you can use same properties to setup lines visualization on mouse hover.</li>
        <li><b>Note you can use same stroke proprties to setup visualization of any kind Wijmo Line Chart lines including Grid And Ticks</b></li>
        <li>Go to 'Sources' tab to see more instructions</li>
    </ul>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Stroke width:</label>
                    <wijmo:C1InputNumeric ID="numberStrokeWidth" runat="server" Width="60px" Value="3"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>Stroke opacity:</label>
                    <wijmo:C1InputNumeric ID="numberStrokeOpacity" runat="server" Width="60px" Value="0.75"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>Stroke pattern:</label>
                    <asp:DropDownList ID="cbxStrokePattern" runat="server">
                        <asp:ListItem Value="" Text="Solid" Selected="true" />
                        <asp:ListItem Value="-" Text="- " />
                        <asp:ListItem Value="." Text=". " />
                        <asp:ListItem Value="-." Text="-." />
                        <asp:ListItem Value="-.." Text="-.." />
                        <asp:ListItem Value=". " Text=". " />
                        <asp:ListItem Value="- " Text="- " />
                        <asp:ListItem Value="--" Text="--" />
                        <asp:ListItem Value="- ." Text="- ." />
                        <asp:ListItem Value="--." Text="--." />
                        <asp:ListItem Value="--.." Text="--.." />
                    </asp:DropDownList>
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" runat="server" Text="Apply" Width="65px" Height="25px" OnClick="btnApply_Click" />
            </div>
        </div>
    </div>
</asp:Content>

