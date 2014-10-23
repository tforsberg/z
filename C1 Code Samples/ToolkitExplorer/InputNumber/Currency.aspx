<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Currency.aspx.cs" Inherits="InputNumber_Currency" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

Currency:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputNumberExtender ID="InputNumberExtender1" runat="server" TargetControlID="TextBox1"  
        ShowSpinner="true" Value="250" NumberType="Currency" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
This sample demonstrates how to create a currency input with the C1InputNumberExtender. simply by setting the <b>NumberType</b> property to 'Currency'.
</p>

<p>
The C1InputNumberExtender works as a currency input if the <b>NumberType</b> property is set to 'Currency'.
</p>

<p>
The currency input supports value spin by pressing the up/down key. You can also enable the spin buttons by setting the <b>ShowSpinner</b> property to true.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

