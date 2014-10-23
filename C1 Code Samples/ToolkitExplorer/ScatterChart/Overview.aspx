<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.ScatterChart.Overview" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Chart" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.x + ' cm, ' + this.y + ' kg';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Panel ID="scatterchart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1ScatterChartExtender ID="scatterchart_C1ScatterChartExtender" 
		runat="server" ShowChartLabels="False" TargetControlID="scatterchart">
		<seriestransition duration="2000" Enabled="false">
		</seriestransition>
		<animation duration="2000" Enabled="false">
		</animation>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#AFE500">
				<Fill Color="#AFE500">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#FF9900">
				<Fill Color="#FF9900">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<Header Text="Height Versus Weight of 72 Individuals by Gender">
		</Header>
		<footer compass="South" visible="False">
		</footer>
		<legend>
			<size height="3" width="30">
			</size>
		</legend>
		<Axis>
			<X Text="Height (cm)">
				<Labels>
					<AxisLabelStyle FontSize="11pt" Rotation="-45">
						<Fill Color="#7F7F7F">
						</Fill>
					</AxisLabelStyle>
				</Labels>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMajor>
			</X>
			<Y compass="West" text="Weight (kg)" visible="False">
				<labels textalign="Center">
					<AxisLabelStyle FontSize="11pt">
						<Fill Color="#7F7F7F">
						</Fill>
					</AxisLabelStyle>
				</labels>
				<gridmajor visible="True">
					<GridStyle Stroke="#353539" StrokeDashArray="- "></GridStyle>
				</gridmajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMajor>
				<TickMinor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMinor>
			</Y>
		</Axis>
		<Hint OffsetY="-10">
			<Content Function="hintContent" />
		</Hint>
	</wijmo:C1ScatterChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1ScatterChartExtender(wijscatterchart at client side) allows you to create customized scatter charts. 
		The samples in this section highlight some of the unique features of the widget, and they will help you get started with C1ScatterChartExtender.</p>
	<p>
		The source in this sample will show you how to add a header to the chart; 
		how to format the axes; and how to populate the chart with numerical x and y data.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
