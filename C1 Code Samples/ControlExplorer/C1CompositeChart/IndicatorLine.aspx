<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="IndicatorLine.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.IndicatorLine" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1CompositeChart runat="server" ID="CompositeChart1" Width="756" Height="475">

<Footer Compass="South" Visible="False"></Footer>
		<Indicator Visible="true">
			
		</Indicator>
		<Axis>
			<X>
				<GridMajor Visible="false"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
			<Y Text="Total Hardware" Compass="West" Visible="false">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>
		<SeriesList>
			<wijmo:CompositeChartSeries Label="West" LegendEntry="True" Type="Column">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="5" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="7" />
							<wijmo:ChartYData DoubleValue="2" />
						</Values>
					</Y>
				</Data>
				<CandlestickSeries LegendEntry="True">
				</CandlestickSeries>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="Central" LegendEntry="True" Type="Column">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="1" />
						</Values>
					</Y>
				</Data>
				<CandlestickSeries LegendEntry="True">
				</CandlestickSeries>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="East" LegendEntry="True" Type="Column">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="5" />
						</Values>
					</Y>
				</Data>
				<CandlestickSeries LegendEntry="True">
				</CandlestickSeries>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Center="150, 150" Label="asdfdsfdsf" LegendEntry="True" Radius="60" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="46.78" HintContent="" Label="MacBook Pro" LegendEntry="True" Offset="15">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="23.18" HintContent="" Label="iMac" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="20.25" HintContent="" Label="MacBook" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
				<CandlestickSeries LegendEntry="True">
				</CandlestickSeries>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="Steam1" LegendEntry="True" Type="Line">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="2" />
							<wijmo:ChartYData DoubleValue="9" />
							<wijmo:ChartYData DoubleValue="5" />
						</Values>
					</Y>
				</Data>
				<LineMarkers Visible="True">
				</LineMarkers>
				<CandlestickSeries LegendEntry="True">
				</CandlestickSeries>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="Steam2" LegendEntry="True" Type="Line">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Desktops" />
							<wijmo:ChartXData StringValue="Notebooks" />
							<wijmo:ChartXData StringValue="AIO" />
							<wijmo:ChartXData StringValue="Tablets" />
							<wijmo:ChartXData StringValue="Phones" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1" />
							<wijmo:ChartYData DoubleValue="3" />
							<wijmo:ChartYData DoubleValue="4" />
							<wijmo:ChartYData DoubleValue="7" />
							<wijmo:ChartYData DoubleValue="2" />
						</Values>
					</Y>
				</Data>
				<LineMarkers Type="Tri" Visible="True">
				</LineMarkers>
				<CandlestickSeries LegendEntry="True">
				</CandlestickSeries>
			</wijmo:CompositeChartSeries>
		</SeriesList>
		<Header Text="Hardware Distribution"></Header>
		
	</wijmo:C1CompositeChart>
	
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This demos using <b>Indicator</b> property to show indicator line and tooltip when mouse down and move inside of the chart area.
	</p>
</asp:Content>
