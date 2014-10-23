<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Symbols.aspx.cs" Inherits="LineChart_Symbols" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.y;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<asp:Panel ID="linechart" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all" Height="475" Width = "756">
	</asp:Panel>
	<wijmo:C1LineChartExtender runat = "server" ID="LineChartExtender1" 
		TargetControlID="linechart" ShowChartLabels="False" >
		<Header Text="Twitter trends in October 2010"></Header>
		<Hint OffsetY="-10">
			<Content Function="hintContent" />
		</Hint>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="8" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#00a6dd" StrokeWidth="5" Opacity="0.8" />
		</SeriesStyles>
		<SeriesList>
			<wijmo:LineChartSeries Label="#Wijmo" LegendEntry="true">
				<Markers Visible="true" Type="Circle">
					<Symbol>
						<wijmo:LineChartMarkerSymbol Index="6" Url="Images/wijmo.png" Width="30" Height="30" />
						<wijmo:LineChartMarkerSymbol Index="2" Url="Images/hatemo.png" Width="30" Height="30" />
					</Symbol>
				</Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData DateTimeValue="2010-11-21" />
							<wijmo:ChartXData DateTimeValue="2010-11-22" />
							<wijmo:ChartXData DateTimeValue="2010-11-23" />
							<wijmo:ChartXData DateTimeValue="2010-11-24" />
							<wijmo:ChartXData DateTimeValue="2010-11-25" />
							<wijmo:ChartXData DateTimeValue="2010-11-26" />
							<wijmo:ChartXData DateTimeValue="2010-11-27" />
							<wijmo:ChartXData DateTimeValue="2010-11-28" />
							<wijmo:ChartXData DateTimeValue="2010-11-29" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="12" />
							<wijmo:ChartYData DoubleValue="30" />
							<wijmo:ChartYData DoubleValue="6" />
							<wijmo:ChartYData DoubleValue="22" />
							<wijmo:ChartYData DoubleValue="14" />
							<wijmo:ChartYData DoubleValue="25" />
							<wijmo:ChartYData DoubleValue="41" />
							<wijmo:ChartYData DoubleValue="14" />
							<wijmo:ChartYData DoubleValue="3" />
						</Values>
					</Y>
				</Data>
			</wijmo:LineChartSeries>
		</SeriesList>
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>The C1LineChartExtender supports customizing the marker with specified symbols such as images.</p><br/>
	<p>To customize the markers, the following properties are used in this sample</p>
	<ul>
		<li>LineChartSeries.Markers.Symbol</li>
		<li>LineChartMarkerSymbol.Index for specifying the index of the marker of this series</li>
		<li>LineChartMarkerSymbol.Url for specifying the image url of this symbol</li>
		<li>LineChartMarkerSymbol.Width for specifying the width of this symbol</li>
		<li>LineChartMarkerSymbol.Height for specifying the height of this symbol</li>
	</ul>
	<p>LineChartSeries.Marker.Symbol is a collection which contains LineChartMarkerSymbol instances.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

