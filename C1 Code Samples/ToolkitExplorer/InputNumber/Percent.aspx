<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Percent.aspx.cs" Inherits="InputNumber_Percent" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

Percent:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputNumberExtender ID="InputNumberExtender1" runat="server" TargetControlID="TextBox1"  
        ShowSpinner="true" Value="50" DecimalPlaces="4" NumberType="Percent" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
This sample demonstrates how to create a percentage input with the C1InputNumberExtender. simply by setting the <b>NumberType</b> property to 'Percent'.
</p>

<p>
Percent symbol is determined by the <b>Culture</b> property.
</p>

<p>
The percent input supports value spin by pressing the up/down key. You can also enable the spin buttons by setting the <b>ShowSpinner</b> property to true.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
