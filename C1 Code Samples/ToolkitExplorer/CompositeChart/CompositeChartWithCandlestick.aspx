<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="CompositeChartWithCandlestick.aspx.cs" Inherits="ToolkitExplorer.CompositeChart.CompositeChartWithCandlestick" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Chart"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="CompositeChart1" runat="server" Height="475" Width="756">
    </asp:Panel>
    <wijmo:C1CompositeChartExtender runat="server" ID="C1CompositeChartExtender1" TargetControlID="CompositeChart1" Stacked="false" Legend-Visible="false" ShowChartLabels="false">
        <SeriesList>
            <wijmo:CompositeChartSeries Label="MSFT" LegendEntry="true" Type="Ohlc" YAxis="0">
                <CandlestickSeries>
                    <Data>
                     <X>
                         <Values>
                             <wijmo:ChartXData DateTimeValue="2011-12-01" />
                             <wijmo:ChartXData DateTimeValue="2011-12-02" />
                             <wijmo:ChartXData DateTimeValue="2011-12-05" />
                             <wijmo:ChartXData DateTimeValue="2011-12-06" />
                             <wijmo:ChartXData DateTimeValue="2011-12-07" />
                             <wijmo:ChartXData DateTimeValue="2011-12-08" />
                             <wijmo:ChartXData DateTimeValue="2011-12-09" />
                             <wijmo:ChartXData DateTimeValue="2011-12-12" />
                             <wijmo:ChartXData DateTimeValue="2011-12-13" />
                             <wijmo:ChartXData DateTimeValue="2011-12-14" />
                             <wijmo:ChartXData DateTimeValue="2011-12-15" />
                             <wijmo:ChartXData DateTimeValue="2011-12-16" />
                             <wijmo:ChartXData DateTimeValue="2011-12-19" />
                             <wijmo:ChartXData DateTimeValue="2011-12-20" />
                             <wijmo:ChartXData DateTimeValue="2011-12-21" />
                             <wijmo:ChartXData DateTimeValue="2011-12-22" />
                             <wijmo:ChartXData DateTimeValue="2011-12-23" />
                             <wijmo:ChartXData DateTimeValue="2011-12-26" />
                             <wijmo:ChartXData DateTimeValue="2011-12-27" />
                             <wijmo:ChartXData DateTimeValue="2011-12-28" />
                             <wijmo:ChartXData DateTimeValue="2011-12-29" />
                             <wijmo:ChartXData DateTimeValue="2011-12-30" />
                             <wijmo:ChartXData DateTimeValue="2012-01-02" />
                             <wijmo:ChartXData DateTimeValue="2012-01-03" />
                             <wijmo:ChartXData DateTimeValue="2012-01-04" />
                             <wijmo:ChartXData DateTimeValue="2012-01-05" />
                             <wijmo:ChartXData DateTimeValue="2012-01-06" />
                             <wijmo:ChartXData DateTimeValue="2012-01-09" />
                             <wijmo:ChartXData DateTimeValue="2012-01-10" />
                             <wijmo:ChartXData DateTimeValue="2012-01-11" />
                             <wijmo:ChartXData DateTimeValue="2012-01-12" />
                             <wijmo:ChartXData DateTimeValue="2012-01-13" />
                             <wijmo:ChartXData DateTimeValue="2012-01-16" />
                             <wijmo:ChartXData DateTimeValue="2012-01-17" />
                             <wijmo:ChartXData DateTimeValue="2012-01-18" />
                             <wijmo:ChartXData DateTimeValue="2012-01-19" />
                             <wijmo:ChartXData DateTimeValue="2012-01-20" />
                             <wijmo:ChartXData DateTimeValue="2012-01-23" />
                             <wijmo:ChartXData DateTimeValue="2012-01-24" />
                             <wijmo:ChartXData DateTimeValue="2012-01-25" />
                             <wijmo:ChartXData DateTimeValue="2012-01-26" />
                             <wijmo:ChartXData DateTimeValue="2012-01-27" />
                             <wijmo:ChartXData DateTimeValue="2012-01-30" />
                             <wijmo:ChartXData DateTimeValue="2012-01-31" />
                         </Values>
                     </X>
                     <High DoubleValues="10,12,11,14,16,20,18,17,17.5,20,22,21,22.5,20,21,20.8,20,19,18,17,16,15,15,14,13,12,
						11.5,10.9,10,9,9.5,10,12,11,14,16,20,18,17,17.5,20,22,21,22.5" />
                     <Low DoubleValues="7.5,8.6,4.4,4.2,8,9,11,10,12.2,12,16,15.5,16,15,16,16.5,16,16,15,14.5,14,13.5,13,12,11,
						11,10,9,8,7.5,7.9,7.5,8.6,4.4,4.2,8,9,11,10,12.2,12,16,15.5,16" />
                     <Open DoubleValues="8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5,17.8,18.6,19.8,18,16.9,15.6,14.7,14.2,13.9,13.2,
						12.8,11.7,11.2,10.5,9.4,8.9,8.4,8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2" />
                     <Close DoubleValues="8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5,17.8,18.6,19.8,18,16.9,15.6,14.7,14.2,13.9,13.2,
						12.8,11.7,11.2,10.5,9.4,8.9,8.4,8,8.6,11,6.2,13.8,15,14,12,16,15,17,18,17.2,18.5" />
                 </Data>
                </CandlestickSeries>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Label="Test" LegendEntry="true" Type="Line" YAxis="1">
                <Data>
                    <X>
                         <Values>
                             <wijmo:ChartXData DateTimeValue="2011-12-01" />
                             <wijmo:ChartXData DateTimeValue="2011-12-02" />
                             <wijmo:ChartXData DateTimeValue="2011-12-05" />
                             <wijmo:ChartXData DateTimeValue="2011-12-06" />
                             <wijmo:ChartXData DateTimeValue="2011-12-07" />
                             <wijmo:ChartXData DateTimeValue="2011-12-08" />
                             <wijmo:ChartXData DateTimeValue="2011-12-09" />
                             <wijmo:ChartXData DateTimeValue="2011-12-12" />
                             <wijmo:ChartXData DateTimeValue="2011-12-13" />
                             <wijmo:ChartXData DateTimeValue="2011-12-14" />
                             <wijmo:ChartXData DateTimeValue="2011-12-15" />
                             <wijmo:ChartXData DateTimeValue="2011-12-16" />
                             <wijmo:ChartXData DateTimeValue="2011-12-19" />
                             <wijmo:ChartXData DateTimeValue="2011-12-20" />
                             <wijmo:ChartXData DateTimeValue="2011-12-21" />
                             <wijmo:ChartXData DateTimeValue="2011-12-22" />
                             <wijmo:ChartXData DateTimeValue="2011-12-23" />
                             <wijmo:ChartXData DateTimeValue="2011-12-26" />
                             <wijmo:ChartXData DateTimeValue="2011-12-27" />
                             <wijmo:ChartXData DateTimeValue="2011-12-28" />
                             <wijmo:ChartXData DateTimeValue="2011-12-29" />
                             <wijmo:ChartXData DateTimeValue="2011-12-30" />
                             <wijmo:ChartXData DateTimeValue="2012-01-02" />
                             <wijmo:ChartXData DateTimeValue="2012-01-03" />
                             <wijmo:ChartXData DateTimeValue="2012-01-04" />
                             <wijmo:ChartXData DateTimeValue="2012-01-05" />
                             <wijmo:ChartXData DateTimeValue="2012-01-06" />
                             <wijmo:ChartXData DateTimeValue="2012-01-09" />
                             <wijmo:ChartXData DateTimeValue="2012-01-10" />
                             <wijmo:ChartXData DateTimeValue="2012-01-11" />
                             <wijmo:ChartXData DateTimeValue="2012-01-12" />
                             <wijmo:ChartXData DateTimeValue="2012-01-13" />
                             <wijmo:ChartXData DateTimeValue="2012-01-16" />
                             <wijmo:ChartXData DateTimeValue="2012-01-17" />
                             <wijmo:ChartXData DateTimeValue="2012-01-18" />
                             <wijmo:ChartXData DateTimeValue="2012-01-19" />
                             <wijmo:ChartXData DateTimeValue="2012-01-20" />
                             <wijmo:ChartXData DateTimeValue="2012-01-23" />
                             <wijmo:ChartXData DateTimeValue="2012-01-24" />
                             <wijmo:ChartXData DateTimeValue="2012-01-25" />
                             <wijmo:ChartXData DateTimeValue="2012-01-26" />
                             <wijmo:ChartXData DateTimeValue="2012-01-27" />
                             <wijmo:ChartXData DateTimeValue="2012-01-30" />
                             <wijmo:ChartXData DateTimeValue="2012-01-31" />
                         </Values>
                     </X>
                    <Y DoubleValues="10,12,11,14,16,20,18,17,17.5,20,22,21,22.5,20,21,20.8,20,19,18,17,16,15,15,14,13,12,
						11.5,10.9,10,9,9.5,10,12,11,14,16,20,18,17,17.5,20,22,21,22.5" />
                </Data>
            </wijmo:CompositeChartSeries>
            <wijmo:CompositeChartSeries Label="East" LegendEntry="true" Type="Column" YAxis="1">
                <Data>
                    <X>
                         <Values>
                             <wijmo:ChartXData DateTimeValue="2011-12-01" />
                             <wijmo:ChartXData DateTimeValue="2011-12-02" />
                             <wijmo:ChartXData DateTimeValue="2011-12-05" />
                             <wijmo:ChartXData DateTimeValue="2011-12-06" />
                             <wijmo:ChartXData DateTimeValue="2011-12-07" />
                             <wijmo:ChartXData DateTimeValue="2011-12-08" />
                             <wijmo:ChartXData DateTimeValue="2011-12-09" />
                             <wijmo:ChartXData DateTimeValue="2011-12-12" />
                             <wijmo:ChartXData DateTimeValue="2011-12-13" />
                             <wijmo:ChartXData DateTimeValue="2011-12-14" />
                             <wijmo:ChartXData DateTimeValue="2011-12-15" />
                             <wijmo:ChartXData DateTimeValue="2011-12-16" />
                             <wijmo:ChartXData DateTimeValue="2011-12-19" />
                             <wijmo:ChartXData DateTimeValue="2011-12-20" />
                             <wijmo:ChartXData DateTimeValue="2011-12-21" />
                             <wijmo:ChartXData DateTimeValue="2011-12-22" />
                             <wijmo:ChartXData DateTimeValue="2011-12-23" />
                             <wijmo:ChartXData DateTimeValue="2011-12-26" />
                             <wijmo:ChartXData DateTimeValue="2011-12-27" />
                             <wijmo:ChartXData DateTimeValue="2011-12-28" />
                             <wijmo:ChartXData DateTimeValue="2011-12-29" />
                             <wijmo:ChartXData DateTimeValue="2011-12-30" />
                             <wijmo:ChartXData DateTimeValue="2012-01-02" />
                             <wijmo:ChartXData DateTimeValue="2012-01-03" />
                             <wijmo:ChartXData DateTimeValue="2012-01-04" />
                             <wijmo:ChartXData DateTimeValue="2012-01-05" />
                             <wijmo:ChartXData DateTimeValue="2012-01-06" />
                             <wijmo:ChartXData DateTimeValue="2012-01-09" />
                             <wijmo:ChartXData DateTimeValue="2012-01-10" />
                             <wijmo:ChartXData DateTimeValue="2012-01-11" />
                             <wijmo:ChartXData DateTimeValue="2012-01-12" />
                             <wijmo:ChartXData DateTimeValue="2012-01-13" />
                             <wijmo:ChartXData DateTimeValue="2012-01-16" />
                             <wijmo:ChartXData DateTimeValue="2012-01-17" />
                             <wijmo:ChartXData DateTimeValue="2012-01-18" />
                             <wijmo:ChartXData DateTimeValue="2012-01-19" />
                             <wijmo:ChartXData DateTimeValue="2012-01-20" />
                             <wijmo:ChartXData DateTimeValue="2012-01-23" />
                             <wijmo:ChartXData DateTimeValue="2012-01-24" />
                             <wijmo:ChartXData DateTimeValue="2012-01-25" />
                             <wijmo:ChartXData DateTimeValue="2012-01-26" />
                             <wijmo:ChartXData DateTimeValue="2012-01-27" />
                             <wijmo:ChartXData DateTimeValue="2012-01-30" />
                             <wijmo:ChartXData DateTimeValue="2012-01-31" />
                         </Values>
                     </X>
                    <Y DoubleValues="7.5,8.6,4.4,4.2,8,9,11,10,12.2,12,16,15.5,16,15,16,16.5,16,16,15,14.5,14,13.5,13,12,11,
						11,10,9,8,7.5,7.9,7.5,8.6,4.4,4.2,8,9,11,10,12.2,12,16,15.5,16" />
                </Data>
            </wijmo:CompositeChartSeries>
        </SeriesList>
		 <TextStyle FontFamily="Segoe UI, Frutiger, Frutiger Linotype, Dejavu Sans, Helvetica Neue, Arial, sans-serif" FontSize="13px"></TextStyle>
		 <Header Text="Stock History"></Header>
		 <Legend Compass="North" Visible="true" Orientation="Horizontal"></Legend>
		 <Hint Enable="false"></Hint>
		 <Axis>
			 <X>
				 <TextStyle FontWeight="normal"></TextStyle>
				 <TickMajor Position="Outside">
					 <TickStyle Stroke="#999999"></TickStyle>
				 </TickMajor>
			 </X>
		 </Axis>
		 <YAxes>
			 <wijmo:CompositeChartYAxis Compass="East" Text="Stock Price" Alignment="Far">
				 <Height IsAuto="true" />
				 <TextStyle FontWeight="normal"></TextStyle>
			 </wijmo:CompositeChartYAxis>
			 <wijmo:CompositeChartYAxis Compass="East" Text="Stock Price" Alignment="Far">
				 <Height Value="160" />
				 <TextStyle FontWeight="normal"></TextStyle>
			 </wijmo:CompositeChartYAxis>
		 </YAxes>
    </wijmo:C1CompositeChartExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
   
</asp:Content>
