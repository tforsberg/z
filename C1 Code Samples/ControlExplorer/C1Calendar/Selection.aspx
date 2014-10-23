<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="C1Calendar_Selection" Codebehind="Selection.aspx.cs" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Calendar" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
				<wijmo:C1Calendar ID="C1Calendar1" runat="server" ShowWeekDays="true" ShowWeekNumbers="true">
				</wijmo:C1Calendar>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
<p>
	<strong>C1Calendar </strong>supports a variety of selection options.
</p>

<p>
Date selection in month view is controlled by the <strong>SelectionMode </strong>property. The<strong>SelectionMode</strong>  property is an object that contains five  Boolean type child properties, which are:
</p>

<ul>
<li>Day</li>
<li>Days</li>
<li>WeekDay</li>
<li>WeekNumber</li>
<li>Month</li>
</ul>

<p>
For example, if we set the <strong>SelectionMode.WeekDay</strong> to True, then the weekday cell is selectable.
If we want the week number selectable, we have to set the <strong>SelectionMode.WeekNumber
	</strong>and <strong>ShowWeekNumbers</strong> properties to True.
</p>

	</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
				<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label>Selection Mode:</label></li>
	<li class="fullwidth autoheight">
		<ul>
			<li>
				<asp:CheckBox id="DayCk" runat="server" Text="Day" Checked="true" OnCheckedChanged="CheckedChanged" AutoPostBack="true"/>
			</li>
			<li>
				<asp:CheckBox id="DaysCk" runat="server" Text="Days" OnCheckedChanged="CheckedChanged" AutoPostBack="true"/>
			</li>
			<li>
				<asp:CheckBox id="WeekDayCk" runat="server" Text="WeekDay" OnCheckedChanged="CheckedChanged" AutoPostBack="true"/>
			</li>
			<li>
				<asp:CheckBox id="WeekNumberCk" runat="server" Text="WeekNumber" OnCheckedChanged="CheckedChanged" AutoPostBack="true"/>
			</li>
			<li>
				<asp:CheckBox id="MonthCk" runat="server" Text="Month" OnCheckedChanged="CheckedChanged" AutoPostBack="true"/>
			</li>
		</ul>
	</li>
</ul>
</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>

