<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="UICustomization.aspx.cs" Inherits="ControlExplorer.C1EventsCalendar.UICustomization" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1EventsCalendar"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<wijmo:C1EventsCalendar Width="100%" runat="server" ID="C1EventsCalendar1" EventTitleFormat="Custom title, start date: {0:d}">
			</wijmo:C1EventsCalendar>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">	
<asp:UpdatePanel runat="server">
	<ContentTemplate>
		<div class="settingcontainer">
			<div class="settingcontent">
				<ul>
					<li class="fullwidth">
						<asp:CheckBox ID="ChkShowHeaderBar" runat="server" Checked="true" Text="Show Header Bar" OnCheckedChanged="ChkShowHeaderBar_CheckedChanged" AutoPostBack="true" />
					</li>
					<li class="fullwidth">
						<asp:CheckBox ID="ChkShowNavigationBar" runat="server" Checked="true" Text="Show Navigation Bar" OnCheckedChanged="ChkShowNavigationBar_CheckedChanged" AutoPostBack="true" />
					</li>
				</ul>
			</div>
		</div>
	</ContentTemplate>
</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to customize the events calendar UI.
	</p>
</asp:Content>
