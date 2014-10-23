<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ToolkitExplorer.LineChart.Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script language = "javascript" type ="text/javascript">
		function hintContent() {
			return this.data.lineSeries.label + '\n' +
			this.x + '\n' + this.y + '';
		}

		function changeProperties() {
			var animation = {},
				seriesTransition = {},
				enabled = $("#chkEnabled").is(":checked"),
				direction = $("#selDirection").val(),
				duration = $("#inpDuration").val(),
				easing = $("#selEasing").val(),
				stEnabled = $("#chkSTEnabled").is(":checked"),
				stDuration = $("#inpSTDuration").val(),
				stEasing = $("#selSTEasing").val();
			animation.enabled = enabled;
			animation.direction = direction;
			if (duration && duration.length) {
				animation.duration = parseFloat(duration);
			}
			animation.easing = easing;

			seriesTransition.enabled = stEnabled;
			if (stDuration && stDuration.length) {
				seriesTransition.duration = parseFloat(stDuration);
			}
			seriesTransition.easing = stEasing;
			$("#<%= linechart.ClientID %>").wijlinechart("option", "animation", animation);
			$("#<%= linechart.ClientID %>").wijlinechart("option", "seriesTransition", seriesTransition);
		}

		function reload() {
			$("#<%= linechart.ClientID %>").wijlinechart("option", "seriesList", [createRandomSeriesList("2010")]);
		}

		function createRandomSeriesList(label) {
			var data = [],
				randomDataValuesCount = 12,
				labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
					"Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
				idx;
			for (idx = 0; idx < randomDataValuesCount; idx++) {
				data.push(createRandomValue());
			}
			return {
				label: "Steam",
				legendEntry: true,
				fitType: "spline",
				markers: {
					visible: true,
					type: "circle"
				},
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
	<asp:Panel ID="linechart" runat="server" Height="475" Width = "756" BackColor = "#242529" >
	</asp:Panel>
	<wijmo:C1LineChartExtender runat = "server" ID="LineChartExtender1" ShowChartLabels = "false" TargetControlID = "linechart">
		<Animation Direction = "Vertical" />
		<Footer Compass="South" Visible="False"></Footer>
		<Legend Visible="false">
		</Legend>
		<Hint OffsetY="-10">
			<Content Function="hintContent" />
			<ContentStyle FontSize="10pt" />
		</Hint>
		<SeriesList>
			<wijmo:LineChartSeries Label="Steam" LegendEntry="true" FitType="Spline">
				<Markers Visible="true" Type="Circle"></Markers>
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Jan" />
							<wijmo:ChartXData StringValue="Feb" />
							<wijmo:ChartXData StringValue="Mar" />
							<wijmo:ChartXData StringValue="Apr" />
							<wijmo:ChartXData StringValue="May" />
							<wijmo:ChartXData StringValue="Jun" />
							<wijmo:ChartXData StringValue="Jul" />
							<wijmo:ChartXData StringValue="Aug" />
							<wijmo:ChartXData StringValue="Sep" />
							<wijmo:ChartXData StringValue="Oct" />
							<wijmo:ChartXData StringValue="Nov" />
							<wijmo:ChartXData StringValue="Dec" />
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
			</wijmo:LineChartSeries>
		</SeriesList>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#ff9900" StrokeWidth="3" />
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth = "4"></wijmo:ChartStyle>
		</SeriesHoverStyles>
		<Axis>
			<X Text = "Month of the Year">
				<Labels>
					<AxisLabelStyle FontSize="11pt" Rotation="-45">
						<Fill Color="#7f7f7f"></Fill>
					</AxisLabelStyle>
				</Labels>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7f7f7f" />
				</TickMajor>
			</X>
			<Y Text = "Number of Hits" AutoMax = "false" AutoMin = "false" Max = "100" Min = "0" Compass="West">
				<Labels TextAlign="Center">
					<AxisLabelStyle FontSize="11pt">
						<Fill Color="#7f7f7f"></Fill>
					</AxisLabelStyle>
				</Labels>
				<GridMajor Visible="True">
					<GridStyle Stroke="#353539" StrokeDashArray="- " />
				</GridMajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7f7f7f" />
				</TickMajor>
				<TickMinor Position="Outside">
					<TickStyle Stroke="#7f7f7f" />
				</TickMinor>
			</Y>
		</Axis>
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1LineChartExtender supports variant animation effects when data loading.</p><br/>
	<p>The "Animation" and "SeriesTransition" properties are used to control the animation effect when data loading and reloading respectively.</p>
	<ul>
		<li>Animation.Direction for specifying the direction when animation plays which affects both data loading and reloading</li>
		<li>Animation.Enabled and SeriesTransition.Enabled for enabling the animation or not</li>
		<li>Animation.Duration and SeriesTransition.Duration</li>
		<li>Animation.Easing and SeriesTransition.Easing</li>
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
			Animation Settings: Enabled
		</label>
		<input id="chkEnabled" type="checkbox" checked="checked" />
		<label for="selDirection">
			Direction
		</label>
		<select id="selDirection">
			<option value="horizontal">horizontal</option>
			<option value="vertical">vertical</option>
		</select>
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
		</select><br/>
		<label for="chkSTEnabled">
			Series Transition Settings: Enabled
		</label>
		<input id="chkSTEnabled" type="checkbox" checked="checked" />
		<label for="inpSTDuration">
			Duration
		</label>
		<input id="inpSTDuration" type="text" value="1000" />
		<label for="selSTEasing">
			Easing
		</label>
		<select id="selSTEasing">
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
