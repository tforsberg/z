<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1InputNumber_Percent" CodeBehind="Percent.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        <wijmo:C1InputPercent ID="C1InputPercent1" runat="server" ShowSpinner="true" Value="50" DecimalPlaces="4">
        </wijmo:C1InputPercent>
    </p>
    <br />
    <p>
        <strong>Options: </strong>Value=50; DecimalPlaces=4;
    </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="Server">

    <p>
        The <strong>C1InputPercent</strong> is an input control that is specialized for editing percent values. 
    </p>

    <p>
        The percent symbol is determined by the <b>Culture</b> property.
    </p>

    <p>
        You can change the value by pressing the up/down key. Spin buttons can be enabled by setting the <b>ShowSpinner</b> property to 
    True.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="Server">
</asp:Content>

