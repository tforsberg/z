<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    Inherits="Sparkline_StockMarket" CodeBehind="StockMarket.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Sparkline"
    TagPrefix="C1Sparkline" %>
<%@ Register Assembly="mscorlib, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" Namespace="System" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <style type="text/css">
        .datatable {
            width: 100%;
            margin-top: 1em;
        }

        .datatable th, .datatable td {
            border-bottom: 1px solid #333;
            padding: 5px;
        }

        .datatable td {
            text-align: right;
            font-weight: 100;
        }

        .datatable td div {
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <span>Current trends indicate that the DOW
        <C1Sparkline:C1Sparkline ID="sparkline1" runat="server" style="height:13px;width:100px">
            <SeriesList>
                <C1Sparkline:SparklineSeries Data="16613.97, 16446.81, 16491.31, 16511.86, 16374.31, 16533.06, 16543.08, 16606.27, 16675.50, 16633.18, 16698.74, 16717.17, 16743.63, 16722.34, 16737.53, 16836.11, 16924.28, 16943.10, 16945.92, 16843.88, 16734.19, 16775.74, 16781.01, 16808.49, 16906.62, 16921.46, 16947.08, 16937.26, 16818.13, 16867.51"></C1Sparkline:SparklineSeries>
            </SeriesList>
        </C1Sparkline:C1Sparkline>
        and NASDAQ
        <C1Sparkline:C1Sparkline ID="sparkline2" runat="server" style="height:13px;width:100px">
            <SeriesList>
                <C1Sparkline:SparklineSeries Data="4100.63, 4069.29, 4090.59, 4125.82, 4096.89, 4131.54, 4154.34, 4185.81, 4237.07, 4225.07, 4247.95, 4242.62, 4237.20, 4234.08, 4251.64, 4296.23, 4321.40, 4336.24, 4338.00, 4331.93, 4297.63, 4310.65, 4321.11, 4337.23, 4362.84, 4359.33, 4368.04, 4368.68, 4350.36, 4379.76"></C1Sparkline:SparklineSeries>
            </SeriesList>
        </C1Sparkline:C1Sparkline>
        are both seeing steady growth over the past month.</span>
        <table class="datatable" cellspacing="0">
            <thead>
                <tr>
                    <th></th>
                    <th>History</th>
                    <th>5 Days</th>
                    <th>Current</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>NASDAQ</td>
                    <td>
                        <C1Sparkline:C1Sparkline ID="sparkline3" runat="server">
                            <SeriesList>
                                <C1Sparkline:SparklineSeries Data="4100.63, 4069.29, 4090.59, 4125.82, 4096.89, 4131.54, 4154.34, 4185.81, 4237.07, 4225.07, 4247.95, 4242.62, 4237.20, 4234.08, 4251.64, 4296.23, 4321.40, 4336.24, 4338.00, 4331.93, 4297.63, 4310.65, 4321.11, 4337.23, 4362.84, 4359.33, 4368.04, 4368.68, 4350.36, 4379.76"></C1Sparkline:SparklineSeries>
                            </SeriesList>
                        </C1Sparkline:C1Sparkline>
                    </td>
                    <td>
                        <C1Sparkline:C1Sparkline ID="sparkline4" runat="server">
                            <SeriesList>
                                <C1Sparkline:SparklineSeries Type="Column" Data="4359.33, 4368.04, 4368.68, 4350.36, 4379.76"></C1Sparkline:SparklineSeries>
                            </SeriesList>
                        </C1Sparkline:C1Sparkline>
                    </td>
                    <td>4379.76</td>
                </tr>
                <tr>
                    <td>DOW</td>
                    <td>
                        <C1Sparkline:C1Sparkline ID="sparkline5" runat="server">
                            <SeriesList>
                                <C1Sparkline:SparklineSeries Data="16613.97, 16446.81, 16491.31, 16511.86, 16374.31, 16533.06, 16543.08, 16606.27, 16675.50, 16633.18, 16698.74, 16717.17, 16743.63, 16722.34, 16737.53, 16836.11, 16924.28, 16943.10, 16945.92, 16843.88, 16734.19, 16775.74, 16781.01, 16808.49, 16906.62, 16921.46, 16947.08, 16937.26, 16818.13, 16867.51"></C1Sparkline:SparklineSeries>
                            </SeriesList>
                        </C1Sparkline:C1Sparkline>
                    </td>
                    <td>
                        <C1Sparkline:C1Sparkline ID="sparkline6" runat="server">
                            <SeriesList>
                                <C1Sparkline:SparklineSeries Type="Column" Data="16921.46, 16947.08, 16937.26, 16818.13, 16867.51"></C1Sparkline:SparklineSeries>
                            </SeriesList>
                        </C1Sparkline:C1Sparkline>
                    </td>
                    <td>16867.51</td>
                </tr>
            </tbody>
        </table>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates an integrated application of <strong>C1Sparkline</strong> control.
    </p>
</asp:Content>
