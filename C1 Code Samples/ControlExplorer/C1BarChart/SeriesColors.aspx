<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1BarChart_SeriesColors" Codebehind="SeriesColors.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756" ClusterSpacing="5">
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
			<wijmo:ChartStyle Opacity="0.8" Stroke="Gray" StrokeWidth="1" >
				<Fill ColorBegin="#1AA3D1" ColorEnd="#1AA3D1" LinearGradientAngle="90" Type="LinearGradient">
					<ColorMiddles>
						<wijmo:ColorMiddle Color="#A0DFF3" Offset="50" />
					</ColorMiddles>
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="Gray" StrokeWidth="1" >
				<Fill ColorBegin="#1A66D1" ColorEnd="#1A66D1" LinearGradientAngle="90" Type="LinearGradient">
					<ColorMiddles>
						<wijmo:ColorMiddle Color="#AFCDF5" Offset="50" />
					</ColorMiddles>
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="Gray" StrokeWidth="1" >
				<Fill ColorBegin="#381AD1" ColorEnd="#381AD1" LinearGradientAngle="90" Type="LinearGradient">
					<ColorMiddles>
						<wijmo:ColorMiddle Color="#8A75EE" Offset="50" />
					</ColorMiddles>
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" >
				<Fill Color="#1A66D1">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" >
				<Fill Color="#1A66D1">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" >
				<Fill Color="#381AD1">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesHoverStyles>
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
		This sample illustrates how to change bars color in series.
	</p>
<h3>Test the features</h3>
<ul>
    <li>Note the gradient colors used in this chart.</li>
    <li>Note the opacity of bars filling colors.</li>
    <li>Hover over a bar point to see the hover style.</li>
    <li>Note the border thinkness changing on mouse hover.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

