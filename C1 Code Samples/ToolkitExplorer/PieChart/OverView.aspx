<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="OverView.aspx.cs" Inherits="PieChart_OverView" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="piechart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
    </asp:Panel>
    <wijmo:C1PieChartExtender runat="server" ID="PieChartExtender1" Radius="140" TargetControlID="piechart">
        <Legend Visible="true"></Legend>
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Header Text="Steam - Mac Hardware">
        </Header>
        <SeriesStyles>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#AFE500">
                <Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#C3FF00" ColorEnd="#AFE500"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#7FC73C">
                <Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#8EDE43" ColorEnd="#7FC73C"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#5F9996">
                <Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#6AABA7" ColorEnd="#5F9996"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#3E5F77">
                <Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#466A85" ColorEnd="#3E5F77"></Fill>
            </wijmo:ChartStyle>
            <wijmo:ChartStyle StrokeWidth="1.5" Stroke="#959595">
                <Fill Type="LinearGradient" LinearGradientAngle="180" ColorBegin="#A6A6A6" ColorEnd="#959595"></Fill>
            </wijmo:ChartStyle>
        </SeriesStyles>
        <SeriesList>
            <wijmo:PieChartSeries Label="MacBook Pro" Offset="15" Data="46.78">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="iMac" Data="23.18">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="MacBook" Data="20.25">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Mac Pro" Data="5.41">
            </wijmo:PieChartSeries>
            <wijmo:PieChartSeries Label="Mac mini" Data="3.44">
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
    </wijmo:C1PieChartExtender>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
    <p>
        The C1PieChartExtender(wijpiechart at client side) allows you to create customized pie charts. The samples in
        this section highlight some of the unique features of C1PieChartExtender, and they will
        help you get started with the C1PieChartExtender.</p>
    <p>
        The source in this sample will show you how to add a header to the chart; how to
        add label text to the legend; how to populate the chart with data; and how to style
        the pie pieces.</p>
</asp:Content>
