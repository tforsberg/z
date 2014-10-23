<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="True" Inherits="C1CandlestickChart_ExportingImage" CodeBehind="ExportingImage.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Src="../ChartCore/ExportImage.ascx" TagName="ExportPanel" TagPrefix="ExportPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<wijmo:C1CandlestickChart ID="C1CandlestickChart1" runat="server" Height="475" Width="756">
		<SeriesList>
			<wijmo:CandlestickChartSeries LegendEntry="True" Label="MSFT">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2011-12-01" />
							<wijmo:ChartXData DateTimeValue="2011-12-02" />
							<wijmo:ChartXData DateTimeValue="2011-12-05" />
							<wijmo:ChartXData DateTimeValue="2011-12-06" />
							<wijmo:ChartXData DateTimeValue="2011-12-07" />
							<wijmo:ChartXData DateTimeValue="2011-12-08" />
							<wijmo:ChartXData DateTimeValue="2011-12-09" />
							<wijmo:ChartXData DateTimeValue="2011-12-12" />
							<wijmo:ChartXData DateTimeValue="2011-12-13" />
							<wijmo:ChartXData DateTimeValue="2011-12-14" />
							<wijmo:ChartXData DateTimeValue="2011-12-15" />
							<wijmo:ChartXData DateTimeValue="2011-12-16" />
							<wijmo:ChartXData DateTimeValue="2011-12-19" />
							<wijmo:ChartXData DateTimeValue="2011-12-20" />
							<wijmo:ChartXData DateTimeValue="2011-12-21" />
							<wijmo:ChartXData DateTimeValue="2011-12-22" />
							<wijmo:ChartXData DateTimeValue="2011-12-23" />
							<wijmo:ChartXData DateTimeValue="2011-12-26" />
							<wijmo:ChartXData DateTimeValue="2011-12-27" />
							<wijmo:ChartXData DateTimeValue="2011-12-28" />
							<wijmo:ChartXData DateTimeValue="2011-12-29" />
							<wijmo:ChartXData DateTimeValue="2011-12-30" />
							<wijmo:ChartXData DateTimeValue="2012-01-02" />
							<wijmo:ChartXData DateTimeValue="2012-01-03" />
							<wijmo:ChartXData DateTimeValue="2012-01-04" />
							<wijmo:ChartXData DateTimeValue="2012-01-05" />
							<wijmo:ChartXData DateTimeValue="2012-01-06" />
							<wijmo:ChartXData DateTimeValue="2012-01-09" />
							<wijmo:ChartXData DateTimeValue="2012-01-10" />
							<wijmo:ChartXData DateTimeValue="2012-01-11" />
							<wijmo:ChartXData DateTimeValue="2012-01-12" />
							<wijmo:ChartXData DateTimeValue="2012-01-13" />
							<wijmo:ChartXData DateTimeValue="2012-01-16" />
							<wijmo:ChartXData DateTimeValue="2012-01-17" />
							<wijmo:ChartXData DateTimeValue="2012-01-18" />
							<wijmo:ChartXData DateTimeValue="2012-01-19" />
							<wijmo:ChartXData DateTimeValue="2012-01-20" />
							<wijmo:ChartXData DateTimeValue="2012-01-23" />
							<wijmo:ChartXData DateTimeValue="2012-01-24" />
							<wijmo:ChartXData DateTimeValue="2012-01-25" />
							<wijmo:ChartXData DateTimeValue="2012-01-26" />
							<wijmo:ChartXData DateTimeValue="2012-01-27" />
							<wijmo:ChartXData DateTimeValue="2012-01-30" />
							<wijmo:ChartXData DateTimeValue="2012-01-31" />
						</Values>
					</X>
					<High DoubleValues="10,12,11,14,16,20,18,17,17.5,20,22,21,22.5,20,21,20.8,20,19,18,17,16,15,15,14,13,12,
						11.5,10.9,10,9,9.5,10,12,11,14,16,20,18,17,17.5,20,22,21,22.5" />
					<Low DoubleValues="7.5,8.6,4.4,4.2,8,9,11,10,12.2,12,16,15.5,16,15,16,16.5,16,16,15,14.5,14,13.5,13,12,11,
						11,10,9,8,7.5,7.9,7.5,8.6,4.4,4.2,8,9,11,10,12.2,12,16,15.5,16" />
					<Open DoubleValues="8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5,17.8,18.6,19.8,18,16.9,15.6,14.7,14.2,13.9,13.2,
						12.8,11.7,11.2,10.5,9.4,8.9,8.4,8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2" />
					<Close DoubleValues="8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5,17.8,18.6,19.8,18,16.9,15.6,14.7,14.2,13.9,13.2,
						12.8,11.7,11.2,10.5,9.4,8.9,8.4,8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5" />
				</Data>
			</wijmo:CandlestickChartSeries>
		</SeriesList>
		<TextStyle FontFamily="Segoe UI, Frutiger, Frutiger Linotype, Dejavu Sans, Helvetica Neue, Arial, sans-serif" FontSize="13px">
		</TextStyle>

		<Header Compass="North" Text="Stock History"></Header>

		<Footer Compass="South" Visible="False"></Footer>

		<Legend Compass="North" Orientation="Horizontal"></Legend>
		<Axis>
			<X>
				<TextStyle FontWeight="normal">
				</TextStyle>
				<GridMajor Visible="True"></GridMajor>

				<GridMinor Visible="False"></GridMinor>

				<TickMajor Position="Outside">
					<TickStyle Stroke="#999999">
					</TickStyle>
				</TickMajor>
			</X>

			<Y Visible="False" Compass="West" Alignment="Far" Text="Stock Price">
				<TextStyle FontWeight="normal">
				</TextStyle>
				<Labels TextAlign="Center"></Labels>

				<GridMajor Visible="True"></GridMajor>

				<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>
		<CandlestickChartSeriesStyles>
			<wijmo:CandlestickChartStyle>
				<HighLow Width="2">
					<Fill Color="#8C8C8C"></Fill>
				</HighLow>
				<FallingClose Width="6">
					<Fill Color="#F07E6E"></Fill>
				</FallingClose>
				<RisingClose Width="6">
					<Fill Color="#90CD97"></Fill>
				</RisingClose>
			</wijmo:CandlestickChartStyle>
		</CandlestickChartSeriesStyles>
		<Hint>
			<ContentStyle FontFamily="Segoe UI, Frutiger, Frutiger Linotype, Dejavu Sans, Helvetica Neue, Arial, sans-serif" FontSize="12px">
			</ContentStyle>
			<Content Function="hintContent" />
			<HintStyle Stroke="Transparent">
				<Fill Color="#444444">
				</Fill>
			</HintStyle>
		</Hint>
	</wijmo:C1CandlestickChart>
	<script type="text/javascript">
		function hintContent() {
			return this.label + ' - ' +
							Globalize.format(this.x, "d") +
							'\n High:' + this.high +
							'\n Low:' + this.low +
							'\n Open:' + this.open +
							'\n Close:' + this.close;
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
	<p>
		This sample demostrates how to export <strong>C1CandlestickChart</strong> to different 
	formats of image.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
	<ExportPanel:ExportPanel ID="ExportPanel1" runat="server" ChartType="C1CandlestickChart" />
</asp:Content>

