<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Wijmo.Master" CodeBehind="IndicatorLine.aspx.cs" Inherits="ControlExplorer.C1ScatterChart.IndicatorLine" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
	    function hintContent() {
	        //Check if multiple data points are on one axis entry. For example, multiple data entries for a single date.  
	        // Hint for Indicator line 
	        if ($.isArray(this)) {
	            var content = "";
	            //Multiple entries of data on this point, so we need to loop through them to create the hint content. 
	            for (var i = 0; i < this.length; i++) {
	                // Format y value as percent with two decimals (12.39%).  
	                //content += this[i].lineSeries.label + ': ' + Globalize.format(this[i].y / 100, 'p2') + '\n';
	                content += "Manufacturer: " + this[i].label + "\t/\t"
                     + "Price: " + Globalize.format(this[i].x, "c2") + "\t/\t"
                     + "CPU score: " + this[i].y + "\n";
	            }
	            return content;
	        }
	            // Hint for Tooltip 
	        else {
	            //Only a single data point, so we return a formatted version of it. "/n" is a line break. 
	            return "Manufacturer: " + this.label + "\n"
                     + "Price: " + Globalize.format(this.x, "c2") + "\n"
                     + "CPU score: " + this.y;
	        }
	    }
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1ScatterChart  ID="C1ScatterChart1" runat="server" Height="475" Width="756">
        <Hint Title-Content="Details">
            <Content Function="hintContent" />
        </Hint>
		<Indicator Visible="true"></Indicator>
        <Legend Visible="true"></Legend>
        <Header Text="Common CPUs benchmark (November 2013)"></Header>
        <SeriesStyles>
            <wijmo:ChartStyle Fill-Color="#4169E1" Stroke="#afe500"></wijmo:ChartStyle>
            <wijmo:ChartStyle Fill-Color="#FF6347" Stroke="#ff9900"></wijmo:ChartStyle>
        </SeriesStyles>
        <Axis>
            <X Text="Price (USD)">
                <Labels>
                    <AxisLabelStyle FontSize="11" Rotation="-45">
                        <Fill Color="#7f7f7f"></Fill>
                    </AxisLabelStyle> 
                </Labels>
                <GridMajor Visible="false"></GridMajor>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f"></TickStyle>
                </TickMajor>
            </X>
            <Y Text="Benchmark score" Compass="West" Visible="true">
                <Labels>
                    <AxisLabelStyle Fill-Color="#7f7f7f" FontSize="11"></AxisLabelStyle>
                </Labels>
                <GridMajor Visible="true">
                    <GridStyle Stroke="#353539" StrokeDashArray="-"></GridStyle>
                </GridMajor>
                <TickMajor Position="Outside">
                    <TickStyle Stroke="#7f7f7f"></TickStyle>
                </TickMajor>
                 <TickMinor Position="Outside">
                    <TickStyle Stroke="#7f7f7f"></TickStyle>
                </TickMinor>
            </Y>
        </Axis>
    </wijmo:C1ScatterChart>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p><strong>C1ScatterChart</strong> allows you to see not only whole data as a stroke but also a concrete value or all values in concrete point</p>
            <p>The source in this sample will show you how to setup indicator and tootips</p>
            <h3>Test the features</h3>
            <ul>
                <li>Hover over a data point to see the tooltip.</li>
                <li>Mouse down and drag across the chart surface to see the Indicator Line and the values it highlights.</li>
                <li>Go to the 'Source' tab to see how to setup tooltip and indicator behavior.</li>
            </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
