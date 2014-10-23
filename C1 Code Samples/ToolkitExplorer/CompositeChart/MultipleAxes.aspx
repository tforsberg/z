<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="MultipleAxes.aspx.cs" Inherits="ToolkitExplorer.CompositeChart.MultipleAxes" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
	function hintContent() {
		return this.label + '\n ' + this.y + '';
	}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<asp:Panel ID="CompositeChart1" runat="server" Height="475" Width="756">
    </asp:Panel>
	<wijmo:C1CompositeChartExtender runat="server" ID="C1CompositeChartExtender1" TargetControlID="CompositeChart1">
	<Hint>
		<Content Function="hintContent" />
	</Hint>
	<YAxes>
		<wijmo:CompositeChartYAxis AutoMax="False" AutoMin="False" Compass="East" 
			Max="35" Min="5" Text="Temperature">
			<TextStyle>
				<Fill Color="#89A54E">
				</Fill>
			</TextStyle>
			<Labels TextAlign="Center">
				<Style>
					<Fill Color="#89A54E">
					</Fill>
				</Style>
				<AxisLabelStyle>
					<Fill Color="#89A54E">
					</Fill>
				</AxisLabelStyle>
			</Labels>
			<GridMajor Visible="True">
			</GridMajor>
			<GridMinor Visible="False">
			</GridMinor>
		</wijmo:CompositeChartYAxis>
		<wijmo:CompositeChartYAxis AutoMax="False" AutoMin="False" Compass="West" 
			Max="300" Text="Rainfall">
			<Labels TextAlign="Center">
			</Labels>
			<GridMajor Visible="True">
			</GridMajor>
			<GridMinor Visible="False">
			</GridMinor>
		</wijmo:CompositeChartYAxis>
		<wijmo:CompositeChartYAxis Compass="East">
			<Labels TextAlign="Center">
			</Labels>
			<GridMajor Visible="True">
			</GridMajor>
			<GridMinor Visible="False">
			</GridMinor>
		</wijmo:CompositeChartYAxis>
	</YAxes>
	<SeriesList>
		<wijmo:CompositeChartSeries Label="West" LegendEntry="True" Type="Column" 
			YAxis="1">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Jan" />
						<wijmo:ChartXData StringValue="Feb" />
						<wijmo:ChartXData StringValue="Mar" />
						<wijmo:ChartXData StringValue="Apr" />
						<wijmo:ChartXData StringValue="May" />
						<wijmo:ChartXData StringValue="Jun" />
						<wijmo:ChartXData StringValue="Jul" />
						<wijmo:ChartXData StringValue="Aug" />
						<wijmo:ChartXData StringValue="Sep" />
						<wijmo:ChartXData StringValue="Oct" />
						<wijmo:ChartXData StringValue="Nov" />
						<wijmo:ChartXData StringValue="Dec" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="49.9" />
						<wijmo:ChartYData DoubleValue="71.5" />
						<wijmo:ChartYData DoubleValue="106.4" />
						<wijmo:ChartYData DoubleValue="129.2" />
						<wijmo:ChartYData DoubleValue="144" />
						<wijmo:ChartYData DoubleValue="176" />
						<wijmo:ChartYData DoubleValue="135.6" />
						<wijmo:ChartYData DoubleValue="148.5" />
						<wijmo:ChartYData DoubleValue="216.4" />
						<wijmo:ChartYData DoubleValue="194.1" />
						<wijmo:ChartYData DoubleValue="95.6" />
						<wijmo:ChartYData DoubleValue="54.4" />
					</Values>
				</Y>
			</Data>
		</wijmo:CompositeChartSeries>
		<wijmo:CompositeChartSeries Label="East" LegendEntry="True" Type="Spline" 
			YAxis="2">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Jan" />
						<wijmo:ChartXData StringValue="Feb" />
						<wijmo:ChartXData StringValue="Mar" />
						<wijmo:ChartXData StringValue="Apr" />
						<wijmo:ChartXData StringValue="May" />
						<wijmo:ChartXData StringValue="Jun" />
						<wijmo:ChartXData StringValue="Jul" />
						<wijmo:ChartXData StringValue="Aug" />
						<wijmo:ChartXData StringValue="Sep" />
						<wijmo:ChartXData StringValue="Oct" />
						<wijmo:ChartXData StringValue="Nov" />
						<wijmo:ChartXData StringValue="Dec" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="1016" />
						<wijmo:ChartYData DoubleValue="1016" />
						<wijmo:ChartYData DoubleValue="1015.9" />
						<wijmo:ChartYData DoubleValue="1015.5" />
						<wijmo:ChartYData DoubleValue="1012.3" />
						<wijmo:ChartYData DoubleValue="1009.5" />
						<wijmo:ChartYData DoubleValue="1009.6" />
						<wijmo:ChartYData DoubleValue="1010.2" />
						<wijmo:ChartYData DoubleValue="1013.1" />
						<wijmo:ChartYData DoubleValue="1016.9" />
						<wijmo:ChartYData DoubleValue="1018.2" />
						<wijmo:ChartYData DoubleValue="1016.7" />
					</Values>
				</Y>
			</Data>
		</wijmo:CompositeChartSeries>
		<wijmo:CompositeChartSeries Label="South" LegendEntry="True" Type="Line">
			<Data>
				<X>
					<Values>
						<wijmo:ChartXData StringValue="Jan" />
						<wijmo:ChartXData StringValue="Feb" />
						<wijmo:ChartXData StringValue="Mar" />
						<wijmo:ChartXData StringValue="Apr" />
						<wijmo:ChartXData StringValue="May" />
						<wijmo:ChartXData StringValue="Jun" />
						<wijmo:ChartXData StringValue="Jul" />
						<wijmo:ChartXData StringValue="Aug" />
						<wijmo:ChartXData StringValue="Sep" />
						<wijmo:ChartXData StringValue="Oct" />
						<wijmo:ChartXData StringValue="Nov" />
						<wijmo:ChartXData StringValue="Dec" />
					</Values>
				</X>
				<Y>
					<Values>
						<wijmo:ChartYData DoubleValue="7" />
						<wijmo:ChartYData DoubleValue="6.9" />
						<wijmo:ChartYData DoubleValue="9.5" />
						<wijmo:ChartYData DoubleValue="14.5" />
						<wijmo:ChartYData DoubleValue="18.2" />
						<wijmo:ChartYData DoubleValue="21.5" />
						<wijmo:ChartYData DoubleValue="25.2" />
						<wijmo:ChartYData DoubleValue="26.5" />
						<wijmo:ChartYData DoubleValue="23.3" />
						<wijmo:ChartYData DoubleValue="18.3" />
						<wijmo:ChartYData DoubleValue="13.9" />
						<wijmo:ChartYData DoubleValue="9.6" />
					</Values>
				</Y>
			</Data>
			<LineMarkers Visible="True">
			</LineMarkers>
		</wijmo:CompositeChartSeries>
	</SeriesList>
<Header Compass="North" Text="Hardware Distribution"></Header>

<Footer Compass="South" Visible="False"></Footer>

<Axis>
<X>
<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
</X>

<Y Visible="False" Compass="West">
<Labels TextAlign="Center"></Labels>

<GridMajor Visible="True"></GridMajor>

<GridMinor Visible="False"></GridMinor>
</Y>
</Axis>
	</wijmo:C1CompositeChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>
        The Wijmo Composite Chart widget (wijcompositechart) allows you to draw multiple types of chart in one canvas simultaneously.
    </p>
</asp:Content>
