<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="FixedLabelWidth.aspx.cs" Inherits="C1BarChart_FixedLabelWidth" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756">
		<Axis>
			<Y Text="Percentage (%)" Compass="West"></Y>
			<X Text="Graphics Card">
				<Labels Width="80" TextAlign="Center">
					<AxisLabelStyle Rotation="-45"></AxisLabelStyle>
				</Labels>
			</X>
		</Axis>
		<Legend Text="Month"></Legend>
		<Header Text="Steam Top 10 Video Cards - Hardware Survey"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#2d2d2d" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#333333" ColorEnd="#2d2d2d"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#5f9996" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#6aaba7" ColorEnd="#5f9996"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#afe500" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#c3ff00" ColorEnd="#afe500"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#b2c76d" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#c7de7a" ColorEnd="#b2c76d"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#959595" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#a6a6a6" ColorEnd="#959595"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="May" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.91" />
							<wijmo:ChartYData DoubleValue="1.90" />
							<wijmo:ChartYData DoubleValue="1.61" />
							<wijmo:ChartYData DoubleValue="2.23" />
							<wijmo:ChartYData DoubleValue="2.85" />
							<wijmo:ChartYData DoubleValue="3.64" />
							<wijmo:ChartYData DoubleValue="4.46" />
							<wijmo:ChartYData DoubleValue="5.89" />
							<wijmo:ChartYData DoubleValue="4.22" />
							<wijmo:ChartYData DoubleValue="4.66" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Jun" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.82" />
							<wijmo:ChartYData DoubleValue="1.88" />
							<wijmo:ChartYData DoubleValue="1.77" />
							<wijmo:ChartYData DoubleValue="2.33" />
							<wijmo:ChartYData DoubleValue="2.97" />
							<wijmo:ChartYData DoubleValue="3.70" />
							<wijmo:ChartYData DoubleValue="4.42" />
							<wijmo:ChartYData DoubleValue="5.93" />
							<wijmo:ChartYData DoubleValue="4.92" />
							<wijmo:ChartYData DoubleValue="5.20" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Jul" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.94" />
							<wijmo:ChartYData DoubleValue="1.80" />
							<wijmo:ChartYData DoubleValue="1.81" />
							<wijmo:ChartYData DoubleValue="2.23" />
							<wijmo:ChartYData DoubleValue="2.83" />
							<wijmo:ChartYData DoubleValue="3.57" />
							<wijmo:ChartYData DoubleValue="4.23" />
							<wijmo:ChartYData DoubleValue="5.90" />
							<wijmo:ChartYData DoubleValue="5.46" />
							<wijmo:ChartYData DoubleValue="5.62" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Aug" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.89" />
							<wijmo:ChartYData DoubleValue="1.84" />
							<wijmo:ChartYData DoubleValue="1.96" />
							<wijmo:ChartYData DoubleValue="2.29" />
							<wijmo:ChartYData DoubleValue="2.93" />
							<wijmo:ChartYData DoubleValue="3.79" />
							<wijmo:ChartYData DoubleValue="4.11" />
							<wijmo:ChartYData DoubleValue="5.79" />
							<wijmo:ChartYData DoubleValue="5.84" />
							<wijmo:ChartYData DoubleValue="6.02" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Sep" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.72" />
							<wijmo:ChartYData DoubleValue="1.80" />
							<wijmo:ChartYData DoubleValue="2.17" />
							<wijmo:ChartYData DoubleValue="2.40" />
							<wijmo:ChartYData DoubleValue="3.30" />
							<wijmo:ChartYData DoubleValue="3.97" />
							<wijmo:ChartYData DoubleValue="4.40" />
							<wijmo:ChartYData DoubleValue="6.59" />
							<wijmo:ChartYData DoubleValue="6.82" />
							<wijmo:ChartYData DoubleValue="7.04" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		The <strong>C1BarChart</strong> supports fixed label width, rotation and alignment of the label.
	</p>
	<p>In this sample, the following properties are used to obtain the fixed width of the axis labels.</p>
	<ul>
		<li>Labels.Width for setting the fixed with of the label</li>
		<li>Labels.TextAlign for setting the alignment of the label</li>
		<li>Labels.Style.Rotation for setting the rotation of the label</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

