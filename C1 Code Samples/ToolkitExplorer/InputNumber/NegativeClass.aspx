<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="NegativeClass.aspx.cs" Inherits="ControlExplorer.C1InputNumber.NegativeClass" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        .negative {
            background: yellow;
            color: red !important;
        }
    </style>
    	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
    <wijmo:C1InputNumberExtender NumberType="Numeric" TargetControlID="TextBox1" ID="C1InputNumeric1" runat="server" ShowDropDownButton="true" NegativeClass="negative" Value="-2.324" DecimalPlaces="3">
    </wijmo:C1InputNumberExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how you can set the negative style by setting the <b>NegativeClass</b> property.
    </p>
</asp:Content>
