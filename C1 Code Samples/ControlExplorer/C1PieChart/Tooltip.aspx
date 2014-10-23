<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.master" CodeBehind="Tooltip.aspx.cs" Inherits="ControlExplorer.C1PieChart.Tooltip" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Slider" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <link type="text/css" rel="stylesheet" href="pieChart.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="180"  Height="450" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
        <Hint OffsetX="0" OffsetY="0">
            <Content Function="hintContent"  />
        </Hint>
        <Legend Visible="false"></Legend>
        <Animation Enabled="false" />
        <Header Text="Top 5 Chinese exports (2012)">
        </Header>
        <SeriesStyles>
            <wijmo:ChartStyle Opacity="0.7" StrokeWidth="0">
                <Fill Color="#e31100"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Opacity="0.7" StrokeWidth="0">
                <Fill Color="#0c4496"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Opacity="0.7" StrokeWidth="0">
                <Fill Color="#bedc00"></Fill>
            </wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesList>
            <wijmo:PieChartSeries Label="Electronics" Data="23.8" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Machines, engines" Data="18.4" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Clothing" Data="4.3" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Furniture" Data="3.8" LegendEntry="true">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Medical and technical equipment" Data="3.6" LegendEntry="true">
            </wijmo:PieChartSeries>
             <wijmo:PieChartSeries Label="Other" Data="46.1" LegendEntry="true">
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
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
     <div>
       <p>The <strong>C1PieChart</strong> allows you to create customized pie charts. The samples in this section highlight some of the unique features of the widget, and they will help you get started with the wijpiechart widget.</p>
            <p>The source in this sample will show you how to add a header to the chart; how to add label text to the legend; how to populate the chart with data; and how to style the pie pieces.</p>
            <h3>Test the features</h3>
            <ul>
                <li>Hover over a chart segment to see the tooltip.</li>
                <li>Note all tooltips have unique content with the common header</li>
                <li>Go to the 'Sources' tab to see how to setup grid lines on your chart </li>
            </ul>
        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth inlinediv">
                    <label>Compass position</label>
                    <asp:DropDownList runat="server" AutoComplete="true" ID="c1cbb1" Width="80">
                            <asp:ListItem Text="north" Value="north" Selected="true" />
                            <asp:ListItem Text="east" Value="east" />
                            <asp:ListItem Text="south" Value="south" />
                            <asp:ListItem Text="west" Value="west" />
                    </asp:DropDownList>
                </li>
                <li class="fullwidth inlinediv">
                    <label>Offset X</label>
                    <wijmo:C1Slider ID="c1Slider1"  runat="server" Width="300"  Value="0" Orientation="Horizontal" Range="false" Min="0" Max="30" Step="1" />
                    <asp:TextBox ID="c1Input1" Width="100"  Text="0" runat="server">
                    </asp:TextBox>
                </li>
                <li class="fullwidth inlinediv">
                    <label>Offset Y</label>
                    <wijmo:C1Slider ID="c1Slider2" runat="server"  Value="0" Width="300" Orientation="Horizontal" Range="false" Min="0" Max="30"  Step="1" />
                    <asp:TextBox ID="c1Input2"  Width="100"  runat="server" Value="0">
                    </asp:TextBox>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">

        var offsetXID = '#<%=c1Input1.ClientID %>';
        var offsetYID = '#<%=c1Input2.ClientID %>';
        var chartID = '#<%=C1PieChart1.ClientID %>';
        var offsetXSliderID = '#<%=c1Slider1.ClientID %>';
        var offsetYSliderID = '#<%=c1Slider2.ClientID %>';
        var positionID = '#<%=c1cbb1.ClientID %>';
        function hintContent() {
            return this.data.label + "\n" +
                                    "Percent of total export: " + Globalize.format(this.value / this.total, "p2");
        }
        function changeProperties() {
            var hint = $(chartID).c1piechart('option', 'hint');
            var position = $(positionID).val();
            var x = $(offsetXID).val();
            var y = $(offsetYID).val();
            if (isNaN(x) || isNaN(y)) return;
            hint.compass = position;
            hint.offsetX = parseInt(x);
            hint.offsetY = parseInt(y);
            $(chartID).c1piechart('option', 'hint', hint);
        }
        $(document).ready(function () {
            var sliders = [$(offsetYSliderID), $(offsetXSliderID)];
            $(positionID).change(function () {
                    changeProperties();
            });
            $.each(sliders, function (index, item) {
                var isOffsetY = '#' + item.attr('id') == offsetYSliderID;
                var linkedNumberInput;
                if (isOffsetY) {
                    linkedNumberInput = $(offsetYID);
                }
                else
                    linkedNumberInput = $(offsetXID);
                item.c1slider({
                    slide: function (e, a) {
                        linkedNumberInput.val(a.value);
                        changeProperties();
                    },
                    change: function (e, a) {
                        linkedNumberInput.val(a.value);
                        changeProperties();
                    }
                });
            });
        });
    </script>
</asp:Content>