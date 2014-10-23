<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputNumber_Overview" CodeBehind="Overview.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <wijmo:C1InputNumeric ID="C1InputNumeric1" runat="server" ShowSpinner="true" Value="2.324" MinValue="-100" MaxValue="1000" DecimalPlaces="3">
        </wijmo:C1InputNumeric>
    </p>
    <br />
    <p>
        <strong>Options: </strong>MinValue=-100; MaxValue=1000; DecimalPlaces=3;
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>
        The <strong>C1InputNumeric</strong> is an input control that is specialized for editing numeric values. 
    This sample depicts a simple, default <strong>C1InputNumeric </strong>control, 
    while other samples in this section illustrate how to use features of the 
    control. 
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

