<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Trends.aspx.cs" Inherits="C1LineChart_Trends" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<wijmo:C1LineChart runat="server" ID="C1LineChart1" ShowChartLabels="False" Height="475" Width="756">
		<Animation Enabled="False" />
		<Footer Compass="South" Visible="False">
		</Footer>
		<Legend Compass="South" Orientation="Horizontal"></Legend>
		<Axis>
			<X AnnoFormatString="MM/yyyy">
				<Labels>
					<AxisLabelStyle FontFamily="Tahoma" FontSize="11pt" FontWeight="normal">
						<Fill Color="#3A3A3A"></Fill>
					</AxisLabelStyle>
				</Labels>
				<GridMajor Visible="True">
					<GridStyle Stroke="#efefef" StrokeDashArray="none" />
				</GridMajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#999999" />
				</TickMajor>
			</X>
			<Y Visible="False" Compass="West">
				<Labels TextAlign="Center">
					<AxisLabelStyle FontFamily="Tahoma" FontSize="11pt" FontWeight="normal">
						<Fill Color="#3A3A3A"></Fill>
					</AxisLabelStyle>
				</Labels>
				<GridMajor Visible="True">
					<GridStyle Stroke="#efefef" />
				</GridMajor>
			</Y>
		</Axis>
		<Hint OffsetY="-10">
			<Content Function="hintContent" />
		</Hint>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#436840" StrokeWidth="3" Opacity="0.8" />
			<wijmo:ChartStyle Stroke="#405468" StrokeWidth="3" Opacity="0.8" />
			<wijmo:ChartStyle Stroke="#90524F" StrokeWidth="3" Opacity="0.8" />
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="4" Opacity="1" />
			<wijmo:ChartStyle StrokeWidth="4" Opacity="1" />
			<wijmo:ChartStyle StrokeWidth="4" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:LineChartSeries Label="Top 10,000" LegendEntry="true">
				<Markers Visible="false" Type="Circle">
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2008-11-18" />
							<wijmo:ChartXData DateTimeValue="2008-11-30" />
							<wijmo:ChartXData DateTimeValue="2008-12-09" />
							<wijmo:ChartXData DateTimeValue="2008-12-19" />
							<wijmo:ChartXData DateTimeValue="2008-12-29" />
							<wijmo:ChartXData DateTimeValue="2009-01-09" />
							<wijmo:ChartXData DateTimeValue="2009-01-19" />
							<wijmo:ChartXData DateTimeValue="2009-01-30" />
							<wijmo:ChartXData DateTimeValue="2009-02-09" />
							<wijmo:ChartXData DateTimeValue="2009-02-20" />
							<wijmo:ChartXData DateTimeValue="2009-03-02" />
							<wijmo:ChartXData DateTimeValue="2009-03-09" />
							<wijmo:ChartXData DateTimeValue="2009-03-18" />
							<wijmo:ChartXData DateTimeValue="2009-03-30" />
							<wijmo:ChartXData DateTimeValue="2009-04-15" />
							<wijmo:ChartXData DateTimeValue="2009-05-01" />
							<wijmo:ChartXData DateTimeValue="2009-05-16" />
							<wijmo:ChartXData DateTimeValue="2009-06-01" />
							<wijmo:ChartXData DateTimeValue="2009-06-15" />
							<wijmo:ChartXData DateTimeValue="2009-07-02" />
							<wijmo:ChartXData DateTimeValue="2009-07-14" />
							<wijmo:ChartXData DateTimeValue="2009-08-03" />
							<wijmo:ChartXData DateTimeValue="2009-08-16" />
							<wijmo:ChartXData DateTimeValue="2009-08-31" />
							<wijmo:ChartXData DateTimeValue="2009-09-14" />
							<wijmo:ChartXData DateTimeValue="2009-10-02" />
							<wijmo:ChartXData DateTimeValue="2009-10-16" />
							<wijmo:ChartXData DateTimeValue="2009-11-01" />
							<wijmo:ChartXData DateTimeValue="2009-11-15" />
							<wijmo:ChartXData DateTimeValue="2009-12-01" />
							<wijmo:ChartXData DateTimeValue="2009-12-15" />
							<wijmo:ChartXData DateTimeValue="2010-01-03" />
							<wijmo:ChartXData DateTimeValue="2010-01-15" />
							<wijmo:ChartXData DateTimeValue="2010-02-02" />
							<wijmo:ChartXData DateTimeValue="2010-02-15" />
							<wijmo:ChartXData DateTimeValue="2010-03-01" />
							<wijmo:ChartXData DateTimeValue="2010-03-15" />
							<wijmo:ChartXData DateTimeValue="2010-04-01" />
							<wijmo:ChartXData DateTimeValue="2010-04-15" />
							<wijmo:ChartXData DateTimeValue="2010-04-20" />
							<wijmo:ChartXData DateTimeValue="2010-04-27" />
							<wijmo:ChartXData DateTimeValue="2010-05-04" />
							<wijmo:ChartXData DateTimeValue="2010-05-11" />
							<wijmo:ChartXData DateTimeValue="2010-05-18" />
							<wijmo:ChartXData DateTimeValue="2010-05-26" />
							<wijmo:ChartXData DateTimeValue="2010-06-01" />
							<wijmo:ChartXData DateTimeValue="2010-06-09" />
							<wijmo:ChartXData DateTimeValue="2010-06-15" />
							<wijmo:ChartXData DateTimeValue="2010-06-22" />
							<wijmo:ChartXData DateTimeValue="2010-06-29" />
							<wijmo:ChartXData DateTimeValue="2010-07-06" />
							<wijmo:ChartXData DateTimeValue="2010-07-13" />
							<wijmo:ChartXData DateTimeValue="2010-07-20" />
							<wijmo:ChartXData DateTimeValue="2010-07-27" />
							<wijmo:ChartXData DateTimeValue="2010-08-03" />
							<wijmo:ChartXData DateTimeValue="2010-08-10" />
							<wijmo:ChartXData DateTimeValue="2010-08-17" />
							<wijmo:ChartXData DateTimeValue="2010-8-24" />
							<wijmo:ChartXData DateTimeValue="2010-8-31" />
							<wijmo:ChartXData DateTimeValue="2010-9-1" />
							<wijmo:ChartXData DateTimeValue="2010-9-7" />
							<wijmo:ChartXData DateTimeValue="2010-9-14" />
							<wijmo:ChartXData DateTimeValue="2010-9-21" />
							<wijmo:ChartXData DateTimeValue="2010-9-28" />
							<wijmo:ChartXData DateTimeValue="2010-10-5" />
							<wijmo:ChartXData DateTimeValue="2010-10-12" />
							<wijmo:ChartXData DateTimeValue="2010-10-19" />
							<wijmo:ChartXData DateTimeValue="2010-10-26" />
							<wijmo:ChartXData DateTimeValue="2010-11-1" />
							<wijmo:ChartXData DateTimeValue="2010-11-9" />
							<wijmo:ChartXData DateTimeValue="2010-11-16" />
							<wijmo:ChartXData DateTimeValue="2010-11-23" />
							<wijmo:ChartXData DateTimeValue="2010-11-30" />
							<wijmo:ChartXData DateTimeValue="2010-12-9" />
							<wijmo:ChartXData DateTimeValue="2010-12-14" />
							<wijmo:ChartXData DateTimeValue="2010-12-22" />
							<wijmo:ChartXData DateTimeValue="2010-12-29" />
							<wijmo:ChartXData DateTimeValue="2011-1-4" />
							<wijmo:ChartXData DateTimeValue="2011-1-12" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3.28" />
							<wijmo:ChartYData DoubleValue="3.88" />
							<wijmo:ChartYData DoubleValue="7.05" />
							<wijmo:ChartYData DoubleValue="7.47" />
							<wijmo:ChartYData DoubleValue="7.52" />
							<wijmo:ChartYData DoubleValue="8.5" />
							<wijmo:ChartYData DoubleValue="8.73" />
							<wijmo:ChartYData DoubleValue="9.1" />
							<wijmo:ChartYData DoubleValue="9.11" />
							<wijmo:ChartYData DoubleValue="9.61" />
							<wijmo:ChartYData DoubleValue="10" />
							<wijmo:ChartYData DoubleValue="10.1" />
							<wijmo:ChartYData DoubleValue="10.5" />
							<wijmo:ChartYData DoubleValue="10.39" />
							<wijmo:ChartYData DoubleValue="11.09" />
							<wijmo:ChartYData DoubleValue="11.82" />
							<wijmo:ChartYData DoubleValue="11.84" />
							<wijmo:ChartYData DoubleValue="12.46" />
							<wijmo:ChartYData DoubleValue="13.27" />
							<wijmo:ChartYData DoubleValue="13.49" />
							<wijmo:ChartYData DoubleValue="13.48" />
							<wijmo:ChartYData DoubleValue="13.8" />
							<wijmo:ChartYData DoubleValue="14.38" />
							<wijmo:ChartYData DoubleValue="14.97" />
							<wijmo:ChartYData DoubleValue="15.15" />
							<wijmo:ChartYData DoubleValue="15.76" />
							<wijmo:ChartYData DoubleValue="16" />
							<wijmo:ChartYData DoubleValue="16.47" />
							<wijmo:ChartYData DoubleValue="16.96" />
							<wijmo:ChartYData DoubleValue="17.13" />
							<wijmo:ChartYData DoubleValue="17.45" />
							<wijmo:ChartYData DoubleValue="17.96" />
							<wijmo:ChartYData DoubleValue="18.26" />
							<wijmo:ChartYData DoubleValue="18.69" />
							<wijmo:ChartYData DoubleValue="19.05" />
							<wijmo:ChartYData DoubleValue="19.39" />
							<wijmo:ChartYData DoubleValue="19.76" />
							<wijmo:ChartYData DoubleValue="20.25" />
							<wijmo:ChartYData DoubleValue="20.75" />
							<wijmo:ChartYData DoubleValue="20.59" />
							<wijmo:ChartYData DoubleValue="20.84" />
							<wijmo:ChartYData DoubleValue="21.05" />
							<wijmo:ChartYData DoubleValue="21.23" />
							<wijmo:ChartYData DoubleValue="21.42" />
							<wijmo:ChartYData DoubleValue="21.79" />
							<wijmo:ChartYData DoubleValue="21.89" />
							<wijmo:ChartYData DoubleValue="22.02" />
							<wijmo:ChartYData DoubleValue="22.2" />
							<wijmo:ChartYData DoubleValue="22.53" />
							<wijmo:ChartYData DoubleValue="22.73" />
							<wijmo:ChartYData DoubleValue="22.95" />
							<wijmo:ChartYData DoubleValue="23.16" />
							<wijmo:ChartYData DoubleValue="23.48" />
							<wijmo:ChartYData DoubleValue="23.7" />
							<wijmo:ChartYData DoubleValue="23.87" />
							<wijmo:ChartYData DoubleValue="24.68" />
							<wijmo:ChartYData DoubleValue="25.16" />
							<wijmo:ChartYData DoubleValue="26.64" />
							<wijmo:ChartYData DoubleValue="26.94" />
							<wijmo:ChartYData DoubleValue="26.81" />
							<wijmo:ChartYData DoubleValue="27.21" />
							<wijmo:ChartYData DoubleValue="28.68" />
							<wijmo:ChartYData DoubleValue="27.44" />
							<wijmo:ChartYData DoubleValue="27.9" />
							<wijmo:ChartYData DoubleValue="28.06" />
							<wijmo:ChartYData DoubleValue="28.24" />
							<wijmo:ChartYData DoubleValue="28.82" />
							<wijmo:ChartYData DoubleValue="28.57" />
							<wijmo:ChartYData DoubleValue="28.84" />
							<wijmo:ChartYData DoubleValue="29.22" />
							<wijmo:ChartYData DoubleValue="29.36" />
							<wijmo:ChartYData DoubleValue="29.56" />
							<wijmo:ChartYData DoubleValue="29.62" />
							<wijmo:ChartYData DoubleValue="29.98" />
							<wijmo:ChartYData DoubleValue="30.08" />
							<wijmo:ChartYData DoubleValue="30.41" />
							<wijmo:ChartYData DoubleValue="30.4" />
							<wijmo:ChartYData DoubleValue="30.59" />
							<wijmo:ChartYData DoubleValue="30.79" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
		</SeriesList>
	</wijmo:C1LineChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
	<p>
		This sample demonstrates how simple it is to show trends using a line chart.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>
