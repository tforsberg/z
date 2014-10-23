<%@ Page Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeBehind="ChartLabels.aspx.cs" Inherits="ControlExplorer.C1PieChart.ChartLabels" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="140" Height="475" Width="756" CssClass="ui-widget ui-widget-content ui-corner-all">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Legend Visible="true"></Legend>
        <Header Text="Steam Primary Display Resolution (PC)">
        </Header>
        <SeriesStyles>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#AFE500">
                <Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#c3ff00" ColorEnd="#afe500"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#7FC73C">
                <Fill Type="LinearGradient" LinearGradientAngle="90" ColorBegin="#acc73c" ColorEnd="#7FC73C"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#5F9996">
                <Fill Type="LinearGradient" LinearGradientAngle="90" ColorBegin="#5f9996" ColorEnd="#5F9996"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#3E5F77">
                <Fill Type="LinearGradient" LinearGradientAngle="90" ColorBegin="#3e5f77" ColorEnd="#3E5F77"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#959595">
                <Fill Type="LinearGradient" LinearGradientAngle="90" ColorBegin="#959595" ColorEnd="#959595"></Fill>
            </wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesList>
            <wijmo:PieChartSeries Label="1366 x 768" Data="22.29" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="1920 x 1080" Data="32.64" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="1600 x 900" Data="7.9" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="1680 x 1050" Data="7.6" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="1440 x 900" Data="5.64" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="1024 x 768" Data="3.29" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Other" Data="20.64" LegendEntry="true">
            </wijmo:PieChartSeries>
        </SeriesList>
        <Footer Compass="South" Visible="False">
        </Footer>
        <Axis>
            <Y Visible="False" Compass="West">
                <Labels TextAlign="Center">
                </Labels>
                <GridMajor Visible="True">
                </GridMajor>
            </Y>
        </Axis>
    </wijmo:C1PieChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>The samples shows how to customize piechart's label.</p>
    <h3>Test the features</h3>
    <ul>
        <li>Note the labels could be position inside and outseide the chart.</li>
        <li>Go to the 'Sources' tab to see how to setup labels position and orientation through the widget initialization </li>
    </ul>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="inlinediv">
                    <label>Label position:</label>
                    <asp:DropDownList runat="server" ID="c1cbb1" Width="80">
                            <asp:ListItem Text="inside" Value="inside" Selected="true" />
                            <asp:ListItem Text="outside" Value="outside" />
                    </asp:DropDownList>
                </li>
                <li class="inlinediv fullwidth">
                    <label>Offset</label>
                    <wijmo:C1Slider ID="c1Slider1" runat="server" Orientation="Horizontal" Range="false" Min="0" Max="50"
                        Step="1" Value="50" />
                    <asp:TextBox ID="c1Input1" Width="100" runat="server"  Text="50">
                    </asp:TextBox>
                </li>
                <li class="fullwidth inlinediv">
                    <label>Connector thickness</label>
                    <wijmo:C1Slider ID="c1Slider2" runat="server" Orientation="Horizontal" Range="false" Min="0" Max="200"
                        Step="1" Value="200" />
                    <asp:TextBox ID="c1Input2" Width="100" runat="server"  Text="2">
                    </asp:TextBox>
                </li>
            </ul>
        </div>
    </div>
    <div>
    </div>
    <script type="text/javascript">

        var offsetID = '#<%=c1Input1.ClientID %>';
        var thicknessID = '#<%=c1Input2.ClientID %>';
        var chartID = '#<%=C1PieChart1.ClientID %>';
        var offsetSliderID = '#<%=c1Slider1.ClientID %>';
        var thicknessSliderID = '#<%=c1Slider2.ClientID %>';
        var positionID = '#<%=c1cbb1.ClientID %>';
        function hintContent() {
            return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
        }
        function updateInput(linkedNumberInput, value, isThickness) {
            var endValue = isThickness ? value / 100 : value;
            linkedNumberInput.val(endValue);
        }
        function changeProperties() {
            var position = $(positionID).val();
            var offset = $(offsetID).val();
            var thickness = $(thicknessID).val();
            if (isNaN(offset) || isNaN(thickness))
                return;
            if (position == "inside")
                offset = 0;
            var labels = {
                position: position,
                offset: parseFloat(offset),
                connectorStyle: {
                    "stroke-width": parseFloat(thickness)
                }
            };
            $(chartID).c1piechart("option", "labels", labels);
        }
        $(document).ready(function () {
            var sliders = [$(thicknessSliderID), $(offsetSliderID)];
            $(positionID).change(function () {
                changeProperties();
            });
            $.each(sliders, function (index, item) {
                var isThickness = '#' + item.attr('id') == thicknessSliderID;
                var linkedNumberInput;
                if (isThickness) {
                    linkedNumberInput = $(thicknessID);
                }
                else
                    linkedNumberInput = $(offsetID);
                item.c1slider({
                    slide: function (e, a) {
                        updateInput(linkedNumberInput, a.value, isThickness);
                        changeProperties();
                    },
                    change: function (e, a) {
                        updateInput(linkedNumberInput, a.value, isThickness);
                        changeProperties();
                    }
                });
            });
        });
    </script>
</asp:Content>
