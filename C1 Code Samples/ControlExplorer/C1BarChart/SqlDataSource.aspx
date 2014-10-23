<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SqlDataSource.aspx.cs" Inherits="C1BarChart_SqlDataSource" %>

<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BarChart ID="C1BarChart1" runat="server" DataSourceID="SqlDataSource1" Height="475px" Width = "756px" Culture="en-US">

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

		<Hint>
			<Content Function="hintContent" />
		</Hint>
		<Header Text="Sales"></Header>
		<SeriesList>
			<wijmo:BarChartSeries LegendEntry="True">
			</wijmo:BarChartSeries>
		</SeriesList>
		<SeriesStyles>
			<wijmo:ChartStyle Stroke="#7fc73c" Opacity="0.8">
				<Fill Color="#8ede43"></Fill>
			</wijmo:ChartStyle>
		</SeriesStyles>
		<SeriesHoverStyles>
			<wijmo:ChartStyle StrokeWidth="1.5" Opacity="1" />
		</SeriesHoverStyles>
		<DataBindings>
			<wijmo:C1ChartBinding XField="CategoryName" XFieldType="String" YField="Sales" YFieldType="Number" />
		</DataBindings>
	</wijmo:C1BarChart>
	<script type="text/javascript">
		function hintContent() {
			return this.data.label + '\n' + this.y + '';
		}
	</script>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SQLConnectionString %>" 
	ProviderName="<%$ ConnectionStrings:SQLConnectionString.ProviderName %>" 
	SelectCommand="SELECT [CategoryName], Sum([ProductSales]) as Sales FROM [Sales by Category] Group By [CategoryName]"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind SqlDataSource to the <strong>C1BarChart</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>