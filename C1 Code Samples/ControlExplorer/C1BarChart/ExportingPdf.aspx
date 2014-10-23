<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="True" Inherits="C1BarChart_ExportingPdf" Codebehind="ExportingPdf.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>
<%@ Register Src="../ChartCore/ExportPdf.ascx" TagName="ExportPanel" TagPrefix="ExportPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756" ClusterWidth="60" MarginRight="60" MarginTop="5" Shadow="False" ShowChartLabels="False">
		<Hint>
			<Content Function="hintContent" />
			<ContentStyle FontSize="14px">
				<Fill Color="#CCCCCC">
				</Fill>
			</ContentStyle>
			<Style StrokeWidth="0">
			</Style>
			<HintStyle StrokeWidth="0">
			</HintStyle>
		</Hint>

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="False"></Legend>

		<Axis>
			<X Text="" Compass="North" Visible="False">
				<TextStyle FontWeight="normal">
				</TextStyle>
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
			<Y Text="USD (thousands)" Compass="West" AnnoFormatString="n0" Max="8000" Min="0" AutoMax="False" AutoMin="False">
				<TextStyle FontWeight="normal">
				</TextStyle>
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
				<TickMajor Position="Outside">
					<Style Stroke="#999999">
					</Style>
					<TickStyle Stroke="#999999">
					</TickStyle>
				</TickMajor>
			</Y>
		</Axis>
		<SeriesStyles>
			<wijmo:ChartStyle StrokeWidth="0">
				<Fill Color="#94C3E8">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="0">
			</wijmo:ChartStyle>
		</SeriesHoverStyles>
		<TextStyle FontSize="13px">
		</TextStyle>
		<Header Text="Sales By State"></Header>
		<SeriesList>
			<wijmo:BarChartSeries Label="West" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Ohio" />
							<wijmo:ChartXData StringValue="Florida" />
							<wijmo:ChartXData StringValue="Arizona" />
							<wijmo:ChartXData StringValue="Utah" />
							<wijmo:ChartXData StringValue="Colorado" />
							<wijmo:ChartXData StringValue="Hawaii" />
							<wijmo:ChartXData StringValue="Texas" />
							<wijmo:ChartXData StringValue="Maryland" />
							<wijmo:ChartXData StringValue="North Carolina" />
							<wijmo:ChartXData StringValue="Maryland" />
							<wijmo:ChartXData StringValue="Oregon" />
							<wijmo:ChartXData StringValue="Washington" />
							<wijmo:ChartXData StringValue="New York" />
							<wijmo:ChartXData StringValue="California" />
							<wijmo:ChartXData StringValue="Pennsylvannia" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1800" />
							<wijmo:ChartYData DoubleValue="2250" />
							<wijmo:ChartYData DoubleValue="2860" />
							<wijmo:ChartYData DoubleValue="2880" />
							<wijmo:ChartYData DoubleValue="2900" />
							<wijmo:ChartYData DoubleValue="2920" />
							<wijmo:ChartYData DoubleValue="3070" />
							<wijmo:ChartYData DoubleValue="3190" />
							<wijmo:ChartYData DoubleValue="3520" />
							<wijmo:ChartYData DoubleValue="4100" />
							<wijmo:ChartYData DoubleValue="4280" />
							<wijmo:ChartYData DoubleValue="4320" />
							<wijmo:ChartYData DoubleValue="5680" />
							<wijmo:ChartYData DoubleValue="7040" />
							<wijmo:ChartYData DoubleValue="7650" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
	<script type="text/javascript">
		function hintContent() {
			//Display x value and format y value as currency after multiplying by 1000
			return this.x + ': ' + Globalize.format(this.y * 1000, 'c0'); 
		}
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>This sample demostrates how to export <strong>C1BarChart</strong> to Pdf file.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
	<ExportPanel:ExportPanel ID="ExportPanel1" runat="server" ChartType="C1BarChart"/>
</asp:Content>

