<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1BarChart_ExtremeValues" Codebehind="ExtremeValues.aspx.cs" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
	<wijmo:C1BarChart runat = "server" ID="C1BarChart1" Height="475" Width = "756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>

<Footer Compass="South" Visible="False"></Footer>

		<Legend Visible="False"></Legend>

		<Axis>
			<Y Text="Total Hardware" Compass="West">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</Y>
			<X Text="">
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
			</X>
		</Axis>
		<Header Text="Console Wars"></Header>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#7fc73c" Opacity="0.8">
				<Fill Color="#1AD11A"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<SeriesList>
			<wijmo:BarChartSeries Label="US" LegendEntry="true">
				<Data>
					<X>
						<Values>
							<wijmo:ChartXData StringValue="PS3" />
							<wijmo:ChartXData StringValue="XBOX360" />
							<wijmo:ChartXData StringValue="Wii" />
						</Values>
					</X>
					<Y>
						<Values>
							<wijmo:ChartYData DoubleValue="12.35" />
							<wijmo:ChartYData DoubleValue="21.50" />
							<wijmo:ChartYData DoubleValue="30.56" />
						</Values>
					</Y>
				</Data>
			</wijmo:BarChartSeries>
		</SeriesList>
	</wijmo:C1BarChart>
	<script type="text/javascript">
			function hintContent() {
				return this.data.label + '\n ' + this.y + '';
			}
	</script>
	</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		This sample illustrates a simple bar chart that compares the sales between the Nintendo Wii, the Xbox 360, and the Playstation 3.
	</p>
<h3>Test the features</h3>
<ul>
    <li>Hover over a bar point to see the tooltip.</li>
    <li>Note the min value of chart 'x' axis.</li>
    <li>Play with axis options in the panel below to see it features.</li>
    <li>Note the chart adjusts to the free space chnages.</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate>
	<div class="settingcontainer">
<div class="settingcontent">
	<ul>
		<li><asp:CheckBox id="AutoMinCkb" runat="server" Checked="True" Text="Enable AutoMin"/></li>
		<li>Min Value: <asp:TextBox id="MinValueTxt" runat="server" Text="0"/></li>
		<li><asp:CheckBox id="AutoMaxCkb" runat="server" Checked="True" Text="Enable AutoMax"/></li>
		<li>Max Value:<asp:TextBox id="MaxValueTxt" runat="server" Text="35"/></li>
	</ul>
	</div>
	<div class="settingcontrol">
	<asp:Button ID="Button1" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>

