<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Wijmo.master" CodeBehind="ColorsFormatting.aspx.cs" Inherits="ControlExplorer.C1PieChart.ColorsFormatting" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type="text/javascript">
	    function hintContent() {
	        return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
	    }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1PieChart runat = "server" StartAngle="0"  ID="C1PieChart1" Radius="180" InnerRadius="150" Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
        <Animation Enabled="false" />
		<Legend Visible="false"></Legend>
		<Header Text="Steam - Mac Hardware"></Header>
        <SeriesStyles>
            <wijmo:ChartStyle Opacity="0.7" Fill-Color="#2d2d2d" StrokeWidth="1.0" Stroke="#2d2d2d">
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Opacity="0.7" Fill-Color="#5f9996" StrokeWidth="1.0" Stroke="#5f9996">
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Opacity="0.7" Fill-Color="#afe500" StrokeWidth="1.0" Stroke="#afe500">
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Opacity="0.7" Fill-Color="#b2c76d" StrokeWidth="1.0" Stroke="#b2c76d">
            </wijmo:ChartStyle>
            <wijmo:ChartStyle Opacity="0.7" Fill-Color="#959595" StrokeWidth="1.0" Stroke="#959595">
            </wijmo:ChartStyle>
        </SeriesStyles>
        <ChartLabelStyle Fill-Color="#111111">
        </ChartLabelStyle>
        <SeriesHoverStyles>
            <wijmo:ChartStyle Opacity="0.85" StrokeWidth="1.5">
                <Fill ColorBegin="#333333" ColorEnd="#2d2d2d"></Fill>
            </wijmo:ChartStyle>
             <wijmo:ChartStyle Opacity="0.85" StrokeWidth="1.5">
                <Fill ColorBegin="#6aaba7" ColorEnd="#5f9996"></Fill>
            </wijmo:ChartStyle>
             <wijmo:ChartStyle Opacity="0.85" StrokeWidth="1.5">
                <Fill ColorBegin="#c3ff00" ColorEnd="#afe500"></Fill>
            </wijmo:ChartStyle>
             <wijmo:ChartStyle Opacity="0.85" StrokeWidth="1.5">
                <Fill ColorBegin="#c7de7a" ColorEnd="#b2c76d"></Fill>
            </wijmo:ChartStyle>
             <wijmo:ChartStyle Opacity="0.85" StrokeWidth="1.5">
                <Fill ColorBegin="#a6a6a6" ColorEnd="#959595"></Fill>
            </wijmo:ChartStyle>
        </SeriesHoverStyles>
		<SeriesList>
			<wijmo:PieChartSeries Label="MacBook Pro" Data="46.78" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="iMac" Data="23.18" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="MacBook" Data="20.25" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Mac Pro" Data="5.41" LegendEntry="true"></wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Mac mini" Data="3.44" LegendEntry="true"></wijmo:PieChartSeries>
		</SeriesList>
	</wijmo:C1PieChart>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
       <h3>Test the features</h3>
        <ul>
            <li>Note the chart has non default segment colors.</li>
            <li>Note each chart segment changes it color on mouse hover.</li>
            <li>Go to the 'Sources' tab to see how to setup chart sectors colors through widget initialization using 'seriesStyles' and 'serisHoverStyles' options</li>
        </ul>
</asp:Content>