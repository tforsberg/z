<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Increment.aspx.cs" Inherits="InputNumber_Increment" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

Currency:
    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    <wijmo:C1InputNumberExtender ID="InputNumberExtender1" runat="server" TargetControlID="TextBox1"  
        ShowSpinner="true" MinValue="-100" MaxValue="1000" Increment="10" NumberType="Currency" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
Currency input supports incrementing and decrementing specified values by pressing the up/down key or clicking the spin buttons.
</p>

<p>
The steps of increment is determined by the <b>Increment</b> property.
</p>

<p>
In this example, if the up or down arrows are clicked, the currency input is incremented by 10. 
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>