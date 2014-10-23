<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1ScatterChart.Overview" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function hintContent() {
			return this.x + ' cm, ' + this.y + ' kg';
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1ScatterChart  ID="C1ScatterChart1" runat="server" Height="475" Width="756">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<SeriesTransition Duration="2000" Enabled="false">
		</SeriesTransition>
		<Animation Duration="2000" Enabled="false">
		</Animation>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#AFE500">
				<Fill Color="#AFE500">
				</Fill>
			</wijmo:ChartStyle>
			<wijmo:ChartStyle Stroke="#FF9900">
				<Fill Color="#FF9900">
				</Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<Header Text="Height Versus Weight of 72 Individuals by Gender">
		</Header>
		<Footer Compass="South" Visible="False">
		</Footer>
		<Legend Visible="true">
			<Size Width="30" Height="3">
			</Size>
		</Legend>
		<Axis>
			<X Text="Height (cm)">
				<Labels>
					<AxisLabelStyle FontSize="11pt" Rotation="-45">
						<Fill Color="#7F7F7F">
						</Fill>
					</AxisLabelStyle>
				</Labels>
                <GridMajor Visible="false"></GridMajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMajor>
			</X>
			<Y compass="West" text="Weight (kg)" visible="true" >
				<labels textalign="Center">
					<AxisLabelStyle FontSize="11pt">
						<Fill Color="#7F7F7F">
						</Fill>
					</AxisLabelStyle>
				</labels>
				<gridmajor visible="True">
					<GridStyle Stroke="#353539" StrokeDashArray="- "></GridStyle>
				</gridmajor>
				<TickMajor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMajor>
				<TickMinor Position="Outside">
					<TickStyle Stroke="#7F7F7F" />
				</TickMinor>
			</Y>
		</Axis>
	</wijmo:C1ScatterChart>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#<%=C1ScatterChart1.ClientID%>').c1scatterchart('option', 'showChartLabels', true);
        });
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>The C1ScatterChart allows you to create customized scatter charts. 
		The samples in this section highlight some of the unique features of the widget, and they will help you get started with C1ScatterChart.</p>
	<p>
		The source in this sample will show you how to add a header to the chart; 
		how to format the axes; and how to populate the chart with numerical x and y data.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
