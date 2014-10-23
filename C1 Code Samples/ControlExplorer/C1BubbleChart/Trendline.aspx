<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Trendline.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.Trendline" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">


    <wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MinimumSize="1" Height="475" Width="756">

        <Footer Compass="South" Visible="False"></Footer>

        <Legend Visible="False"></Legend>

        <Axis>
            <X Text="2012">
                <GridMajor Visible="True"></GridMajor>

                <GridMinor Visible="False"></GridMinor>
                <TickMajor Position="Inside">
                </TickMajor>
            </X>
            <Y Text="Stock price" Compass="West">
                <Labels TextAlign="Far">
                </Labels>
                <GridMajor Visible="True"></GridMajor>

                <GridMinor Visible="False"></GridMinor>
            </Y>
        </Axis>
        <Hint>
            <Content Function="hint" />
            <Style Stroke="#000000" StrokeWidth="10">
		</Style>
            <HintStyle Stroke="#000000" StrokeWidth="10">
            </HintStyle>
        </Hint>
        <Header Text="Apple Inc. stock prices and capitalization (2012)"></Header>
        <Legend Visible="true" Compass="East"></Legend>
        <Animation Duration="500" Easing="EaseOutElastic"></Animation>
        <SeriesList>
            <wijmo:BubbleChartSeries Label="AAPL" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="Jan" />
                            <wijmo:ChartXData StringValue="Feb" />
                            <wijmo:ChartXData StringValue="Mar" />
                            <wijmo:ChartXData StringValue="Apr" />
                            <wijmo:ChartXData StringValue="May" />
                            <wijmo:ChartXData StringValue="Jun" />
                            <wijmo:ChartXData StringValue="Jul" />
                            <wijmo:ChartXData StringValue="Aug" />
                            <wijmo:ChartXData StringValue="Sep" />
                            <wijmo:ChartXData StringValue="Oct" />
                            <wijmo:ChartXData StringValue="Nov" />
                            <wijmo:ChartXData StringValue="Dec" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="443.95" />
                            <wijmo:ChartYData DoubleValue="527.55" />
                            <wijmo:ChartYData DoubleValue="583.09" />
                            <wijmo:ChartYData DoubleValue="567.95" />
                            <wijmo:ChartYData DoubleValue="561.87" />
                            <wijmo:ChartYData DoubleValue="567.97" />
                            <wijmo:ChartYData DoubleValue="594.00" />
                            <wijmo:ChartYData DoubleValue="649.76" />
                            <wijmo:ChartYData DoubleValue="651.58" />
                            <wijmo:ChartYData DoubleValue="581.47" />
                            <wijmo:ChartYData DoubleValue="574.27" />
                            <wijmo:ChartYData DoubleValue="522.16" />
                        </Values>
                    </Y>
                    <Y1>
                        <Values>
                            <wijmo:ChartY1Data DoubleValue="394.55" />
                            <wijmo:ChartY1Data DoubleValue="460.05" />
                            <wijmo:ChartY1Data DoubleValue="508.30" />
                            <wijmo:ChartY1Data DoubleValue="587.58" />
                            <wijmo:ChartY1Data DoubleValue="533.47" />
                            <wijmo:ChartY1Data DoubleValue="534.08" />
                            <wijmo:ChartY1Data DoubleValue="570.05" />
                            <wijmo:ChartY1Data DoubleValue="582.79" />
                            <wijmo:ChartY1Data DoubleValue="621.26" />
                            <wijmo:ChartY1Data DoubleValue="601.95" />
                            <wijmo:ChartY1Data DoubleValue="514.61" />
                            <wijmo:ChartY1Data DoubleValue="498.40" />
                        </Values>
                    </Y1>
                </Data>
            </wijmo:BubbleChartSeries>
            <wijmo:BubbleChartSeries IsTrendline="true" Label="TrendLine" LegendEntry="true">
                <TrendlineSeries FitType="Polynom" Order="4" SampleCount="100">
                    <Data>
                        <X>
                            <Values>
                                <wijmo:ChartXData StringValue="Jan" />
                                <wijmo:ChartXData StringValue="Feb" />
                                <wijmo:ChartXData StringValue="Mar" />
                                <wijmo:ChartXData StringValue="Apr" />
                                <wijmo:ChartXData StringValue="May" />
                                <wijmo:ChartXData StringValue="Jun" />
                                <wijmo:ChartXData StringValue="Jul" />
                                <wijmo:ChartXData StringValue="Aug" />
                                <wijmo:ChartXData StringValue="Sep" />
                                <wijmo:ChartXData StringValue="Oct" />
                                <wijmo:ChartXData StringValue="Nov" />
                                <wijmo:ChartXData StringValue="Dec" />
                            </Values>
                        </X>
                        <Y>
                            <Values>
                                <wijmo:ChartYData DoubleValue="443.95" />
                                <wijmo:ChartYData DoubleValue="527.55" />
                                <wijmo:ChartYData DoubleValue="583.09" />
                                <wijmo:ChartYData DoubleValue="567.95" />
                                <wijmo:ChartYData DoubleValue="561.87" />
                                <wijmo:ChartYData DoubleValue="567.97" />
                                <wijmo:ChartYData DoubleValue="594.00" />
                                <wijmo:ChartYData DoubleValue="649.76" />
                                <wijmo:ChartYData DoubleValue="651.58" />
                                <wijmo:ChartYData DoubleValue="581.47" />
                                <wijmo:ChartYData DoubleValue="574.27" />
                                <wijmo:ChartYData DoubleValue="522.16" />
                            </Values>
                        </Y>
                    </Data>
                </TrendlineSeries>
            </wijmo:BubbleChartSeries>
        </SeriesList>
    </wijmo:C1BubbleChart>
    <script>
        function hint() {
            return "" + this.data.label + " \n" + "Stock price: " + Globalize.format(this.y, "c2") + "\n"
				 + "Capitalization: " + this.data.y1 + "B";
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demostrates how to draw a trendline on <strong>C1BubbleChart</strong>.
    </p>
    <p>
        You can customize the trendline by setting following properties:
    </p>
    <ul>
        <li>
            <strong>FitType</strong> - sepcifies the type of the trendline.
        </li>
        <li>
            <strong>SampleCount</strong> - specifies the sample count for function calculation. It works only if the FitType is polynom, power, exponent, logarithmic and fourier. 
        </li>
        <li>
            <strong>Order</strong> - defines the number of terms in polynom equation. It works only if the FitType is polynom, power, exponent, logarithmic and fourier.
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Order:</label>
                    <wijmo:C1InputNumeric ID="inputOrder" runat="server" Width="80px" ShowSpinner="true" Value="4" MinValue="1" MaxValue="10" DecimalPlaces="0"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>SampleCount:</label>
                    <wijmo:C1InputNumeric ID="inputSampleCount" runat="server" Width="80px" ShowSpinner="true" Value="100" MinValue="1" MaxValue="200" DecimalPlaces="0"></wijmo:C1InputNumeric>
                </li>
                <li>
                    <label>FitType:</label>
                    <asp:DropDownList ID="dplFitType" runat="server">
                        <asp:ListItem Text="Polynom" Value="Polynom" Selected="True"></asp:ListItem>
                        <asp:ListItem Text="Exponent" Value="Exponent"></asp:ListItem>
                        <asp:ListItem Text="Logarithmic" Value="Logarithmic"></asp:ListItem>
                        <asp:ListItem Text="Power" Value="Power"></asp:ListItem>
                        <asp:ListItem Text="Fourier" Value="Fourier"></asp:ListItem>
                        <asp:ListItem Text="MinX" Value="MinX"></asp:ListItem>
                        <asp:ListItem Text="MinY" Value="MinY"></asp:ListItem>
                        <asp:ListItem Text="MaxX" Value="MaxX"></asp:ListItem>
                        <asp:ListItem Text="MaxY" Value="MaxY"></asp:ListItem>
                        <asp:ListItem Text="AverageX" Value="AverageX"></asp:ListItem>
                        <asp:ListItem Text="AverageY" Value="AverageY"></asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
        <div class="settingcontrol">
            <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
        </div>
    </div>

</asp:Content>
