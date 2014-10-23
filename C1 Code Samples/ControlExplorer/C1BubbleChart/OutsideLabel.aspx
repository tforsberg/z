<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="OutsideLabel.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.OutsideLabel" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
<ContentTemplate>
<wijmo:C1BubbleChart runat="server" ID="BubbleChart1" MinimumSize="3" MaximumSize="15" Height="475" Width = "756">
	<Axis>
		<X Text=""></X>
		<Y Text="Total Hardware" Compass="West"></Y>
	</Axis>
	<Hint>
		<Content Function="hint" />
	</Hint>
	<Legend Visible="false"></Legend>
	<Header Text="Hardware Distribution"></Header>
	<ChartLabel Position="Outside" Compass="North"></ChartLabel>
	<SeriesList>
		<wijmo:BubbleChartSeries Label="West" LegendEntry="true">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData DoubleValue="5" />
						<wijmo:ChartXData DoubleValue="14" />
						<wijmo:ChartXData DoubleValue="20" />
						<wijmo:ChartXData DoubleValue="18" />
						<wijmo:ChartXData DoubleValue="22" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="5500" />
						<wijmo:ChartYData DoubleValue="12200" />
						<wijmo:ChartYData DoubleValue="60000" />
						<wijmo:ChartYData DoubleValue="24400" />
						<wijmo:ChartYData DoubleValue="32000" />
					</Values>
				</Y>
				<Y1 DoubleValues="3,12,33,10,42" />
			</Data>
		</wijmo:BubbleChartSeries>
	</SeriesList>
</wijmo:C1BubbleChart><script type="text/javascript">
function hint() {
    return this.data.label + ' x:' + this.x + ',y:' + this.y + ",y1:" + this.data.y1;
}
</script>
</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample uses the <b>ChartLabel</b>'s child property <b>Compass</b> and <b>Position</b> to define which 
		direction the labels are located.</p>
	<p>The Compass option can be set to North, South, East or West.</p>
	<h3>Test the features</h3>
	<ul>
		<li>Note the labels could be position inside and outside the chart.</li>
		<li>Play with demo controls to toggle label display setting.</li>
		<li>Go to the 'Sources' tab to see how to setup labels position and orientation.</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
	<ul>
		<li class="fullwidth"><label class="settinglegend">Label Layout:</label></li>
		<li><label>Position:</label><asp:DropDownList ID="DdlPosition" runat="server">
			<asp:ListItem>Inside</asp:ListItem>
			<asp:ListItem Selected="True">Outside</asp:ListItem>
			</asp:DropDownList></li>
		<li><label>Compass:</label>
			<asp:DropDownList ID="DdlCompass" runat="server">
			<asp:ListItem Selected="True">North</asp:ListItem>
			<asp:ListItem>South</asp:ListItem>
			<asp:ListItem>East</asp:ListItem>
			<asp:ListItem>West</asp:ListItem>
			</asp:DropDownList></li>
		<li><asp:Checkbox runat="server" id="CbVisible" Text="Visible" Checked="True"/></li>
	</ul></div>
	<div class="settingcontrol">
	<asp:Button ID="ApplyBtn" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
