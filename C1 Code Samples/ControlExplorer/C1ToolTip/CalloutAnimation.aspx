<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CalloutAnimation.aspx.cs" Inherits="ControlExplorer.C1ToolTip.CalloutAnimation" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
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
    <wijmo:C1ToolTip runat="server" ID="Tooltip1" TargetSelector="#boxes" CloseBehavior="None">
        <Position>
            <My Top="Bottom" Left="Center"></My>
            <At Left="Center"></At>
            <Offset Left="50" />
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
    </wijmo:C1ToolTip>
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            //the first show is to create the tooltip element.
            $("#boxes").c1tooltip("show");
            var tooltip = $("#boxes").c1tooltip("widget");
            tooltip.width(500);
            tooltip.height(50);
            $("#boxes").c1tooltip("show");
            var colors = ["red", "blue", "yellow", "black", "green"];
            $("#boxes").c1tooltip("option", "content", colors[2]);
            $("#boxes>div").each(function (i) {
                $(this).css("background-color", colors[i]);
                $(this).bind("click", function () {
                    var value = 50 + 100 * i;
                    $("#boxes").c1tooltip("option", "content", colors[i]);
                    $("#boxes").c1tooltip("option", "position", { offset: value + " 0" });
                });
            });

        });
            
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
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
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
