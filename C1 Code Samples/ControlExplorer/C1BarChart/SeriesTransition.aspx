<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1BarChart_SeriesTransition" Codebehind="SeriesTransition.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<input type="button" value="Reload" onclick="reload()"/>
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" ClusterRadius = "5" Height="475" Width = "756">
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
	</wijmo:C1BarChart>
	<script type="text/javascript">
		function hintContent() {
			return this.data.label + '\n' + this.y + '';
		}

		function reload() {
			$("#<%= C1BarChart1.ClientID %>").c1barchart("option", "seriesList", [createRandomSeriesList("2010")]);
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
				legendEntry: true,
				data: { x: labels, y: data }
			};
		}

		function createRandomValue() {
			return Math.round(Math.random() * 100);
		}
	</script>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>The <strong>C1BarChart </strong>supports a variety of animation effects when data is reloaded.</p>
	<p>
		The <strong>Animation </strong>property is used to control the series transition animation when data is reloaded. 
		It will animate from the last position to new position, not as default animation from origin position to new position.
	</p>
	<ul>
		<li>Animation.Enabled for enabling the series transition animation or not</li>
		<li>Animation.Duration for the duration for the animation</li>
		<li>Animation.Easing for the easing for the animation</li>
	</ul>
	<p> The Easing property can be set to one of the following values:</p>
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
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
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

