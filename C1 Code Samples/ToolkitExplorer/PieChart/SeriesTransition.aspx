<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SeriesTransition.aspx.cs" Inherits="ToolkitExplorer.PieChart.SeriesTransition" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
	function hintContent() {
	    return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
	}

	function changeProperties() {
		var animation = {};
		enabled = $("#chkEnabled").is(":checked"),
				duration = $("#inpDuration").val(),
				easing = $("#selEasing").val();
		animation.enabled = enabled;
		if (duration && duration.length) {
			animation.duration = parseFloat(duration);
		}
		animation.easing = easing;
		$("#<%= piechart.ClientID %>").wijpiechart("option", "seriesTransition", animation);
	}

	function reload() {
		$("#<%= piechart.ClientID %>").wijpiechart("option", "seriesList", createRandomSeriesList());
	}

	function createRandomSeriesList() {
		var seriesList = [],
				randomDataValuesCount = 6,
				labels = ["Jan", "Feb", "Mar", "Apr", "May", "Jun"],
				idx;
		for (idx = 0; idx < randomDataValuesCount; idx++) {
			seriesList.push({
				label: labels[idx],
				legendEntry: true,
				data: createRandomValue()
			});
		}
		return seriesList;
	}

	function createRandomValue() {
		var val = Math.round(Math.random() * 100);
		return val;
	}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<input type="button" value="reload" onclick="reload()" />
	<asp:Panel ID="piechart" runat="server" Height="475" Width = "756" CssClass ="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1PieChartExtender runat="server" ID="PieChartExtender1" Radius="140" TargetControlID = "piechart">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<SeriesList>
			<wijmo:PieChartSeries Label="Jan" LegendEntry="true" Data="50" />
			<wijmo:PieChartSeries Label="Feb" LegendEntry="true" Data="38" />
			<wijmo:PieChartSeries Label="Mar" LegendEntry="true" Data="73" />
			<wijmo:PieChartSeries Label="Apr" LegendEntry="true" Data="13" />
			<wijmo:PieChartSeries Label="May" LegendEntry="true" Data="89" />
			<wijmo:PieChartSeries Label="Jun" LegendEntry="true" Data="5" />
		</SeriesList>
		<Legend Visible="true"></Legend>
		<Footer Compass="South" Visible="False">
		</Footer>
		<Axis>
			<Y Visible="False" Compass="West">
				<Labels TextAlign="Center">
				</Labels>
				<GridMajor Visible="True">
				</GridMajor>
			</Y>
		</Axis>
	</wijmo:C1PieChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1PieChartExtender supports variant animation effects when data reloading.</p><br/>
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
			seriesTransition Settings: Enabled
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
