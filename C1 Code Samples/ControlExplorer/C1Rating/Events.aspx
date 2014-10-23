<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ControlExplorer.C1Rating.Events" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Rating" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function starHover(e, args) {
			$("#hover").html(args.value);
		}
		function starRated(e, args) {
			$("#rated").html(args.value);
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div>
		<wijmo:C1Rating ID="C1Rating1" runat="server" Split="2" Value="3" OnClientHover="starHover" OnClientRated="starRated">
		</wijmo:C1Rating></div>
&nbsp;<div>hover value is:<label id="hover"></label></div>
	<div>rated value is:<label id="rated"></label></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to use the events of C1Rating.</p>
</asp:Content>
