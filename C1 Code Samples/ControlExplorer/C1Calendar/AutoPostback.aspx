<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="True" CodeBehind="AutoPostback.aspx.cs" Inherits="ControlExplorer.C1Calendar.AutoPostback" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>
<%@ Register Src="~/ServerSideLogger.ascx" TagPrefix="uc1" TagName="ServerSideLogger" %>



<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<wijmo:C1Calendar ID="C1Calendar1" runat="server" AutoPostBack="true" ShowWeekNumbers="true"  
		onselecteddateschanged="C1Calendar1_SelectedDatesChanged" CssClass="serversidelogger-before">
	<SelectionMode Month="True" WeekDay="True" WeekNumber="True" />
</wijmo:C1Calendar>
	<uc1:ServerSideLogger runat="server" ID="ServerSideLogger" Title="Last fired event:"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
Calendar supports automatic postback, which happens when a date is selected from the client side.
</p>

<p>
Auto-postback is enabled if the <strong>AutoPostBack </strong>property is set to True.
</p>

<p>
User can get the selected dates from the server side via the <strong>SelectedDatesChanged</strong> event.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

