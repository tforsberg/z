<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1BarChart_Legend" Codebehind="Legend.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756">
		<Axis>
			<X Text="Graphics Card">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
			<Y Text="Percentage (%)" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
		</Axis>
		<Footer Compass="South" Visible="False"></Footer>
		<Legend Text="Month"></Legend>
		<Header Text="Steam Top 10 Video Cards - Hardware Survey"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#1AD11A" StrokeWidth="1" >
				<Fill Color="#1AD11A">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#1AA3D1" StrokeWidth="1" >
				<Fill Color="#1AA3D1">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#1A66D1" StrokeWidth="1" >
				<Fill Color="#1A66D1">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#381AD1" StrokeWidth="1" >
				<Fill Color="#381AD1">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Opacity="0.8" Stroke="#941AD1" StrokeWidth="1" >
				<Fill Color="#941AD1">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
			<wijmo:ChartStyle Opacity="1" StrokeWidth="1.5" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="May" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.91" />
							<wijmo:ChartYData DoubleValue="1.90" />
							<wijmo:ChartYData DoubleValue="1.61" />
							<wijmo:ChartYData DoubleValue="2.23" />
							<wijmo:ChartYData DoubleValue="2.85" />
							<wijmo:ChartYData DoubleValue="3.64" />
							<wijmo:ChartYData DoubleValue="4.46" />
							<wijmo:ChartYData DoubleValue="5.89" />
							<wijmo:ChartYData DoubleValue="4.22" />
							<wijmo:ChartYData DoubleValue="4.66" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Jun" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.82" />
							<wijmo:ChartYData DoubleValue="1.88" />
							<wijmo:ChartYData DoubleValue="1.77" />
							<wijmo:ChartYData DoubleValue="2.33" />
							<wijmo:ChartYData DoubleValue="2.97" />
							<wijmo:ChartYData DoubleValue="3.70" />
							<wijmo:ChartYData DoubleValue="4.42" />
							<wijmo:ChartYData DoubleValue="5.93" />
							<wijmo:ChartYData DoubleValue="4.92" />
							<wijmo:ChartYData DoubleValue="5.20" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Jul" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.94" />
							<wijmo:ChartYData DoubleValue="1.80" />
							<wijmo:ChartYData DoubleValue="1.81" />
							<wijmo:ChartYData DoubleValue="2.23" />
							<wijmo:ChartYData DoubleValue="2.83" />
							<wijmo:ChartYData DoubleValue="3.57" />
							<wijmo:ChartYData DoubleValue="4.23" />
							<wijmo:ChartYData DoubleValue="5.90" />
							<wijmo:ChartYData DoubleValue="5.46" />
							<wijmo:ChartYData DoubleValue="5.62" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Aug" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.89" />
							<wijmo:ChartYData DoubleValue="1.84" />
							<wijmo:ChartYData DoubleValue="1.96" />
							<wijmo:ChartYData DoubleValue="2.29" />
							<wijmo:ChartYData DoubleValue="2.93" />
							<wijmo:ChartYData DoubleValue="3.79" />
							<wijmo:ChartYData DoubleValue="4.11" />
							<wijmo:ChartYData DoubleValue="5.79" />
							<wijmo:ChartYData DoubleValue="5.84" />
							<wijmo:ChartYData DoubleValue="6.02" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
			<wijmo:BarChartSeries Label="Sep" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="Mobile Intel 4 Series Express" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTS 150" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9600" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce GTX 260" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 9800" />
							<wijmo:ChartXData StringValue="NVIDIA GeForce 8800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 4800" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5700" />
							<wijmo:ChartXData StringValue="ATI Radeon HD 5800" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="1.72" />
							<wijmo:ChartYData DoubleValue="1.80" />
							<wijmo:ChartYData DoubleValue="2.17" />
							<wijmo:ChartYData DoubleValue="2.40" />
							<wijmo:ChartYData DoubleValue="3.30" />
							<wijmo:ChartYData DoubleValue="3.97" />
							<wijmo:ChartYData DoubleValue="4.40" />
							<wijmo:ChartYData DoubleValue="6.59" />
							<wijmo:ChartYData DoubleValue="6.82" />
							<wijmo:ChartYData DoubleValue="7.04" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
		<Hint>
			<Content Function="hintContent" /></Hint>
	</wijmo:C1BarChart>
	<script>
		function hintContent() {
			return this.x + "\n" + this.data.label + ': ' + this.y + '%';
		}

	</script>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>This sample shows that we can click the legend to show/hide the bar series.
		This feature is very useful if you have a lot of data on single chart. It allows user to toggle 
		series visibility and compare different sets of data with each other.</p>
<h3>Test the features</h3>
<ul>
    <li>Hover over a bar point to see the tooltip.</li>
    <li>Note the legend at the right of the chart.</li>
    <li>Click series items in the legend to toggle their visibility on the chart surface.</li>
    <li>Play with legend options in the panel below to see it features.</li>
    <li>Note the chart adjusts to the free space changes.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
	<ul>
		<li class="fullwidth"><label class="settinglegend">Legend Layout:</label></li>
		<li class="fullwidth"><asp:CheckBox id="LegendVisibleCkb" runat="server" Checked="True" Text="Visible"/></li>
		<li><label>Compass</label>
			<asp:dropdownlist id="CompassDdl" runat="server">
			<asp:ListItem>North</asp:ListItem>
			<asp:ListItem Selected="True">East</asp:ListItem>
			<asp:ListItem>South</asp:ListItem>
			<asp:ListItem>West</asp:ListItem>
			</asp:DropDownList>
		</li>
		<li><label>Orientation</label>
			<asp:dropdownlist id="OrientationDdl" runat="server">
			<asp:ListItem>Horizontal</asp:ListItem>
			<asp:ListItem Selected="True">Vertical</asp:ListItem>
			</asp:DropDownList>
		</li>
	</ul></div>
	<div class="settingcontrol">
	<asp:Button ID="ApplyBtn" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>

