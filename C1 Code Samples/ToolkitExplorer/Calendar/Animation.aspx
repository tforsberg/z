<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Animation.aspx.cs" Inherits="Calendar_Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Calendar" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

	<asp:Panel ID="Panel1" runat="server">
	</asp:Panel>

	<wijmo:C1CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="Panel1" />

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>
Variant animation effects are allowed when navigating between months.
</p>

<p>
Animation effects are determined by the following properties:
</p>

<ul>
<li>Direction</li>
<li>Duration</li>
<li>Easing</li>
</ul>

<p>
Setting the <b>Duration</b> property to 0 would disable the animation effects.
</p>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <!-- Begin options markup -->
	<div class="option-row">
		<label for="direction">
			Direction</label>
		<select name="direction" id="direction">
			<option value="horizontal" selected="selected">Horizontal</option>
			<option value="vertical">Vertical</option>
		</select>
	</div>
	<div class="option-row">
		<label for="easing">
			Easing</label>
		<select name="easing" id="easing">
			<option value="swing">swing</option>
			<option value="linear">linear</option>
			<option value="easeInQuad" selected="selected">easeInQuad</option>
			<option value="easeOutQuad">easeOutQuad</option>
			<option value="easeInOutQuad">easeInOutQuad</option>
			<option value="easeInCubic">easeInCubic</option>
			<option value="easeOutCubic">easeOutCubic</option>
			<option value="easeInOutCubic">easeInOutCubic</option>
			<option value="easeInQuart">easeInQuart</option>
			<option value="easeOutQuart">easeOutQuart</option>
			<option value="easeInOutQuart">easeInOutQuart</option>
			<option value="easeInQuint">easeInQuint</option>
			<option value="easeOutQuint">easeOutQuint</option>
			<option value="easeInOutQuint">easeInOutQuint</option>
			<option value="easeInSine">easeInSine</option>
			<option value="easeOutSine">easeOutSine</option>
			<option value="easeInOutSine">easeInOutSine</option>
			<option value="easeInExpo">easeInExpo</option>
			<option value="easeOutExpo">easeOutExpo</option>
			<option value="easeInOutExpo">easeInOutExpo</option>
			<option value="easeInCirc">easeInCirc</option>
			<option value="easeOutCirc">easeOutCirc</option>
			<option value="easeInOutCirc">easeInOutCirc</option>
			<option value="easeInElastic">easeInElastic</option>
			<option value="easeOutElastic">easeOutElastic</option>
			<option value="easeInOutElastic">easeInOutElastic</option>
			<option value="easeInBack">easeInBack</option>
			<option value="easeOutBack">easeOutBack</option>
			<option value="easeInOutBack">easeInOutBack</option>
			<option value="easeInBounce">easeInBounce</option>
			<option value="easeOutBounce">easeOutBounce</option>
			<option value="easeInOutBounce">easeInOutBounce</option>
		</select>
	</div>
	<div class="option-row">
		<label for="duration">
			Duration</label>
		<input name="x" type="text" id="duration" style="width: 40px;" value="250" />
	</div>
	<!-- End options markup -->

    <script type="text/javascript">
        $(function () {
            $('#direction').bind("change keyup", function () {
                $('#<%=Panel1.ClientID %>').wijcalendar("option", { direction: $(this).val() });
            });

            $('#duration').bind("blur", function () {
                try {
                    var duration = parseInt($(this).val());
                    if (duration < 0) alert("Invalid duration");
                    else {
                        $('#<%=Panel1.ClientID %>').wijcalendar("option", { duration: duration });
                    }
                }
                catch (e) {
                }
            });

            $('#easing').bind("change keyup", function () {
                $('#<%=Panel1.ClientID %>').wijcalendar("option", { easing: $(this).val() });
            });
        });
	</script>

</asp:Content>