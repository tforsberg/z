<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="Sparkline_GridView" CodeBehind="GridView.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView"
    TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <h3>Top 10 Sales Report</h3>
    <wijmo:c1gridview ID="C1gridview1" runat="server" AutogenerateColumns="False" 
            DataSourceID="SqlDataSource1">
            <Columns>
                <wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" 
                    SortExpression="ProductName">
                </wijmo:C1BoundField>
                <wijmo:C1BoundField DataField="TotalQuantity" HeaderText="Total Quantity">
                </wijmo:C1BoundField>
                <wijmo:C1BoundField DataField="TotalExtendedPrice" HeaderText="Total Sales" 
                    SortExpression="TotalExtendedPrice">
                </wijmo:C1BoundField>
                <wijmo:C1TemplateField HeaderText="Sales Trend in 1994">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1994" runat="server" Value='<%# Eval("ProductID") %>' />
                        <asp:SqlDataSource ID="SqlDataSource1994" runat="server"
                            ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" 
                            SelectCommand="SELECT SUM([Order Details Extended].ExtendedPrice) AS TotalPrice, [Order Details Extended].ProductID FROM Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID WHERE (YEAR(Orders.OrderDate) = 1994) AND ([Order Details Extended].ProductID = @Param) GROUP BY MONTH(Orders.OrderDate), [Order Details Extended].ProductID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1994" Name="Param" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <wijmo:C1Sparkline ID="Sparkline1994" runat="server" DataSourceID="SqlDataSource1994">
                            <SeriesList>
                                <wijmo:SparklineSeries Bind="TotalPrice">
                                </wijmo:SparklineSeries>
                            </SeriesList>
                        </wijmo:C1Sparkline>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </wijmo:C1TemplateField>
                <wijmo:C1TemplateField HeaderText="Sales Trend in 1995">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1995" runat="server" Value='<%# Eval("ProductID") %>' />
                        <asp:SqlDataSource ID="SqlDataSource1995" runat="server"
                            ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" 
                            SelectCommand="SELECT SUM([Order Details Extended].ExtendedPrice) AS TotalPrice, [Order Details Extended].ProductID FROM Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID WHERE (YEAR(Orders.OrderDate) = 1995) AND ([Order Details Extended].ProductID = @Param) GROUP BY MONTH(Orders.OrderDate), [Order Details Extended].ProductID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1995" Name="Param" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <wijmo:C1Sparkline ID="Sparkline1995" runat="server" DataSourceID="SqlDataSource1995">
                            <SeriesList>
                                <wijmo:SparklineSeries Bind="TotalPrice">
                                </wijmo:SparklineSeries>
                            </SeriesList>
                        </wijmo:C1Sparkline>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </wijmo:C1TemplateField>
                <wijmo:C1TemplateField HeaderText="Sales Trend in 1996">
                    <ItemTemplate>
                        <asp:HiddenField ID="HiddenField1996" runat="server" Value='<%# Eval("ProductID") %>' />
                        <asp:SqlDataSource ID="SqlDataSource1996" runat="server"
                            ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" 
                            ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" 
                            SelectCommand="SELECT SUM([Order Details Extended].ExtendedPrice) AS TotalPrice, [Order Details Extended].ProductID FROM Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID WHERE (YEAR(Orders.OrderDate) = 1996) AND ([Order Details Extended].ProductID = @Param) GROUP BY MONTH(Orders.OrderDate), [Order Details Extended].ProductID">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="HiddenField1996" Name="Param" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <wijmo:C1Sparkline ID="Sparkline1996" runat="server" DataSourceID="SqlDataSource1996">
                            <SeriesList>
                                <wijmo:SparklineSeries Bind="TotalPrice">
                                </wijmo:SparklineSeries>
                            </SeriesList>
                        </wijmo:C1Sparkline>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </wijmo:C1TemplateField>
            </Columns>
        </wijmo:c1gridview>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" 
            ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" 
            SelectCommand="SELECT TOP 10 ProductID, ProductName, SUM(ExtendedPrice) AS TotalExtendedPrice, SUM(Quantity) AS TotalQuantity FROM [Order Details Extended] GROUP BY ProductID, ProductName ORDER BY SUM(ExtendedPrice) DESC">
        </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the capability of <strong>C1Sparkline</strong> control to reside in a <strong>C1GridView</strong>.
    </p>
    <p>
		Use a <strong>C1TemplateField</strong> in one <strong>C1GridView</strong> column to hold the <strong>C1Sparkline</strong>. See the source code of this demo to learn how to bind data.
    </p>
</asp:Content>
