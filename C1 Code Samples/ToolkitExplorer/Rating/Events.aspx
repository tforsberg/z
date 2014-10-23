<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Events.aspx.cs" Inherits="ToolkitExplorer.Rating.Events" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Rating" tagprefix="wijmo" %>
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
		<asp:Panel runat="server" ID="ratingDiv"></asp:Panel>
		<wijmo:C1RatingExtender ID="ratingDiv_C1RatingExtender" runat="server" TargetControlID="ratingDiv" Split="2" Value="3" Count="5" OnClientHover="starHover" OnClientRated="starRated">
		</wijmo:C1RatingExtender>
	</div>
&nbsp;<div>hover value is:<label id="hover"></label></div>
	<div>rated value is:<label id="rated"></label></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to use the events of your rating.</p>
</asp:Content>
