<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="CalloutAnimation.aspx.cs" Inherits="Tooltip_CalloutAnimation" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tooltip" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
 <style type="text/css">
        .boxes
        {
            width: 500px;
            height: 50px;
            margin-top: 100px;
        }
        .boxes div
        {
            width: 100px;
            height: 50px;
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 <wijmo:C1TooltipExtender ID="TooltipExtender1" runat="server" 
                         TargetSelector="#boxes" CloseBehavior="None" >
<Position>
    <my left="Center" top="Bottom" />
    <at left="Center" />

<Offset Left="50"></Offset>
</Position>

<Animation>
<Animated Effect="fade"></Animated>
</Animation>

<ShowAnimation>
<Animated Effect="fade"></Animated>
</ShowAnimation>

<HideAnimation>
<Animated Effect="fade"></Animated>
</HideAnimation>

    </wijmo:C1TooltipExtender>
 <div class="boxes" id="boxes">
                <div>
                </div>
                <div>
                </div>
                <div>
                </div>
                <div>
                </div>
                <div>
                </div>
            </div>
<script id="scriptInit" type="text/javascript">
	$(document).ready(function () {
		//the first show is to create the tooltip element.
		$("#boxes").wijtooltip("show");
		var tooltip = $("#boxes").wijtooltip("widget");
		tooltip.width(500);
		tooltip.height(50);
		$("#boxes").wijtooltip("show");
		var colors = ["red", "blue", "yellow", "black", "green"];
		$("#boxes").wijtooltip("option", "content", colors[2]);
		$("#boxes>div").each(function (i) {
			$(this).css("background-color", colors[i]);
			$(this).bind("click", function () {
				var value = 50 + 100 * i;
				$("#boxes").wijtooltip("option", "content", colors[i]);
				$("#boxes").wijtooltip("option", "position", { offset: value + " 0" });
			});
		});

	});
            
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
    <p>
        This sample shows how to animate the tooltip with the client-side <strong>position</strong> property.</p>
    <p>
        Click one of the colored blocks to move the tooltip.</p>
    <p>
        The following properties are used in this sample.</p>
<ul>
	<li>Position at server side</li>
	<li>CloseBehavior</li>
	<li>position option at client side</li>
</ul>
    <p>
        Setting the <strong>CloseBehavior</strong> to "none" will always keep the tooltip visible.</p>
</asp:Content>
