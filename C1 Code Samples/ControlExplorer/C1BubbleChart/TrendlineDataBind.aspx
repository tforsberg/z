<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="TrendlineDataBind.aspx.cs" Inherits="ControlExplorer.C1BubbleChart.TrendlineDataBind" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1BubbleChart runat="server" ID="C1BubbleChart1" DataSourceID="AccessDataSource1" Height="475" Width="756">
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
            <wijmo:C1BubbleChartBinding IsTrendline="true" TrendlineFitType="Polynom" TrendlineOrder="4" TrendlineSampleCount="100" XField="CategoryName" XFieldType="String" YField="Sales" YFieldType="Number"  />
        </DataBindings>
    </wijmo:C1BubbleChart>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        DataFile="~/App_Data/C1NWind.mdb"
        SelectCommand="select CategoryName, sum(ProductSales) as Sales, count(1) as CT from (SELECT DISTINCTROW Categories.CategoryName as CategoryName, Products.ProductName, Sum([Order Details Extended].ExtendedPrice) AS ProductSales
FROM Categories INNER JOIN (Products INNER JOIN (Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID) ON Products.ProductID = [Order Details Extended].ProductID) ON Categories.CategoryID = Products.CategoryID
WHERE (((Orders.OrderDate) Between #1/1/95# And #12/31/95#))
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
ORDER BY Products.ProductName) group by CategoryName;"></asp:AccessDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demostrates how to use <strong>C1BubbleChartBinding</strong> to draw a trendline by setting following properties:
    </p>
    <ul>
        <li>
            <strong>TrendlineFitType</strong> - sepcifies the type of the trendline.
        </li>
        <li>
            <strong>TrendlineSampleCount</strong> - specifies the sample count for function calculation. It works only if the TrendlineFitType is polynom, power, exponent, logarithmic and fourier. 
        </li>
        <li>
            <strong>TrendlineOrder</strong> - defines the number of terms in polynom equation. It works only if the TrendlineFitType is polynom, power, exponent, logarithmic and fourier.
        </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
