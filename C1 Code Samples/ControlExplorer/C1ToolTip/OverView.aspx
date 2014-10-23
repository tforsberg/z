<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="OverView.aspx.cs" Inherits="ControlExplorer.C1ToolTip.OverView" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1ToolTip" Assembly="C1.Web.Wijmo.Controls.3" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #targetContainer
        {
			height: 445px;
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div id="targetContainer">
                <img src="http://www.fillmurray.com/257/109" style="left: 0; top: 0;" title="Lorem ipsum dolor sit amet"
                    alt="" />
                <img src="http://www.fillmurray.com/257/150" style="left: 0; top: 109px;" title="Consectetur adipiscing elit"
                    alt="" />
                <img src="http://www.fillmurray.com/482/180" style="left: 0; top: 259px;" title="Phasellus fermentum risus sit"
                    alt="" />
                <img src="http://www.fillmurray.com/225/256" style="left: 257px; top: 0;" title="Donec porta iaculis tincidunt"
                    alt="" />
                <img src="http://www.fillmurray.com/111/143" style="left: 482px; top: 0px;" title="Vestibulum enim leo, vulputate eget"
                    alt="" />
                <img src="http://www.fillmurray.com/111/296" style="left: 482px; top: 143px;" title="Pellentesque a lobortis nulla"
                    alt="" />
                <img src="http://www.fillmurray.com/151/200" style="left: 593px; top: 0;" title="Nullam placerat, tortor eu gravida fringilla"
                    alt="" />
                <img src="http://www.fillmurray.com/152/239" style="left: 593px; top: 200px;" title="Maecenas ac felis ac mi vestibulum euismod"
                    alt="" />
    </div>
    <wijmo:C1ToolTip runat="server" ID="ToolTip1" TargetSelector="#targetContainer [title]">
    </wijmo:C1ToolTip>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
        With the <strong>C1Tooltip</strong>, you can easily create custom tooltips to offer your end-users a better user experience. You can control the behavior, the position, the event that shows the tooltip, and more with the <strong>C1Tooltip</strong>. The samples in this section will introduce you to some of these great features.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
