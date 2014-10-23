<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="TrendlineDataBind.aspx.cs" Inherits="C1BarChart_TrendlineDataBinding" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1BarChart ID="C1BarChart1" runat="server" DataSourceID="AccessDataSource1" Height="475" Width="756">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Header Text="Sales"></Header>
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
            <wijmo:C1ChartBinding IsTrendline="true" TrendlineFitType="Polynom" TrendlineOrder="4" TrendlineSampleCount="100" XField="CategoryName" XFieldType="String" YField="Sales" YFieldType="Number" />
        </DataBindings>
    </wijmo:C1BarChart>
    <script type="text/javascript">
        function hintContent() {
            return this.data.label + '\n' + this.y + '';
        }
    </script>
    <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/C1NWind.mdb"
        SelectCommand="select CategoryName, sum(ProductSales) as Sales from (SELECT DISTINCTROW Categories.CategoryName as CategoryName, Products.ProductName, Sum([Order Details Extended].ExtendedPrice) AS ProductSales
FROM Categories INNER JOIN (Products INNER JOIN (Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID) ON Products.ProductID = [Order Details Extended].ProductID) ON Categories.CategoryID = Products.CategoryID
WHERE (((Orders.OrderDate) Between #1/1/95# And #12/31/95#))
GROUP BY Categories.CategoryID, Categories.CategoryName, Products.ProductName
ORDER BY Products.ProductName) group by CategoryName;"></asp:AccessDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        This sample demostrates how to use <strong>C1ChartBinding</strong> to draw a trendline by setting following properties:
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

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

