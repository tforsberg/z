<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="LineChart_Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<script type = "text/javascript">
		function hintContent() {
			return this.data.lineSeries.label + '\n' +
				this.x + '\n' + this.y + '';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:Panel ID="linechart" runat="server" Height="475" Width = "756">
	</asp:Panel>
	<wijmo:C1LineChartExtender runat = "server" ID="LineChartExtender1" 
		TargetControlID="linechart" ShowChartLabels="False" >
		        <Header Text="Users Online">
        </Header>
        <Footer Compass="South" Visible="False">
        </Footer>
        <Legend Visible="false">
        </Legend>
        <Hint OffsetY="-10">
            <Content Function="hintContent" />
        </Hint>
	</wijmo:C1LineChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>The C1LineChartExtender(wijlinechart at client side) allows you to create customized line charts. The samples in this section highlight some of the unique features of C1LineChartExtender, and they will help you get started with C1LineChartExtender.</p>
	<p>The source in this sample will show you how to add a header to the chart; how to format the axes; how to add chart labels; and how to populate the chart with data.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>