<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="True" Inherits="C1CompositeChart_ExportingImage" CodeBehind="ExportingImage.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>
<%@ Register Src="../ChartCore/ExportImage.ascx" TagName="ExportPanel" TagPrefix="ExportPanel" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<wijmo:C1CompositeChart runat="server" ID="C1CompositeChart1" Height="475" Width="756" Stacked="false">
		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Axis>
			<X Text="">
			</X>
			<Y Text="Total Hardware" Compass="West">
			</Y>
		</Axis>
		<Header Text="Hardware Distribution">
		</Header>
		<SeriesList>
			<wijmo:CompositeChartSeries Label="West" LegendEntry="true" Type="Column">
				<Data>
					<X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
					<Y DoubleValues="5, 3, 4, 7, 2" />
				</Data>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="Central" LegendEntry="true" Type="Column">
				<Data>
					<X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
					<Y DoubleValues="2, 2, 3, 2, 1" />
				</Data>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="East" LegendEntry="true" Type="Column">
				<Data>
					<X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
					<Y DoubleValues="3, 4, 4, 2, 5" />
				</Data>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="abc" LegendEntry="true" Type="Pie" Center="150, 150" Radius="60">
				<PieSeriesList>
					<wijmo:PieChartSeries Label="MacBook Pro" LegendEntry="true" Data="46.78" Offset="0">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Label="iMac" LegendEntry="true" Data="23.18" Offset="0">
					</wijmo:PieChartSeries>
					<wijmo:PieChartSeries Label="MacBook" LegendEntry="true" Data="20.25" Offset="0">
					</wijmo:PieChartSeries>
				</PieSeriesList>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="US" LegendEntry="true" Type="Line">
				<Data>
					<X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
					<Y DoubleValues="3, 6, 2, 9, 5" />
				</Data>
			</wijmo:CompositeChartSeries>
			<wijmo:CompositeChartSeries Label="Canada" LegendEntry="true" Type="Line">
				<Data>
					<X StringValues="Desktops, Notebooks, AIO, Tablets, Phones" />
					<Y DoubleValues="1, 3, 4, 7, 2" />
				</Data>
			</wijmo:CompositeChartSeries>
		</SeriesList>
	</wijmo:C1CompositeChart>
    <script type="text/javascript">
        function hintContent() {
            return this.label + ' ' + this.y + '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
	<p>
		This sample demostrates how to export <strong>C1CompositeChart</strong> to different 
	formats of image.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
	<ExportPanel:ExportPanel ID="ExportPanel1" runat="server" ChartType="C1CompositeChart" />
</asp:Content>

