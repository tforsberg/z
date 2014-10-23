<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="Trendline.aspx.cs" Inherits="C1LineChart_Trendline" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.data.lineSeries.label + '\n' +
			this.x + '\n' + this.y + '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart runat="server" ID="C1LineChart1" ShowChartLabels="False" Height="475" Width="756">
        <Footer Compass="South" Visible="False"></Footer>
        <Legend Visible="false"></Legend>
        <Hint OffsetY="-10">
            <Content Function="hintContent" />
            <ContentStyle FontSize="10pt" />
        </Hint>
        <SeriesStyles>
            <wijmo:ChartStyle Stroke="#ff9900" StrokeWidth="3" />
        </SeriesStyles>
        <SeriesHoverStyles>
            <wijmo:ChartStyle StrokeWidth="4"></wijmo:ChartStyle>
        </SeriesHoverStyles>
        <Axis>
            <X Text="Month of the Year">
                <Labels>
                    <AxisLabelStyle FontSize="11pt" Rotation="-45">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle>
                </Labels>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f" />
                </TickMajor>
                <GridMajor Visible="false"></GridMajor>
                <GridMinor Visible="false"></GridMinor>
            </X>
            <Y Text="Number of Hits" AutoMax="false" AutoMin="false" Max="100" Min="0" Compass="West">
                <Labels TextAlign="Center">
                    <AxisLabelStyle FontSize="11pt">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle>
                </Labels>
                <GridMajor Visible="false">
                    <GridStyle Stroke="#353539" StrokeDashArray="- " />
                </GridMajor>
                <GridMinor Visible="false"></GridMinor>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f" />
                </TickMajor>
                <TickMinor Position="Outside">
                    <TickStyle Stroke="#7f7f7f" />
                </TickMinor>
            </Y>
        </Axis>
    </wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        This sample demostrates how to draw a trendline on <strong>C1LineChart</strong>.
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
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
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
