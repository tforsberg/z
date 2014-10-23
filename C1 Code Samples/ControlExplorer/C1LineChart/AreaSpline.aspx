﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="AreaSpline.aspx.cs" Inherits="ControlExplorer.C1LineChart.AreaSpline" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.y;
		}
		function pageLoad() {
			var resizeTimer = null;

			$(window).resize(function () {
				window.clearTimeout(resizeTimer);
				resizeTimer = window.setTimeout(function () {
					var jqLine = $("#<%= C1LineChart1.ClientID %>"),
						width = jqLine.width(),
						height = jqLine.height();

					if (!width || !height) {
						window.clearTimeout(resizeTimer);
						return;
					}

					jqLine.c1linechart("redraw", width, height);
				}, 250);
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1LineChart runat="server" ID="C1LineChart1" Type="Area" ShowChartLabels="False" Height="475" Width="756">
		<Header Text="Twitter trends in October 2010">
		</Header>
		<Hint OffsetY="-10">
			<Content Function="hintContent" />
		</Hint>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="8" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#00a6dd" StrokeWidth="5" Opacity="0.8" />
		</SeriesStyles>
		<SeriesList>
			<wijmo:LineChartSeries Label="#Wijmo" LegendEntry="true" FitType="Spline">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2010-11-21" />
							<wijmo:ChartXData DateTimeValue="2010-11-22" />
							<wijmo:ChartXData DateTimeValue="2010-11-23" />
							<wijmo:ChartXData DateTimeValue="2010-11-24" />
							<wijmo:ChartXData DateTimeValue="2010-11-25" />
							<wijmo:ChartXData DateTimeValue="2010-11-26" />
							<wijmo:ChartXData DateTimeValue="2010-11-27" />
							<wijmo:ChartXData DateTimeValue="2010-11-28" />
							<wijmo:ChartXData DateTimeValue="2010-11-29" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="12" />
							<wijmo:ChartYData DoubleValue="30" />
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="22" />
							<wijmo:ChartYData DoubleValue="14" />
							<wijmo:ChartYData DoubleValue="25" />
							<wijmo:ChartYData DoubleValue="41" />
							<wijmo:ChartYData DoubleValue="14" />
							<wijmo:ChartYData DoubleValue="3" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
		</SeriesList>
	</wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to create an area spline chart. The line is curved from point to point instead of drawing a straight line from point to point. The two options used in this sample are:</p>
	<ul>
		<li><b>Type="Area"</b> - Tells the lines to render as filled areas</li>
		<li><b>SeriesList.LineChartSeries.FitType="Spline"</b> - Tells this line in the series to render as a curved line</li>
	</ul>
</asp:Content>