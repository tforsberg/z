<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Trendline.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.Trendline" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function hintContent() {
            return this.label + ' ' + this.y + '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1CompositeChart runat="server" ID="C1CompositeChart1" Height="475" Width="756" Stacked="false">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Axis>
            <X Text="">
            </X>
            <Y Text="Total Hardware" Compass="West">
            </Y>
        </Axis>
        <Header Text="Hardware Distribution">
        </Header>
        <SeriesList>
            <wijmo:CompositeChartSeries Label="West" LegendEntry="true" Type="Column">
                <Data>
                    <X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
                    <Y DoubleValues="5, 3, 4, 7, 2" />
                </Data>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Label="Central" LegendEntry="true" Type="Column">
                <Data>
                    <X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
                    <Y DoubleValues="2, 2, 3, 2, 1" />
                </Data>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Label="East" LegendEntry="true" Type="Column">
                <Data>
                    <X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
                    <Y DoubleValues="3, 4, 4, 2, 5" />
                </Data>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Label="abc" LegendEntry="true" Type="Pie" Center="150, 150" Radius="60">
                <PieSeriesList>
                    <wijmo:PieChartSeries Label="MacBook Pro" LegendEntry="true" Data="46.78" Offset="0">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="iMac" LegendEntry="true" Data="23.18" Offset="0">
                    </wijmo:PieChartSeries>
                    <wijmo:PieChartSeries Label="MacBook" LegendEntry="true" Data="20.25" Offset="0">
                    </wijmo:PieChartSeries>
                </PieSeriesList>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Label="US" LegendEntry="true" Type="Line">
                <Data>
                    <X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
                    <Y DoubleValues="3, 6, 2, 9, 5" />
                </Data>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Type="Trendline" Label="US Trendline">
                <TrendlineSeries FitType="Polynom" Order="4" SampleCount="100">
                    <Data>
                        <X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
                        <Y DoubleValues="3, 6, 2, 9, 5" />
                    </Data>
                </TrendlineSeries>
            </wijmo:CompositeChartSeries>
        </SeriesList>
    </wijmo:C1CompositeChart>
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
        This sample demostrates how to draw a trendline on <strong>C1CompositeChart</strong>.
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
