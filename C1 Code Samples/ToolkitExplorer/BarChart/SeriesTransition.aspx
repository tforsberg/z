<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SeriesTransition.aspx.cs" Inherits="ToolkitExplorer.BarChart.SeriesTransition" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.data.label + '\n ' + this.y + '';
		}

		function changeProperties() {
			var seriesTransition = {};
			enabled = $("#chkEnabled").is(":checked"),
				duration = $("#inpDuration").val(),
				easing = $("#selEasing").val();
			seriesTransition.enabled = enabled;
			if (duration && duration.length) {
				seriesTransition.duration = parseFloat(duration);
			}
			seriesTransition.easing = easing;
			$("#<%= barchart.ClientID %>").wijbarchart("option", "seriesTransition", seriesTransition);
		}

		function reload() {
			$("#<%= barchart.ClientID %>").wijbarchart("option", "seriesList", [createRandomSeriesList("2010")]);
		}

		function createRandomSeriesList(label) {
			var data = [],
				randomDataValuesCount = 12,
				labels = ["January", "February", "March", "April", "May", "June",
					"July", "August", "September", "October", "November", "December"],
				idx;
			for (idx = 0; idx < randomDataValuesCount; idx++) {
				data.push(createRandomValue());
			}
			return {
				label: label,
				legendEntry: false,
				data: { x: labels, y: data }
			};
		}

		function createRandomValue() {
			return Math.round(Math.random() * 100);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<input type="button" value="reload" onclick="reload()" />
	<asp:Panel ID="barchart" Height="475" Width = "756" runat="server" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1BarChartExtender runat = "server" ID="C1BarChartExtender1" ClusterRadius = "5" TargetControlID = "barchart">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<SeriesList>
			<wijmo:BarChartSeries Label="2010" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="January" />
							<wijmo:ChartXData StringValue="February" />
							<wijmo:ChartXData StringValue="March" />
							<wijmo:ChartXData StringValue="April" />
							<wijmo:ChartXData StringValue="May" />
							<wijmo:ChartXData StringValue="June" />
							<wijmo:ChartXData StringValue="July" />
							<wijmo:ChartXData StringValue="August" />
							<wijmo:ChartXData StringValue="September" />
							<wijmo:ChartXData StringValue="October" />
							<wijmo:ChartXData StringValue="November" />
							<wijmo:ChartXData StringValue="December" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="81" />
							<wijmo:ChartYData DoubleValue="95" />
							<wijmo:ChartYData DoubleValue="21" />
							<wijmo:ChartYData DoubleValue="88" />
							<wijmo:ChartYData DoubleValue="12" />
							<wijmo:ChartYData DoubleValue="23" />
							<wijmo:ChartYData DoubleValue="62" />
							<wijmo:ChartYData DoubleValue="79" />
							<wijmo:ChartYData DoubleValue="90" />
							<wijmo:ChartYData DoubleValue="62" />
							<wijmo:ChartYData DoubleValue="69" />
							<wijmo:ChartYData DoubleValue="46" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
		<Axis>
			<Y Text = "Number of Hits" AutoMax = "false" AutoMin = "false" Max = "100" Min = "0" Compass="West">
			</Y>
			<X Text = "Month of the Year">
			</X>
		</Axis>
	</wijmo:C1BarChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1BarChartExtender supports variant animation effects when data reloading.</p><br/>
	<p>
		The "SeriesTransition" property is used to control the animation effect when data reloading.
	</p>
	<ul>
		<li>SeriesTransition.Enabled for enabling the animation or not</li>
		<li>SeriesTransition.Duration</li>
		<li>SeriesTransition.Easing</li>
	</ul>
	<p> The easing property can be set to the following value:</p>
	<ul>
		<li>easeInCubic(">")</li>
		<li>easeOutCubic("<")</li>
		<li>easeInOutCubic("<>")</li>
		<li>easeInBack("backIn")</li>
		<li>easeOutBack("backOut")</li>
		<li>easeOutElastic("elastic")</li>
		<li>easeOutBounce("bounce")</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div>
		<label for="chkEnabled">
			Series Transition Settings: Enabled
		</label>
		<input id="chkEnabled" type="checkbox" checked="checked" />
		<label for="inpDuration">
			Duration
		</label>
		<input id="inpDuration" type="text" value="1000" />
		<label for="selEasing">
			Easing
		</label>
		<select id="selEasing">
			<option value="linear">linear</option>
			<option value="easeInCubic">easeInCubic</option>
			<option value="easeOutCubic">easeOutCubic</option>
			<option value="easeInOutCubic">easeInOutCubic</option>
			<option value="easeInBack">easeInBack</option>
			<option value="easeOutBack">easeOutBack</option>
			<option value="easeOutElastic">easeOutElastic</option>
			<option value="easeOutBounce">easeOutBounce</option>
		</select>
		<input type="button" value="Apply" onclick="changeProperties()" />
	</div>
</asp:Content>
