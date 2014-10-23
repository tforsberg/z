﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Animation.aspx.cs" Inherits="PieChart_Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<script type="text/javascript">
		function hintContent() {
			return this.data.label + " : " + Globalize.format(this.value / this.total, "p2");
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<%--<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>--%>
	<asp:Panel ID="piechart" runat="server" Height="475" Width = "756" CssClass="ui-widget ui-widget-content ui-corner-all">
	</asp:Panel>
	<wijmo:C1PieChartExtender runat="server" ID="PieChartExtender1" ShowChartLabels="false"
		TargetControlID="piechart">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Header Text="MMO Subscription Market Share">
		</Header>
		<Animation Enabled="false" />
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#3e5f77" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#466a85" ColorEnd="#3e5f77"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#494949" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#525252" ColorEnd="#494949"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4c5454" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#555e5e" ColorEnd="#4c5454"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#2d2d2d" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#333333" ColorEnd="#2d2d2d"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#5f9996" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#6aaba7" ColorEnd="#5f9996"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#959595" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#a6a6a6" ColorEnd="#959595"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#617779" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#6c8587" ColorEnd="#617779"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#b2c76d" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#c7de7a" ColorEnd="#b2c76d"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#7fc73c" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#8ede43" ColorEnd="#7fc73c"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#afe500" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#c3ff00" ColorEnd="#afe500"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#959595" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#a6a6a6" ColorEnd="#959595"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4aa6e2" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#53b9fc" ColorEnd="#4aa6e2"></Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#4a6ee2" StrokeWidth="1.5">
				<Fill Type="LinearGradient" LinearGradientAngle="45" ColorBegin="#537bfc" ColorEnd="#4a6ee2"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesList>
			<wijmo:PieChartSeries Label="RuneScape" Data="7.5">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Lineage" Data="6.6">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Lineage II" Data="6.3">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Final Fantasy XI" Data="3.1">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Dofus" Data="2.8">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="EVE Online" Data="1.5">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Everquest II" Data="1.2">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="EverQuest" Data="1.1">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Lord of the Rings Online" Data="0.9">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="City of Heroes / Villains" Data="0.8">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="Tibia" Data="0.6">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="All Others" Data="5.4">
			</wijmo:PieChartSeries>
			<wijmo:PieChartSeries Label="World of Warcraft" Data="62.2">
			</wijmo:PieChartSeries>
		</SeriesList>
	</wijmo:C1PieChartExtender>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
	<p>The sample demonstrate how to customize animation to enhance your pie charts.</p><br/>
	<p>This example uses the following properties and methods to customize the explode and scale effect for the pie chart.</p>
	<ul>
		<li>Animation.Enabled at server side</li>
		<li>getSector at client side to get the specified sector</li>
		<li>getOffset at client side to calculate the offset both in horizontal and vertical direction</li>
	</ul>
	<p>C1PieChartExtender has a explode animation effect by default, here we need first set the Animation.Enabled to false to disable the default animation effect.</p>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ControlOptions" ID="Content4">
	<div>
		Animation:
		<select id="selAnimation">
			<option selected="selected">Scale</option>
			<option>Explode</option>
			<option>None</option>
		</select>
	</div>
	<script type="text/javascript">
		var duration = 500;
		var radiusOffset = 10;
		var offset = {};
		$(document).ready(function () {
			var piechart = "#<%=piechart.ClientID %>";
			$(piechart).bind("wijpiechartmouseover", function (e, objData) {
				if (objData != null) {
					var animation = $("#selAnimation").val();

					if (animation == "None") {
						return;
					}

					var series = objData;
					var sector = $(piechart).wijpiechart("getSector", series.index);
					var shadow = sector.shadow;
					var tracker = sector.tracker;

					//Scale
					if (animation == "Scale") {
						var center = sector.center;
						sector.animate({
							transform: Raphael.format("s{0},{1},{2},{3}", 1.1, 1.1, sector.center.x, sector.center.y)
						}, duration, "elastic");

						if (shadow) {
							shadow.animate({
								transform: Raphael.format("s{0},{1},{2},{3}", 1.1, 1.1, sector.center.x, sector.center.y)
							}, duration, "elastic");
						}
						if (tracker) {
							tracker.animate({
								transform: Raphael.format("s{0},{1},{2},{3}", 1.1, 1.1, sector.center.x, sector.center.y)
							}, duration, "elastic");
						}
					}
					//Explode
					else {
						offset = sector.getOffset(radiusOffset);

						sector.animate({
							translation: offset.x + " " + offset.y
						}, duration, "elastic");

						if (shadow) {
							shadow.animate({
								translation: offset.x + " " + offset.y
							}, duration, "elastic");
						}
						if (tracker) {
							tracker.animate({
								translation: offset.x + " " + offset.y
							}, duration, "elastic");
						}
					}
				}
			});

			$(piechart).bind("wijpiechartmouseout", function (e, objData) {
				if (objData != null) {
					var animation = $("#selAnimation").val();

					if (animation == "None") {
						return;
					}

					var series = objData;
					var sector = $(piechart).wijpiechart("getSector", series.index);
					var shadow = sector.shadow;
					var tracker = sector.tracker;

					//Scale
					if (animation == "Scale") {
						sector.animate({
							transform: Raphael.format("s{0},{1},{2},{3}", 1, 1, sector.center.x, sector.center.y)
						}, duration, "elastic");
						if (shadow) {
							shadow.animate({
								transform: Raphael.format("s{0},{1},{2},{3}", 1, 1, sector.center.x, sector.center.y)
							}, duration, "elastic");
						}
						if (tracker) {
							tracker.animate({
								transform: Raphael.format("s{0},{1},{2},{3}", 1, 1, sector.center.x, sector.center.y)
							}, duration, "elastic");
						}
					}
					//Explode
					else {
						sector.animate({
							translation: -offset.x + " " + offset.y * -1
						}, duration, "elastic");

						if (shadow) {
							shadow.animate({
								translation: -offset.x + " " + offset.y * -1
							}, duration, "elastic");
						}
						if (tracker) {
							tracker.animate({
								translation: -offset.x + " " + offset.y * -1
							}, duration, "elastic");
						}
						offset = { x: 0, y: 0 };
					}
				}
			});
		});
	</script>
</asp:Content>