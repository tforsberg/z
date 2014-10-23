<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Tooltip_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tooltip" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <style type="text/css">
        #targetContainer
        {
            position: relative;
        }
        #targetContainer img
        {
            margin: 0;
            padding: 0;
            position: absolute;
            border: solid 3px #333;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
<div id="targetContainer">
                <img src="http://placekitten.com/g/257/109" style="left: 0; top: 0;" title="KITTY HAS REACHED CRITICAL MASS" alt="" />
                <img src="http://placekitten.com/g/257/150" style="left: 0; top: 109px;" title="You eated my cookie?" alt=""  />
                <img src="http://placekitten.com/482/180" style="left: 0; top: 259px;" title="O Hay Guys" alt=""  />
                <img src="http://placekitten.com/g/225/256" style="left: 257px; top: 0;" title="You can't see me, I'm invisible" alt=""  />
                <img src="http://placekitten.com/111/143" style="left: 482px; top: 0px;" title="It's Caturday?" alt=""  />
                <img src="http://placekitten.com/g/111/296" style="left: 482px; top: 143px;" title="placeakitten.com" alt=""  />
                <img src="http://placekitten.com/g/151/200" style="left: 593px; top: 0;" title="I'm on ur internets" alt="" />
                <img src="http://placekitten.com/152/239" style="left: 593px; top: 200px;" title="I big scary monster" alt=""  />
                
                <wijmo:C1TooltipExtender ID="TooltipExtender1" runat="server" 
                         TargetSelector="[title]" >
                </wijmo:C1TooltipExtender>
                    
            </div>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
<p>With the <strong>C1TooltipExtender</strong>, you can easily create custom tooltips to offer your end-users a better user experience. You can control the behavior, the position, the event that shows the tooltip, and more with <strong>C1TooltipExtender</strong>. The samples in this section will introduce you to some of these great features.</p>
</asp:Content>
