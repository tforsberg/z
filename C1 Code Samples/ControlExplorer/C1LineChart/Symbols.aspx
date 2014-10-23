<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeBehind="Symbols.aspx.cs" Inherits="C1LineChart_Symbols" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.label + '\n' + Globalize.format(this.x, "MMMM yyyy") + " : " + Globalize.format(this.y, "c2");
        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart runat="server" ID="C1LineChart1" ShowChartLabels="False" Height="475" Width="756">
        <Header Text="Amazon.com Inc. stocks 2012"></Header>
        <Axis>
            <X Compass="South" Text="Month"></X>
            <Y Compass="West" Text="Average price (USD)"></Y>
        </Axis>
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <SeriesStyles>
            <wijmo:ChartStyle Stroke="#FFA41C" StrokeWidth="1" Opacity="0.7" />
        </SeriesStyles>
        <SeriesList>
            <wijmo:LineChartSeries Label="#Amazon" LegendEntry="true">
                <Markers Visible="true" Type="Circle">
                </Markers>
                <Data>
                    <X>
                        <Values>
                            <wijmo:ChartXData DateTimeValue="2012-1-1" />
                            <wijmo:ChartXData DateTimeValue="2012-2-1" />
                            <wijmo:ChartXData DateTimeValue="2012-3-1" />
                            <wijmo:ChartXData DateTimeValue="2012-4-1" />
                            <wijmo:ChartXData DateTimeValue="2012-5-1" />
                            <wijmo:ChartXData DateTimeValue="2012-6-1" />
                            <wijmo:ChartXData DateTimeValue="2012-7-1" />
                            <wijmo:ChartXData DateTimeValue="2012-8-1" />
                            <wijmo:ChartXData DateTimeValue="2012-9-1" />
                            <wijmo:ChartXData DateTimeValue="2012-10-1" />
                            <wijmo:ChartXData DateTimeValue="2012-11-1" />
                            <wijmo:ChartXData DateTimeValue="2012-12-1" />
                        </Values>
                    </X>
                    <Y>
                        <Values>
                            <wijmo:ChartYData DoubleValue="194.44" />
                            <wijmo:ChartYData DoubleValue="179" />
                            <wijmo:ChartYData DoubleValue="202.51" />
                            <wijmo:ChartYData DoubleValue="231.90" />
                            <wijmo:ChartYData DoubleValue="212.91" />
                            <wijmo:ChartYData DoubleValue="228.35" />
                            <wijmo:ChartYData DoubleValue="233.30" />
                            <wijmo:ChartYData DoubleValue="248.27" />
                            <wijmo:ChartYData DoubleValue="254.32" />
                            <wijmo:ChartYData DoubleValue="232.89" />
                            <wijmo:ChartYData DoubleValue="252.05" />
                            <wijmo:ChartYData DoubleValue="250.87" />
                        </Values>
                    </Y>
                </Data>
            </wijmo:LineChartSeries>
        </SeriesList>
    </wijmo:C1LineChart>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>The <strong>C1LineChart </strong>supports customizing the marker with specified symbols such as images.</p>
    <p>To customize the markers, the following properties are used in this sample</p>
    <ul>
        <li><strong>LineChartSeries.Markers.Symbol</strong>&nbsp;&nbsp; - the collection 
			that contains<strong> LineChartMarkerSymbol </strong>instances.</li>
        <li><strong>LineChartMarkerSymbol.Index</strong> - for specifying the index of the marker of this series.</li>
        <li><strong>LineChartMarkerSymbol.Url</strong> - for specifying the image url of this symbol.</li>
        <li><strong>LineChartMarkerSymbol.Width</strong> - for specifying the width of this symbol.</li>
        <li><strong>LineChartMarkerSymbol.Height</strong> - for specifying the height of this symbol.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Marker Type:</label>
                    <asp:DropDownList ID="cbxMarkerTypes" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxMarkerTypes_SelectedIndexChanged">
                        <asp:ListItem runat="server" Selected="True" Text="Circle" Value="Circle" />
                        <asp:ListItem runat="server" Text="Cross" Value="Cross" />
                        <asp:ListItem runat="server" Text="Diamond" Value="Diamond" />
                        <asp:ListItem runat="server" Text="Tri" Value="Tri" />
                        <asp:ListItem runat="server" Text="InvertedTri" Value="InvertedTri" />
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>

</asp:Content>

