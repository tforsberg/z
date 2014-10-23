<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputNumber_Currency" CodeBehind="Currency.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <wijmo:C1InputCurrency ID="C1InputCurrency1" runat="server" ShowSpinner="true" Value="25.50" MinValue="0" MaxValue="1000">
    </wijmo:C1InputCurrency>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>
        The <strong>C1InputCurrency</strong> is an input control that is specialized for editing currency values. 
    </p>

    <p>
        The currency symbol is determined by the <b>Culture</b> property.
    </p>

    <p>
        You can change the value by pressing the up/down key. Spin buttons cam be enabled by setting the <b>ShowSpinner</b> property to 
    True.
    </p>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

