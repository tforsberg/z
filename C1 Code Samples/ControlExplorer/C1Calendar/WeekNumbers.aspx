<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_WeekNumbers" Codebehind="WeekNumbers.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1Calendar ID="C1Calendar1" runat="server" ShowWeekNumbers="True">
	<SelectionMode WeekNumber="True" />
</wijmo:C1Calendar>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
Set the <strong>ShowWeekNumbers</strong> property to True to display week numbers. This feature is beneficial 
when the <strong>SelectionMode</strong> property is set to <strong>WeekNumber</strong>.
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

