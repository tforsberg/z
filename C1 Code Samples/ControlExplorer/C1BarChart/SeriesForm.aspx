<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1BarChart_SeriesForm" Codebehind="SeriesForm.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756" ClusterSpacing="5" Horizontal="false" ClusterRadius="10">
		<Axis>
			<X Text="Graphics Card">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
			<Y Text="Percentage (%)" Compass="West" Max="7" Min="0">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>
		<Footer Compass="South" Visible="False"></Footer>
		<Legend Text="Month"></Legend>
		<Header Text="Steam Top 3 Video Cards - Hardware Survey"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#5f9996" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#6aaba7" ColorEnd="#5f9996"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#afe500" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#c3ff00" ColorEnd="#afe500"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#b2c76d" StrokeWidth="1.5">
				<Fill Type="LinearGradient" ColorBegin="#c7de7a" ColorEnd="#b2c76d"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="Jun" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3.70" />
							<wijmo:ChartYData DoubleValue="4.42" />
							<wijmo:ChartYData DoubleValue="4.92" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Jul" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3.57" />
							<wijmo:ChartYData DoubleValue="4.23" />
							<wijmo:ChartYData DoubleValue="5.46" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Aug" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="3.79" />
							<wijmo:ChartYData DoubleValue="4.11" />
							<wijmo:ChartYData DoubleValue="5.84" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates how to change bars form in series.
	</p>
<h3>Test the features</h3>
<ul>
    <li>Note the chart bars rounded corners.</li>
    <li>In order to acheive this, simply set any numeric value to 'ClusterRadius' option.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

