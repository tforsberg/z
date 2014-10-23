<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.CompositeChart.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function hintContent() {
            return this.label + '\n ' + this.y + '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="CompositeChart1" runat="server" Height="475" Width="756">
    </asp:Panel>
    <wijmo:C1CompositeChartExtender runat="server" ID="C1CompositeChartExtender1" TargetControlID="CompositeChart1">
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
                    <wijmo:PieChartSeries Label="MacBook Pro" LegendEntry="true" Data="46.78" Offset="15">
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
            <wijmo:CompositeChartSeries Label="Canada" LegendEntry="true" Type="Line">
                <Data>
                    <X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
                    <Y DoubleValues="1, 3, 4, 7, 2" />
                </Data>
            </wijmo:CompositeChartSeries>
        </SeriesList>
    </wijmo:C1CompositeChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        The C1CompositeChartExtender allows you to draw multiple types of chart in one canvas simultaneously. 
        This sample uses a bar and line chart. The line chart emphasizes the gradual increase of visitors over time.
    </p>
</asp:Content>
