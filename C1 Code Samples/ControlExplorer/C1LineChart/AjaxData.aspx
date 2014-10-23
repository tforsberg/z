<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="AjaxData.aspx.cs" Inherits="C1LineChart_AjaxData" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Chart" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        function hintContent() {
            return this.x + '\n ' + this.y + '';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <wijmo:C1LineChart runat="server" ID="C1LineChart1" Height="475" Width="756">
        <Hint>
            <Content Function="hintContent" />
        </Hint>
        <Footer Compass="South" Visible="False"></Footer>
        <Legend>
            <Size Width="30" Height="3"></Size>
        </Legend>
        <Axis>
            <Y Text="Prices" />
            <X Text="Products">
                <Labels>
                    <AxisLabelStyle Rotation="-45"></AxisLabelStyle>
                </Labels>
            </X>
        </Axis>
        <Header Text="Top 10 Products by Unit Price - Northwind OData" />
    </wijmo:C1LineChart>
    <script type="text/javascript">
        $(document).ready(function () {
            var netflx = "http://demo.componentone.com/aspnet/Northwind/northwind.svc/Products?$format=json&$top=10&$orderby=Unit_Price%20desc";

            $.ajax({
                dataType: "jsonp",
                url: netflx,
                jsonp: "$callback",
                success: callback
            });
        });

        function callback(result) {
            // unwrap result
            var names = [];
            var prices = [];

            var products = result["d"];

            for (var i = 0; i < products.length; i++) {

                names.push(products[i].Product_Name);
                prices.push(parseFloat(products[i].Unit_Price));
            }

            $("#<%= C1LineChart1.ClientID %>").c1linechart("option", "seriesList", [
                    {
                        label: "Prices",
                        legendEntry: true,
                        fitType: "spline",
                        data: {
                            x: names,
                            y: prices
                        },
                        markers: {
                            visible: true,
                            type: "circle"
                        }
                    }
                ]);
            }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">
    <p>
        This sample illustrates how to create a chart using data from an external data source from the client side. In this example, we are using data from the Netflix OData feed.
    </p>
    <ul>
        <li>Data URL: <a href="http://demo.componentone.com/aspnet/Northwind/northwind.svc/Products?$format=json&$top=10&$orderby=Unit_Price%20desc">http://demo.componentone.com/aspnet/Northwind/northwind.svc/Products?$format=json&$top=10&$orderby=Unit_Price%20desc</a> </li>
        <li>API Documentation: <a href="http://www.odata.org/docs/">http://www.odata.org/docs/</a> </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

