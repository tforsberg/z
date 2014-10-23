<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="InputDate_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	<asp:TextBox ID="TextBox1" runat="server" Width="220px"></asp:TextBox>
	<asp:Label ID="Label1" runat="server" Text="dateFormat='T' (Long time pattern)"></asp:Label>
	<wijmo:C1InputDateExtender ID="InputDateExtender1" runat="server" TargetControlID="TextBox1" DateFormat="T" />
	</asp:Panel>

	<asp:Panel ID="Panel2" runat="server">
	<asp:TextBox ID="TextBox2" runat="server" Width="220px"></asp:TextBox>
	<asp:Label ID="Label2" runat="server" Text="dateFormat='d' (Short date pattern)"></asp:Label>
	<wijmo:C1InputDateExtender ID="InputDateExtender2" runat="server" TargetControlID="TextBox2" DateFormat="d" />
	</asp:Panel>

	<asp:Panel ID="Panel3" runat="server">
	<asp:TextBox ID="TextBox3" runat="server" Width="220px"></asp:TextBox>
	<asp:Label ID="Label3" runat="server" Text="dateFormat='g' (General Date & Short Time)"></asp:Label>
	<wijmo:C1InputDateExtender ID="InputDateExtender3" runat="server" TargetControlID="TextBox3" DateFormat="g" />
	</asp:Panel>
	
	<asp:Panel ID="Panel4" runat="server">
	<asp:TextBox ID="TextBox4" runat="server" Width="360px"></asp:TextBox>
	<asp:Label ID="Label4" runat="server" Text="dateFormat='U' (Universal Date & Long Time)"></asp:Label>
	<wijmo:C1InputDateExtender ID="InputDateExtender4" runat="server" TargetControlID="TextBox4" DateFormat="U" />
	</asp:Panel>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The C1InputDateExtender converts an ASP.NET TextBox control into a date/time input tool.</p>
	<p>
	The C1InputDateExtender also supports the variant date/time format, which is determined by the <b>DateFormat</b> property.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
