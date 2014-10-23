<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1Rating.Animation" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Rating" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1Rating ID="C1Rating1" runat="server" Split="2" Value="3" Count="5">
		            <Hint Content="Below Average,Average,Above Average,Awesome,Epic" />
		            <Animation Animated="fade" Duration="500" Easing="Linear" Delay="250" />
	            </wijmo:C1Rating>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel runat="server" UpdateMode="Conditional" ID="update2">
        <ContentTemplate>
        <div class="settingcontainer">
            <div class="settingcontent">
                <ul>
                    <li>
                        <label>Animation Effect</label>
                        <asp:DropDownList ID="effectTypes" runat="server">
		                            <asp:ListItem Value="scroll" Selected="True">Scroll</asp:ListItem>
		                            <asp:ListItem Value="blind">Blind</asp:ListItem>
		                            <asp:ListItem Value="bounce">Bounce</asp:ListItem>
		                            <asp:ListItem Value="clip">Clip</asp:ListItem>
		                            <asp:ListItem Value="drop">Drop</asp:ListItem>
		                            <asp:ListItem Value="explode">Explode</asp:ListItem>
		                            <asp:ListItem Value="fade">Fade</asp:ListItem>
		                            <asp:ListItem Value="fold">Fold</asp:ListItem>
		                            <asp:ListItem Value="highlight">Highlight</asp:ListItem>
		                            <asp:ListItem Value="puff">Puff</asp:ListItem>
		                            <asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
		                            <asp:ListItem Value="scale">Scale</asp:ListItem>
		                            <asp:ListItem Value="shake">Shake</asp:ListItem>
		                            <asp:ListItem Value="size">Size</asp:ListItem>
		                            <asp:ListItem Value="slide">Slide</asp:ListItem>
                            </asp:DropDownList>
                    </li>
                </ul>
            </div>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" runat="server" Text="Apply" OnClick="btnApply_Click" />
            </div>
        </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>This sample demonstrates how to set the animation of C1Rating control. This example uses the <b>Animation</b>  option of rating.</p>

</asp:Content>
