<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ToolkitExplorer.Rating.Animation" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Rating" tagprefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<script type="text/javascript">
		function changeAnimation() {
			var val = $("#effectTypes").val();
			$("#<%=ratingDiv_C1RatingExtender.ClientID %>").wijrating({ animation: {
				animated: val
			}
			});
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
		<asp:Panel runat="server" ID="ratingDiv"></asp:Panel>
		<wijmo:C1RatingExtender ID="ratingDiv_C1RatingExtender" runat="server" TargetControlID="ratingDiv" Split="2" Value="3" Count="5">
			<Hint Content="Below Average,Average,Above Average,Awesome,Epic" />
			<Animation Animated="fade" Duration="500" Easing="Linear" Delay="250" />
		</wijmo:C1RatingExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
	<select id="effectTypes" name="effects">
		<option value="scroll">Scroll</option>
		<option value="blind">Blind</option>
		<option value="bounce">Bounce</option>
		<option value="clip">Clip</option>
		<option value="drop">Drop</option>
		<option value="explode">Explode</option>
		<option value="fade">Fade</option>
		<option value="fold">Fold</option>
		<option value="highlight">Highlight</option>
		<option value="puff">Puff</option>
		<option value="pulsate">Pulsate</option>
		<option value="scale">Scale</option>
		<option value="shake">Shake</option>
		<option value="size">Size</option>
		<option value="slide">Slide</option>
	</select>
	<input id="apply" type="button" onclick="changeAnimation()" value="apply" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how to set the animation of your C1Rating extender. This example uses the <b>Animation</b>  option of the rating.</p>

</asp:Content>
