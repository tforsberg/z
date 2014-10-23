<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DonutPie.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.DonutPie" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function hint() {
			return this.label + ' ' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1CompositeChart runat="server" ID="CompositeChart1" Width="756" Height="475">
		<Axis>
			<X Visible="false" TextVisible="false">
				<GridMajor Visible="false"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
			<Y Visible="false" TextVisible="false">
<GridMajor Visible="false"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="false"></Legend>
		<ChartLabelStyle>
			<Fill Color="#ffffff"></Fill>
		</ChartLabelStyle>
		<Hint>
			<Content  Function="hint"/>
		</Hint>
		<SeriesList>
			<wijmo:CompositeChartSeries Center="400, 250" LegendEntry="True" Radius="200" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="38" HintContent="" Label="Chrome" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="36" HintContent="" Label="Firefox" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="13" HintContent="" Label="IE" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="8" HintContent="" Label="Safari" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="5" HintContent="" Label="Other" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Center="400, 250" LegendEntry="True" Radius="100" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="26" HintContent="" Label="15" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="8" HintContent="" Label="14" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="4" HintContent="" Label=" " LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="20" HintContent="" Label="7" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="10" HintContent="" Label="8" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="6" HintContent="" Label=" " LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="6" HintContent="" Label="9" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="5" HintContent="" Label="8" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="2" HintContent="" Label=" " LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="5" HintContent="" Label="5" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="3" HintContent="" Label=" " LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="5" HintContent="" Label=" " LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
		</SeriesList>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#28AA28" StrokeWidth="1.5">
				<Fill ColorBegin="#00CC00" ColorEnd="#28AA28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#cb6928" StrokeWidth="1.5">
				<Fill ColorBegin="#ff6600" ColorEnd="#cb6928" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#2889aa" StrokeWidth="1.5">
				<Fill ColorBegin="#0099cc" ColorEnd="#2889aa" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#3e28aa" StrokeWidth="1.5">
				<Fill ColorBegin="#2200cc" ColorEnd="#3e28aa" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#dddddd" StrokeWidth="1.5">
				<Fill ColorBegin="#cccccc" ColorEnd="#dddddd" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.2">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.2">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.2">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle Stroke="#28AA28" StrokeWidth="2">
				<Fill ColorBegin="#00CC00" ColorEnd="#28AA28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#cb6928" StrokeWidth="2">
				<Fill ColorBegin="#ff6600" ColorEnd="#cb6928" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#2889aa" StrokeWidth="2">
				<Fill ColorBegin="#0099cc" ColorEnd="#2889aa" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#3e28aa" StrokeWidth="2">
				<Fill ColorBegin="#2200cc" ColorEnd="#3e28aa" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#dddddd" StrokeWidth="2">
				<Fill ColorBegin="#cccccc" ColorEnd="#dddddd" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.2">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.2">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.2">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.6">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.4">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0">
				<Fill Color="#000"></Fill>
			</wijmo:ChartStyle>
		</SeriesHoverStyles>
		<Header Text="Browsers"></Header>
	</wijmo:C1CompositeChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>The <b>C1CompositeChart</b> allows you to draw multiple types of charts in one canvas simultaneously. This chart uses two pie charts to demonstrate browser usage. The inner pie shows version specific information while the outer pie shows just browsers.</p>
</asp:Content>
