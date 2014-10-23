<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="XmlDataSource.aspx.cs" Inherits="C1BubbleChart_XmlDataSource" %>

<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Chart" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" DataSourceID="XmlDataSource1" Height="475" Width = "756">
<Animation Duration="500" Easing="EaseOutElastic"></Animation>

<Footer Compass="South" Visible="False"></Footer>

<Axis>
	<X>
		<TextStyle Rotation="-45">
		</TextStyle>
	</X>
<Y Visible="False" Compass="West">
<Labels TextAlign="Center"></Labels>

<GridMajor Visible="True"></GridMajor>
</Y>
</Axis>
<DataBindings>
<wijmo:C1BubbleChartBinding XField="CategoryName" XFieldType="String" YField="Sales" YFieldType="Number" Y1Field="CT" />
</DataBindings>
</wijmo:C1BubbleChart>
	<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/CategorySales.xml" 
		XPath="/C1NWind/CategorySales/CategorySale"></asp:XmlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to bind XmlDataSource to the <strong>C1BubbleChart</strong> control.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
