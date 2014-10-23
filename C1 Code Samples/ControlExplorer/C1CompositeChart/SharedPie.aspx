<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SharedPie.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.SharedPie" %>

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
            <wijmo:CompositeChartSeries Label="A New SharedPie" LegendEntry="true" Type="SharedPie" Radius="60">
                <SharedPieChartSeries>
                    <wijmo:CompositeSharedPieSeries Label="sharedPieNo1" LegendEntry="true" Center="200, 250"
                        Radius="120">
                        <PieSeriesList>
                            <wijmo:PieChartSeries Label="MacBook Pro" LegendEntry="true" Data="26.78" Offset="0">
                            </wijmo:PieChartSeries>
                            <wijmo:PieChartSeries Label="iMac" LegendEntry="true" Data="43.18" Offset="0">
                            </wijmo:PieChartSeries>
                            <wijmo:PieChartSeries Label="MacBook" LegendEntry="true" Data="80.25" Offset="0">
                            </wijmo:PieChartSeries>
                        </PieSeriesList>
                    </wijmo:CompositeSharedPieSeries>
                    <wijmo:CompositeSharedPieSeries Label="sharedPieNo2" LegendEntry="true" Center="450, 250"
                        Radius="120">
                        <PieSeriesList>
                            <wijmo:PieChartSeries Label="MacBook Pro" LegendEntry="true" Data="46.78" Offset="0">
                            </wijmo:PieChartSeries>
                            <wijmo:PieChartSeries Label="iMac" LegendEntry="true" Data="49.18" Offset="0">
                            </wijmo:PieChartSeries>
                            <wijmo:PieChartSeries Label="MacBook" LegendEntry="true" Data="180.25" Offset="0">
                            </wijmo:PieChartSeries>
                        </PieSeriesList>
                    </wijmo:CompositeSharedPieSeries>
                </SharedPieChartSeries>
            </wijmo:CompositeChartSeries>
            
        </SeriesList>
    </wijmo:C1CompositeChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <b>C1CompositeChart</b> allows you to draw multiple types of chart in one canvas simultaneously. 
        This sample uses a "sharePie" chart.
    </p>
</asp:Content>
