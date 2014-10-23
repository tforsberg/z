<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="PieSeries.aspx.cs" Inherits="ControlExplorer.C1CompositeChart.PieSeries" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
	<script type="text/javascript">
		function hint() {
			return this.label + ": " + Globalize.format(this.y / this.total, "p2");
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1CompositeChart runat="server" ID="CompositeChart1" Width="756" Height="700">

<Footer Compass="South" Visible="False"></Footer>

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
		<Hint>
			<Content Function="hint" />
		</Hint>
		<SeriesList>
			<wijmo:CompositeChartSeries Center="110, 170" Label="2012-Q1" LegendEntry="True" Radius="80" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="104.8" HintContent="" Label="Android" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="26" HintContent="" Label="iOS" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="5.4" HintContent="" Label="Windows Phone" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="7.4" HintContent="" Label="Blackberry" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="6.8" HintContent="" Label="Symbian" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Center="350, 170" Label="2012-Q2" LegendEntry="True" Radius="100" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="122.5" HintContent="" Label="Android" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="23.6" HintContent="" Label="iOS" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="4.1" HintContent="" Label="Windows Phone" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="9" HintContent="" Label="Blackberry" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="4.4" HintContent="" Label="Symbian" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Center="620, 170" Label="2012-Q3" LegendEntry="True" Radius="120" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="144.7" HintContent="" Label="Android" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="43.5" HintContent="" Label="iOS" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="6.2" HintContent="" Label="Windows Phone" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="7.3" HintContent="" Label="Blackberry" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="2.6" HintContent="" Label="Symbian" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Center="200, 500" Label="2012-Q4" LegendEntry="True" Radius="140" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="162.1" HintContent="" Label="Android" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="37.4" HintContent="" Label="iOS" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="7" HintContent="" Label="Windows Phone" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="6.3" HintContent="" Label="Blackberry" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="0.5" HintContent="" Label="Symbian" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Center="550, 500" Label="2013-Q1" LegendEntry="True" Radius="160" Type="Pie">
				<PieSeriesList>
					<wijmo:PieChartSeries Data="177.9" HintContent="" Label="Android" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="31.9" HintContent="" Label="iOS" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="7.4" HintContent="" Label="Windows Phone" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="6.2" HintContent="" Label="Blackberry" LegendEntry="True">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Data="0.631" HintContent="" Label="Symbian" LegendEntry="True">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
		</SeriesList>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#28AA28">
				<Fill ColorBegin="#00CC00" ColorEnd="#28AA28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#999999">
				<Fill ColorBegin="#A2A2A2" ColorEnd="#999999" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4F60FF">
				<Fill ColorBegin="#5F7FFF" ColorEnd="#4F60FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8142FF">
				<Fill ColorBegin="#512895" ColorEnd="#8142FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8EC3FF">
				<Fill ColorBegin="#9ECCFF" ColorEnd="#8EC3FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#28AA28">
				<Fill ColorBegin="#00CC00" ColorEnd="#28AA28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#999999">
				<Fill ColorBegin="#A2A2A2" ColorEnd="#999999" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4F60FF">
				<Fill ColorBegin="#5F7FFF" ColorEnd="#4F60FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8142FF">
				<Fill ColorBegin="#512895" ColorEnd="#8142FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8EC3FF">
				<Fill ColorBegin="#9ECCFF" ColorEnd="#8EC3FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#28AA28">
				<Fill ColorBegin="#00CC00" ColorEnd="#28AA28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#999999">
				<Fill ColorBegin="#A2A2A2" ColorEnd="#999999" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4F60FF">
				<Fill ColorBegin="#5F7FFF" ColorEnd="#4F60FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8142FF">
				<Fill ColorBegin="#512895" ColorEnd="#8142FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8EC3FF">
				<Fill ColorBegin="#9ECCFF" ColorEnd="#8EC3FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#28AA28">
				<Fill ColorBegin="#00CC00" ColorEnd="#28AA28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#999999">
				<Fill ColorBegin="#A2A2A2" ColorEnd="#999999" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4F60FF">
				<Fill ColorBegin="#5F7FFF" ColorEnd="#4F60FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8142FF">
				<Fill ColorBegin="#512895" ColorEnd="#8142FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8EC3FF">
				<Fill ColorBegin="#9ECCFF" ColorEnd="#8EC3FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#28aa28">
				<Fill ColorBegin="#00cc00" ColorEnd="#28aa28" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#999999">
				<Fill ColorBegin="#a2a2a2" ColorEnd="#999999" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4F60FF">
				<Fill ColorBegin="#5F7FFF" ColorEnd="#4F60FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8142FF">
				<Fill ColorBegin="#512895" ColorEnd="#8142FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#8EC3FF">
				<Fill ColorBegin="#9ECCFF" ColorEnd="#8EC3FF" LinearGradientAngle="180" Type="LinearGradient">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<Header Text="Mobile OS market share"></Header>
		<Legend Visible="false"></Legend>
	</wijmo:C1CompositeChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>The <b>C1CompositeChart</b> allows you to draw multiple types of charts in one canvas simultaneously. </p>
</asp:Content>
