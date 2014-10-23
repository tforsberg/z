<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SeriesTransition.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.SeriesTransition" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<input type="button" value="Reload" onclick="reload()"/>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MaximumSize="15" Height="475" Width = "756" ShowChartLabels="False">

<Footer Compass="South" Visible="False"></Footer>

	<Legend Compass="South" Orientation="Horizontal">
		<Size Width="100" />
	</Legend>

	<Axis>
		<X Text="Income" Max="100" Min="0">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</X>
		<Y Text="Life Expectancy" Compass="West" Max="1000" Min="0">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</Y>
	</Axis>
<Animation Duration="500" Easing="EaseOutElastic"></Animation>

	<SeriesList>
		<wijmo:BubbleChartSeries Label="series0" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="20" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="80" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="400" />
					</Values>
				</Y>
			</Data>
			<Markers Type="InvertedTri">
			</Markers>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="series1" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="211.1" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="55" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="789.04" />
					</Values>
				</Y>
			</Data>
			<Markers Type="Box">
			</Markers>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="series2" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="188" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="93" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="333" />
					</Values>
				</Y>
			</Data>
			<Markers Type="Diamond">
			</Markers>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="series3" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="37.6" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="18" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="220" />
					</Values>
				</Y>
			</Data>
			<Markers Type="Cross">
			</Markers>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="series4" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="146.8" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="34" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="648" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>
	<Header Text="Wealth & Health of Nations - 2010"></Header>
	<Hint>
		<Content Function="hint" />
	</Hint>
</wijmo:C1BubbleChart>
	<script type="text/javascript">
		function hint() {
			return "" + this.data.label + " \ny: " + this.y + " \nx: " + Globalize.format(this.x, "n") + " \ny1: " + this.data.y1;
		}

		function reload() {
			$("#<%=BubbleChart1.ClientID%>").c1bubblechart("option", "seriesList", makeSeries());
		}

		function getRoundData(n) {
			var a = Math.random();
			if (a > 0.9 || a < 0.1) {
				return getRoundData(n);
			}
			else {
				a *= Math.pow(10, n);
				return Globalize.parseFloat(Globalize.format(a, "n2"));
			}
		}

		function makeSeries() {
			var series = [],
                markers = ["circle", "tri", "box", "cross", "diamond"];
			for (i = 0; i < 5; i++) {
				series.push({
					label: "series" + i.toString(),
					legendEntry: true,
					data: {
						x: [].concat(getRoundData(2)),
						y: [].concat(getRoundData(3)),
						y1: [].concat(getRoundData(2))
					},
					markers: {
						type: markers[i]
					}
				});
			}
			return series;
		}
	</script>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>The <strong>C1BubbleChart </strong>supports a variety of animation effects when data is reloaded.</p>
<p>
	The <strong>Animation </strong>property is used to control the series transition animation when data is reloaded. 
	It will animate from the last position to new position, not as default animation from origin position to new position.
</p>
<ul>
	<li>Animation.Enabled for enabling the series transition animation or not</li>
	<li>Animation.Duration for the duration for the animation</li>
	<li>Animation.Easing for the easing for the animation</li>
</ul>
<p> The <strong>Easing</strong> property can be set to one of the following values:</p>
<ul>
	<li>EaseInCubic</li>
	<li>EaseOutCubic</li>
	<li>EaseInOutCubic</li>
	<li>EaseInBack</li>
	<li>EaseOutBack</li>
	<li>EaseOutElastic</li>
	<li>EaseOutBounce</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
				<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label class="settinglegend">Animation:</label></li>
	<li class="fullwidth"><asp:CheckBox runat="server" ID="EnabledCk" Checked="true"/><label>Enabled</label>
	</li>
	<li>
		<label>Easing:</label>
		<asp:DropDownList id="EasingDdl" runat="server">
			<asp:ListItem value="EaseInCubic" Selected="True">EaseInCubic</asp:ListItem>
			<asp:ListItem value="EaseOutCubic">EaseOutCubic</asp:ListItem>
			<asp:ListItem value="EaseInOutCubic">EaseInOutCubic</asp:ListItem>
			<asp:ListItem value="EaseInBack">EaseInBack</asp:ListItem>
			<asp:ListItem value="EaseOutBack">EaseOutBack</asp:ListItem>
			<asp:ListItem value="EaseOutElastic">EaseOutElastic</asp:ListItem>
			<asp:ListItem value="EaseOutBounce">EaseOutBounce</asp:ListItem>
		</asp:DropDownList>
	</li>
	<li>
		<label>Duration:</label>
		<asp:TextBox runat="server" ID="DurationTxt" Text="250" />
	</li>
</ul>
</div>
	<div class="settingcontrol">
	<asp:Button ID="ApplyBtn" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
