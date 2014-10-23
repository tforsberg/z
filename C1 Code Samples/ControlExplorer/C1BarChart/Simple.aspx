<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" 
	CodeFile="Simple.aspx.cs" Inherits="C1BarChart_Simple" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type="text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<Y Text="Total Hardware" Compass="West"></Y>
			<X Text=""></X>
		</Axis>
		<Header Text="Console Wars"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#7fc73c" Opacity="0.8">
				<Fill Color="#8ede43"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="US" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="PS3" />
							<wijmo:ChartXData StringValue="XBOX360" />
							<wijmo:ChartXData StringValue="Wii" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="12.35" />
							<wijmo:ChartYData DoubleValue="21.50" />
							<wijmo:ChartYData DoubleValue="30.56" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates a simple bar chart that compares the sales between the Nintendo Wii, the Xbox 360, and the Playstation 3.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

