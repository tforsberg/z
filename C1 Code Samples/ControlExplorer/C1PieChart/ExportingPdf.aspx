<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="True" Inherits="C1PieChart_ExportingPdf" CodeBehind="ExportingPdf.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Src="../ChartCore/ExportPdf.ascx" TagName="ExportPanel" TagPrefix="ExportPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1PieChart runat="server" ID="C1PieChart1" Radius="140" Height="475" Width="756" CssClass="ui-widget ui-widget-content ui-corner-all">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Legend Visible="true"></Legend>
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
    </wijmo:C1PieChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        This sample demostrates how to export <strong>C1PieChart</strong> to Pdf file.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <ExportPanel:ExportPanel ID="ExportPanel1" runat="server" ChartType="C1PieChart" />
</asp:Content>

