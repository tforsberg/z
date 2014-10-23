<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="HighLow.aspx.cs" Inherits="ControlExplorer.C1CandlestickChart.HighLow" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1CandlestickChart ID="C1CandlestickChart1" runat="server" Height="475" Width="756" Type="Hl">
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
				<HighLow Width="6">
					<Fill Color="#88bde6"></Fill>
				</HighLow>
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
						   '\n Low:' + this.low;
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This demo shows how to create candlestick chart with Hl type.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
