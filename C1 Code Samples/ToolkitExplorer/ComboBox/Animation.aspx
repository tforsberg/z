<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Animation.aspx.cs" Inherits="ComboBox_Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
	<script id="scriptInit" type="text/javascript">
		function changeProperties() {
			var showingSpeed, hidingSpeed, expandingSpeed, collapsingSpeed;
			showingSpeed = parseNumberFromString($('#showingSpeed').val());
			hidingSpeed = parseNumberFromString($('#hidingSpeed').val());
			var showEffect = $('#showingEffectTypes').get(0).value;
			var hideEffect = $('#hidingEffectTypes').get(0).value;
			showEffect = showEffect == "none" ? false : showEffect;
			hideEffect = hideEffect == "none" ? false : hideEffect;
			var showingAnimation = {
				effect: showEffect,
				options: null,
				speed: showingSpeed
			};
			var hidingAnimation = {
				effect: hideEffect,
				options: null,
				speed: hidingSpeed
			};
			var wij = $('#<%=TextBox1.ClientID %>');
			wij.wijcombobox('option', 'showingAnimation', showingAnimation);
			wij.wijcombobox('option', 'hidingAnimation', hidingAnimation);
		}
		function parseNumberFromString(st) {
			var i = 1000;
			try {
				i = parseInt(st);
			}
			catch (e) {
				alert(e);
			}
			return i;
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
		<style type ="text/css">
			.ui-effects-explode
			{
				z-index:99999;
			}
		</style>
	<div>
		<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
		<wijmo:C1ComboBoxExtender ID="ComboBoxExtender2" runat="server" TargetControlID="TextBox1">
			<ShowingAnimation Duration="1000">
				<Animated Effect="Scale" />
			</ShowingAnimation>
			<HidingAnimation Duration="1000">
			<Animated Effect="explode" />
				</HidingAnimation>
			<Data>
				<Items>
					<wijmo:C1ComboBoxItem Label="c++" Value="c++" />
					<wijmo:C1ComboBoxItem Label="java" Value="java" />
					<wijmo:C1ComboBoxItem Label="php" Value="php" />
					<wijmo:C1ComboBoxItem Label="coldfusion" Value="coldfusion" />
					<wijmo:C1ComboBoxItem Label="javascript" Value="javascript" />
					<wijmo:C1ComboBoxItem Label="asp" Value="asp" />
					<wijmo:C1ComboBoxItem Label="ruby" Value="ruby" />
					<wijmo:C1ComboBoxItem Label="python" Value="python" />
					<wijmo:C1ComboBoxItem Label="c" Value="c" />
					<wijmo:C1ComboBoxItem Label="scala" Value="scala" />
					<wijmo:C1ComboBoxItem Label="groovy" Value="groovy" />
					<wijmo:C1ComboBoxItem Label="haskell" Value="haskell" />
					<wijmo:C1ComboBoxItem Label="perl" Value="perl" />
				</Items>
			</Data>
		</wijmo:C1ComboBoxExtender>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The C1ComboBoxExtender supports showing and hiding animation setting at client.
	</p>
	<p>
		Showing and hiding animation is allowed if the following properties are set to corresponding values:
	</p>
	<ul>
	<li><strong>ShowingAnimation </strong>- takes effect when the drop-down list is 
		visible.</li>
	<li><strong>HidingAnimation </strong>- takes effect when the drop-down list is 
		hidden.</li>
	</ul>
	<p> 
		Animation options include speed and effect.
	</p>
	<p>
		End-users can observe the animation effect once the showingAnimation and hidingAnimation are set.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="demo-options">
		<!-- Begin options markup -->
		<div class="option-row">
			<label for="showingSpeed">
				Showing Speed
			</label>
			<input id="showingSpeed" type="text" value="1000" onblur="changeProperties()" />
		</div>
		<div class="option-row">
			<label for="showingEffectTypes">
				Showing Effect
			</label>
			<select id="showingEffectTypes" name="effects" onchange="changeProperties()">
				<option value="none">none</option>
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
		</div>
		<div class="option-row">
			<label for="hidingSpeed">
				Hiding Speed
			</label>
			<input id="hidingSpeed" type="text" value="1000" onblur="changeProperties()" />
		</div>
		<div class="option-row">
			<label for="hidingEffectTypes">
				Hiding Effect
			</label>
			<select id="hidingEffectTypes" name="effects" onchange="changeProperties()">
				<option value="none">none</option>
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
		</div>
		<!-- End options markup -->
	</div>
</asp:Content>
