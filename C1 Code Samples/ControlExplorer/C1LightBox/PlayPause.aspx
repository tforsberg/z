<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="PlayPause.aspx.cs" Inherits="ControlExplorer.C1LightBox.PlayPause" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Img" ShowTimer="true" CtrlButtons="Play, Stop"
        Loop="false">
        <Items>
            <wijmo:C1LightBoxItem ID="LightBoxItem1" Title="Sport1" Text="Sport1" ImageUrl="http://lorempixum.com/120/90/sports/1"
                LinkUrl="http://lorempixum.com/600/400/sports/1" />
            <wijmo:C1LightBoxItem ID="LightBoxItem2" Title="Sport2" Text="Sport2" ImageUrl="http://lorempixum.com/120/90/sports/2"
                LinkUrl="http://lorempixum.com/600/400/sports/2" />
            <wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Sport3" Text="Sport3" ImageUrl="http://lorempixum.com/120/90/sports/3"
                LinkUrl="http://lorempixum.com/600/400/sports/3" />
            <wijmo:C1LightBoxItem ID="C1LightBoxItem4" Title="Sport4" Text="Sport4" ImageUrl="http://lorempixum.com/120/90/sports/4"
                LinkUrl="http://lorempixum.com/600/400/sports/4" />
        </Items>
    </wijmo:C1LightBox>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to display control buttons in <strong>C1LightBox</strong>.
    </p>
    <p>
        The <b>CtrlButtons</b> property determines the visibility of control buttons; it is a flag enum property with the following possible values:
    </p>
    <ul>
        <li>None - No control buttons are displayed.</li>
        <li>Play - Displays the Play button.</li>
        <li>Stop - Displays the Stop button.</li>
    </ul>
    <p>
        LightBox displays pages in order after clicking the Play button. To play
        automatically after initializing, set the <b>AutoPlay</b>
        property to True.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
