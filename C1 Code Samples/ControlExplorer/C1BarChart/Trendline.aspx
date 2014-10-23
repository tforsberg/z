<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Trendline.aspx.cs" Inherits="ControlExplorer.C1BarChart.Trendline" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <wijmo:C1BarChart runat="server" ID="C1BarChart1" Height="475" Width="756" ClusterWidth="60" MarginRight="60" MarginTop="5" Shadow="False" ShowChartLabels="False">
        <Hint>
            <Content Function="hintContent" />
            <ContentStyle FontSize="14px">
                <Fill Color="#CCCCCC">
                </Fill>
            </ContentStyle>
            <Style StrokeWidth="0">
			</Style>
            <HintStyle StrokeWidth="0">
            </HintStyle>
        </Hint>

        <Footer Compass="South" Visible="False"></Footer>

        <Legend Visible="False"></Legend>

        <Axis>
            <X Text="" Compass="North" Visible="False">
                <TextStyle FontWeight="normal">
                </TextStyle>
                <GridMajor Visible="False"></GridMajor>

                <GridMinor Visible="False"></GridMinor>
            </X>
            <Y Text="USD (thousands)" Compass="West" AnnoFormatString="n0" Max="8000" Min="0" AutoMax="False" AutoMin="False">
                <TextStyle FontWeight="normal">
                </TextStyle>
                <GridMajor Visible="False"></GridMajor>

                <GridMinor Visible="False"></GridMinor>
                <TickMajor Position="Outside">
                    <Style Stroke="#999999">
					</Style>
                    <TickStyle Stroke="#999999">
                    </TickStyle>
                </TickMajor>
            </Y>
        </Axis>
        <SeriesStyles>
            <wijmo:ChartStyle StrokeWidth="0">
                <Fill Color="#94C3E8">
                </Fill>
            </wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle StrokeWidth="0">
            </wijmo:ChartStyle>
        </SeriesHoverStyles>
        <TextStyle FontSize="13px">
        </TextStyle>
        <Header Text="Sales By State"></Header>
        <SeriesList>
            <wijmo:BarChartSeries Label="West" LegendEntry="true">
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="Ohio" />
                            <wijmo:ChartXData StringValue="Florida" />
                            <wijmo:ChartXData StringValue="Arizona" />
                            <wijmo:ChartXData StringValue="Utah" />
                            <wijmo:ChartXData StringValue="Colorado" />
                            <wijmo:ChartXData StringValue="Hawaii" />
                            <wijmo:ChartXData StringValue="Texas" />
                            <wijmo:ChartXData StringValue="Maryland" />
                            <wijmo:ChartXData StringValue="North Carolina" />
                            <wijmo:ChartXData StringValue="Maryland" />
                            <wijmo:ChartXData StringValue="Oregon" />
                            <wijmo:ChartXData StringValue="Washington" />
                            <wijmo:ChartXData StringValue="New York" />
                            <wijmo:ChartXData StringValue="California" />
                            <wijmo:ChartXData StringValue="Pennsylvannia" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="1800" />
                            <wijmo:ChartYData DoubleValue="2250" />
                            <wijmo:ChartYData DoubleValue="2860" />
                            <wijmo:ChartYData DoubleValue="2880" />
                            <wijmo:ChartYData DoubleValue="2900" />
                            <wijmo:ChartYData DoubleValue="2920" />
                            <wijmo:ChartYData DoubleValue="3070" />
                            <wijmo:ChartYData DoubleValue="3190" />
                            <wijmo:ChartYData DoubleValue="3520" />
                            <wijmo:ChartYData DoubleValue="4100" />
                            <wijmo:ChartYData DoubleValue="4280" />
                            <wijmo:ChartYData DoubleValue="4320" />
                            <wijmo:ChartYData DoubleValue="5680" />
                            <wijmo:ChartYData DoubleValue="7040" />
                            <wijmo:ChartYData DoubleValue="7650" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:BarChartSeries>
            <wijmo:BarChartSeries IsTrendline="true" Label="Trendline">
                <TrendlineSeries FitType="Polynom" Order="4" SampleCount="100">
                    <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData StringValue="Ohio" />
                            <wijmo:ChartXData StringValue="Florida" />
                            <wijmo:ChartXData StringValue="Arizona" />
                            <wijmo:ChartXData StringValue="Utah" />
                            <wijmo:ChartXData StringValue="Colorado" />
                            <wijmo:ChartXData StringValue="Hawaii" />
                            <wijmo:ChartXData StringValue="Texas" />
                            <wijmo:ChartXData StringValue="Maryland" />
                            <wijmo:ChartXData StringValue="North Carolina" />
                            <wijmo:ChartXData StringValue="Maryland" />
                            <wijmo:ChartXData StringValue="Oregon" />
                            <wijmo:ChartXData StringValue="Washington" />
                            <wijmo:ChartXData StringValue="New York" />
                            <wijmo:ChartXData StringValue="California" />
                            <wijmo:ChartXData StringValue="Pennsylvannia" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="1800" />
                            <wijmo:ChartYData DoubleValue="2250" />
                            <wijmo:ChartYData DoubleValue="2860" />
                            <wijmo:ChartYData DoubleValue="2880" />
                            <wijmo:ChartYData DoubleValue="2900" />
                            <wijmo:ChartYData DoubleValue="2920" />
                            <wijmo:ChartYData DoubleValue="3070" />
                            <wijmo:ChartYData DoubleValue="3190" />
                            <wijmo:ChartYData DoubleValue="3520" />
                            <wijmo:ChartYData DoubleValue="4100" />
                            <wijmo:ChartYData DoubleValue="4280" />
                            <wijmo:ChartYData DoubleValue="4320" />
                            <wijmo:ChartYData DoubleValue="5680" />
                            <wijmo:ChartYData DoubleValue="7040" />
                            <wijmo:ChartYData DoubleValue="7650" />
                        </Values>
                    </Y>
                    </Data>
                </TrendlineSeries>
            </wijmo:BarChartSeries>
        </SeriesList>
    </wijmo:C1BarChart>
    <script type="text/javascript">
        function hintContent() {
            //Display x value and format y value as currency after multiplying by 1000
            return this.x + ': ' + Globalize.format(this.y * 1000, 'c0');
        }
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
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

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demostrates how to draw a trendline on <strong>C1BarChart</strong>.
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
