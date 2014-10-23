<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_OtherMonthDays" Codebehind="OtherMonthDays.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1Calendar ID="C1Calendar1" runat="server" ShowOtherMonthDays="false">
</wijmo:C1Calendar>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
Dates of adjacent months can be hidden in month view.
</p>

<p>
To hide the dates belonging to adjacent months, you can set the <b>ShowOtherMonthDays</b> property to False.
</p>

<p>
By default, the <b>ShowOtherMonthDays</b> property is True, which means the dates of adjacent months are still viewable.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

