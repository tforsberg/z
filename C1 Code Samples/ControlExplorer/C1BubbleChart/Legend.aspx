<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Legend.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.Legend" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
	<ContentTemplate>
<wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" MinimumSize="3" MaximumSize="15" Height="475" Width = "756">
	<ChartLabel ChartLabelFormatString="c2'kkk'"></ChartLabel>

<Footer Compass="South" Visible="False"></Footer>

	<Legend Compass="North" Orientation="Horizontal" Text="Countries">
		<Size Width="100" />
	</Legend>
	<Axis>
		<X Text="Exports">
<GridMajor Visible="False"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</X>
		<Y Text="% of total export to the country" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
		</Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
	</Hint>

<Animation Duration="500" Easing="EaseOutElastic"></Animation>

	<SeriesList>
		<wijmo:BubbleChartSeries Label="China" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="11.6" />
						<wijmo:ChartY1Data DoubleValue="9.7" />
						<wijmo:ChartY1Data DoubleValue="0" />
						<wijmo:ChartY1Data DoubleValue="7" />
						<wijmo:ChartY1Data DoubleValue="8.4" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Machines, engines" />
						<wijmo:ChartXData StringValue="Electronics" />
						<wijmo:ChartXData StringValue="Oil" />
						<wijmo:ChartXData StringValue="Vehicles" />
						<wijmo:ChartXData StringValue="Aircraft, spacecraft" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="10.48" />
						<wijmo:ChartYData DoubleValue="8.77" />
						<wijmo:ChartYData DoubleValue="0" />
						<wijmo:ChartYData DoubleValue="6.32" />
						<wijmo:ChartYData DoubleValue="7.59" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Japan" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="5.9" />
						<wijmo:ChartY1Data DoubleValue="4.2" />
						<wijmo:ChartY1Data DoubleValue="0" />
						<wijmo:ChartY1Data DoubleValue="7.3" />
						<wijmo:ChartY1Data DoubleValue="5.7" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Machines, engines" />
						<wijmo:ChartXData StringValue="Electronics" />
						<wijmo:ChartXData StringValue="Oil" />
						<wijmo:ChartXData StringValue="Vehicles" />
						<wijmo:ChartXData StringValue="Aircraft, spacecraft" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="8" />
						<wijmo:ChartYData DoubleValue="7.71" />
						<wijmo:ChartYData DoubleValue="3.71" />
						<wijmo:ChartYData DoubleValue="0" />
						<wijmo:ChartYData DoubleValue="11.85" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="Germany" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="5.9" />
						<wijmo:ChartY1Data DoubleValue="4.2" />
						<wijmo:ChartY1Data DoubleValue="0" />
						<wijmo:ChartY1Data DoubleValue="7.3" />
						<wijmo:ChartY1Data DoubleValue="5.7" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Machines, engines" />
						<wijmo:ChartXData StringValue="Electronics" />
						<wijmo:ChartXData StringValue="Oil" />
						<wijmo:ChartXData StringValue="Vehicles" />
						<wijmo:ChartXData StringValue="Aircraft, spacecraft" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="12.19" />
						<wijmo:ChartYData DoubleValue="8.67" />
						<wijmo:ChartYData DoubleValue="0" />
						<wijmo:ChartYData DoubleValue="15.08" />
						<wijmo:ChartYData DoubleValue="11.77" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="UK" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="7.7" />
						<wijmo:ChartY1Data DoubleValue="4.8" />
						<wijmo:ChartY1Data DoubleValue="7.2" />
						<wijmo:ChartY1Data DoubleValue="1.4" />
						<wijmo:ChartY1Data DoubleValue="6.1" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Machines, engines" />
						<wijmo:ChartXData StringValue="Electronics" />
						<wijmo:ChartXData StringValue="Oil" />
						<wijmo:ChartXData StringValue="Vehicles" />
						<wijmo:ChartXData StringValue="Aircraft, spacecraft" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="17.62" />
						<wijmo:ChartYData DoubleValue="10.98" />
						<wijmo:ChartYData DoubleValue="16.47" />
						<wijmo:ChartYData DoubleValue="3.2" />
						<wijmo:ChartYData DoubleValue="13.95" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
		<wijmo:BubbleChartSeries Label="France" LegendEntry="True">
			<Data>
				<Y1>
					<Values>
						<wijmo:ChartY1Data DoubleValue="2.8" />
						<wijmo:ChartY1Data DoubleValue="2.4" />
						<wijmo:ChartY1Data DoubleValue="4.4" />
						<wijmo:ChartY1Data DoubleValue="0.685" />
						<wijmo:ChartY1Data DoubleValue="8.4" />
					</Values>
				</Y1>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Machines, engines" />
						<wijmo:ChartXData StringValue="Electronics" />
						<wijmo:ChartXData StringValue="Oil" />
						<wijmo:ChartXData StringValue="Vehicles" />
						<wijmo:ChartXData StringValue="Aircraft, spacecraft" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="8.78" />
						<wijmo:ChartYData DoubleValue="6.25" />
						<wijmo:ChartYData DoubleValue="13.75" />
						<wijmo:ChartYData DoubleValue="2.14" />
						<wijmo:ChartYData DoubleValue="26.25" />
					</Values>
				</Y>
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>

	<Header Text="Top US Exports to the World"></Header>
</wijmo:C1BubbleChart>
	<script type="text/javascript">
		function hint() {
			return "Country: " + this.label + "\nGoods: " + this.data.data.x[this.x] +
				"\nPercent of total export:" + this.y + '%' + "\nAmount (billions of dollars):" + this.data.y1;
		}
	</script>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This sample shows that we can click the legend to show/hide the bubble series. 
	This feature is very useful if you have a lot of data on single chart. 
	It allows user to toggle series visibility and compare different sets of data with each other.</p>
	<h3>Test the features</h3>
            <ul>
                <li>Note the legend on the top of the chart</li>
                <li>Click series items in the legend to toggle their visibility on the chart surface.</li>
                <li>Play with legend options in the panel below to see its behavior.</li>
                <li>Go to the 'Sources' tab to see how to setup chart legend through widget initialization </li>
            </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
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
