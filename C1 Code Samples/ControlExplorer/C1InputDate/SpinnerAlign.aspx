<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="SpinnerAlign.aspx.cs" Inherits="ControlExplorer.C1InputDate.SpinnerAlign" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <span>SpinnerAlign="VerticalLeft"</span>
       <wijmo:C1InputDate ID="C1InputDate1" runat="server" ShowSpinner="True" SpinnerAlign="VerticalLeft">
    </wijmo:C1InputDate>
    <br/>
    <span>SpinnerAlign="VerticalRight"</span>
    <wijmo:C1InputDate ID="C1InputDate2" runat="server"  ShowSpinner="True" SpinnerAlign="VerticalRight">
    </wijmo:C1InputDate>
     <br/>
    <span>SpinnerAlign="HorizontalDownLeft"</span>
    <wijmo:C1InputDate ID="C1InputDate3" runat="server" ShowSpinner="True"  SpinnerAlign="HorizontalDownLeft">
    </wijmo:C1InputDate>
     <br/>
    <span>SpinnerAlign="HorizontalDownLeft"</span>
    <wijmo:C1InputDate ID="C1InputDate4" runat="server" ShowSpinner="True"  SpinnerAlign="HorizontalUpLeft">
    </wijmo:C1InputDate>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates the <b>SpinnerAlign</b> option, it can change the alignment of the spinner button.
    </p>
</asp:Content>
