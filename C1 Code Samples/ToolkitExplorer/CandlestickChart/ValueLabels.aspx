<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="ValueLabels.aspx.cs"
	Inherits="ToolkitExplorer.CandlestickChart.ValueLabels" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel runat="server" ID="panel1" Height="475" Width="756">
	</asp:Panel>
	<wijmo:C1CandlestickChartExtender ID="Panel1_C1CandlestickChartExtender" runat="server"
		Culture="en-US" TargetControlID="Panel1">
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
						</Values>
					</X>
					<High DoubleValues="10,12,11,14,16" />
					<Low DoubleValues="7.5,8.6,4.4,4.2,8" />
					<Open DoubleValues="8,8.6,11,6.2,13.8" />
					<Close DoubleValues="8.6,11,6.2,13.8,15,14,12,16,15" />
				</Data>
			</wijmo:CandlestickChartSeries>
		</SeriesList>
		<TextStyle FontFamily="Segoe UI, Frutiger, Frutiger Linotype, Dejavu Sans, Helvetica Neue, Arial, sans-serif"
			FontSize="13px">
		</TextStyle>
		<Header Compass="North" Text="Stock History">
		</Header>
		<Footer Compass="South" Visible="False">
		</Footer>
		<Legend Compass="North" Orientation="Horizontal"></Legend>
		<Axis>
			<X AnnoMethod="ValueLabels">
				<TextStyle FontWeight="normal">
				</TextStyle>
				<GridMajor Visible="True">
				</GridMajor>
				<GridMinor Visible="False">
				</GridMinor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#999999">
					</TickStyle>
				</TickMajor>
				<ValueLabelList>
					<wijmo:ValueLabel DateTimeValue="2011-12-01" Text="Monday">
					</wijmo:ValueLabel>
					<wijmo:ValueLabel DateTimeValue="2011-12-02" Text="Tuesday">
					</wijmo:ValueLabel>
					<wijmo:ValueLabel DateTimeValue="2011-12-05" Text="Wednesday">
					</wijmo:ValueLabel>
					<wijmo:ValueLabel DateTimeValue="2011-12-06" Text="Thursday">
					</wijmo:ValueLabel>
					<wijmo:ValueLabel DateTimeValue="2011-12-07" Text="Friday">
					</wijmo:ValueLabel>
				</ValueLabelList>
			</X>
			<Y Visible="False" Compass="West" Alignment="Far" Text="Stock Price">
				<TextStyle FontWeight="normal">
				</TextStyle>
				<Labels TextAlign="Center">
				</Labels>
				<GridMajor Visible="True">
				</GridMajor>
				<GridMinor Visible="False">
				</GridMinor>
			</Y>
		</Axis>
		<CandlestickChartSeriesStyles>
			<wijmo:CandlestickChartStyle>
				<HighLow Width="2">
					<Fill Color="#8C8C8C">
					</Fill>
				</HighLow>
				<FallingClose Width="6">
					<Fill Color="#F07E6E">
					</Fill>
				</FallingClose>
				<RisingClose Width="6">
					<Fill Color="#90CD97">
					</Fill>
				</RisingClose>
			</wijmo:CandlestickChartStyle>
		</CandlestickChartSeriesStyles>
		<Hint>
			<ContentStyle FontFamily="Segoe UI, Frutiger, Frutiger Linotype, Dejavu Sans, Helvetica Neue, Arial, sans-serif"
				FontSize="12px">
			</ContentStyle>
			<Content Function="hintContent" />
			<HintStyle Stroke="Transparent">
				<Fill Color="#444444">
				</Fill>
			</HintStyle>
		</Hint>
	</wijmo:C1CandlestickChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This demo shows how to use <b>ValueLabels</b> property to render customized axis ticks.
	</p>
</asp:Content>
