<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="NegativeClass.aspx.cs" Inherits="ControlExplorer.C1InputNumber.NegativeClass" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .negative {
            background: yellow;
            color: red !important;
        }
    </style>
    <wijmo:C1InputNumeric ID="C1InputNumeric1" runat="server" ShowDropDownButton="true" NegativeClass="negative" Value="-2.324" DecimalPlaces="3">
    </wijmo:C1InputNumeric>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how you can set the negative style by setting the <b>NegativeClass</b> property.
    </p>
</asp:Content>
