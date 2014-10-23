<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputNumber_Increment" CodeBehind="Increment.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <p>
        <wijmo:C1InputCurrency ID="C1InputCurrency1" runat="server" ShowSpinner="true" Value="0" MinValue="-100" MaxValue="1000" Increment="10">
        </wijmo:C1InputCurrency>
    </p>
    <br />
    <p>
        <strong>Options: </strong>Increment=10; MinValue=-100; MaxValue=1000;
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>
        <strong>C1InputCurrency</strong> supports incrementing and decrementing specified values by pressing the up/down key or clicking the spin buttons.
    </p>

    <p>
        The steps of increment is determined by the <b>Increment</b> property.
    </p>

    <p>
        In this example, if the up or down arrows are clicked, the currency input is 
    incremented by a value of 10 when you click the &#39;up&#39; or &#39;down&#39; arrows.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

