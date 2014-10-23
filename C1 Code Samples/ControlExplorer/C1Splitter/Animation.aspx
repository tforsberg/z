<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1Splitter.Animation" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Splitter" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
     <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="update1" UpdateMode="Conditional">
        <ContentTemplate>
        <wijmo:C1Splitter ID="splitter1" Width="600" SplitterDistance="380" ShowExpander="false" Orientation="Vertical" runat="server">
        <ResizeSettings AnimationOptions-Duration="500"></ResizeSettings>
        <Panel2>
            <ContentTemplate>
                <div style="background: #fff; width: 100%; height: 100%;">
                    <img alt="" src="Images/grid.jpg" />
                </div>
            </ContentTemplate>
        </Panel2>
        <Panel1>
            <ContentTemplate>
                    <div style="width: 100%; height: 100%;">
                <img alt="" src="Images/mpic.jpg" />
                </div>
            </ContentTemplate>
        </Panel1>
    </wijmo:C1Splitter>
            </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="update2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth"><h3>Select C1Splitter Animation</h3></li>
                        <li class="fullwidth inlinediv">
                            <label>Ghost</label>
                            <asp:CheckBox runat="server" id="myGhost" />
                        </li>
                        <li class="fullwidth inlinediv"><label>Easing</label>
                            <asp:DropDownList  runat="server" ID="myEasing">
                                    <asp:ListItem Selected="true" Text="Linear" Value="linear"></asp:ListItem>
                                    <asp:ListItem Text="Swing" Value="swing"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutElastic" Value="easeOutElastic"></asp:ListItem>
                                    <asp:ListItem Text="EaseInElastic" Value="easeInElastic"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutElastic" Value="easeInOutElastic"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutBounce" Value="easeOutBounce"></asp:ListItem>
                                    <asp:ListItem Text="EaseInBounce" Value="easeInBounce"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutBounce" Value="easeInOutBounce"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutExpo" Value="easeOutExpo"></asp:ListItem>
                                    <asp:ListItem Text="EaseInExpo" Value="easeInExpo"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutExpo" Value="easeInOutExpo"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutQuad" Value="easeOutQuad"></asp:ListItem>
                                    <asp:ListItem Text="EaseInQuad" Value="easeInQuad"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutQuad" Value="easeInOutQuad"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutSine" Value="easeOutSine"></asp:ListItem>
                                    <asp:ListItem  Text="EaseInSine" Value="easeInSine"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutSine" Value="easeInOutSine"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutCirc" Value="easeOutCirc"></asp:ListItem>
                                    <asp:ListItem Text="EaseInCirc" Value="easeInCirc"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutCirc" Value="easeInOutCirc"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutCubic" Value="easeOutCubic"></asp:ListItem>
                                    <asp:ListItem Text="EaseInCubic" Value="easeInCubic"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutCubic" Value="easeInOutCubic"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutQuint" Value="easeOutQuint"></asp:ListItem>
                                    <asp:ListItem Text="EaseInQuint" Value="easeInQuint"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutQuint" Value="easeInOutQuint"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutBack" Value="easeOutBack"></asp:ListItem>
                                    <asp:ListItem Text="EaseInBack" Value="easeInBack"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutBack" Value="easeInOutBack"></asp:ListItem>
                                    <asp:ListItem Text="EaseOutQuart" Value="easeOutQuart"></asp:ListItem>
                                    <asp:ListItem Text="EaseInQuart" Value="easeInQuart"></asp:ListItem>
                                    <asp:ListItem Text="EaseInOutQuart" Value="easeInOutQuart"></asp:ListItem>
                            </asp:DropDownList>
                        <label>Duration (ms)</label>
                            <asp:TextBox runat="server" Width="100" Text="500" id="myAnimationDuration" />
                        </li>
                        
                    </ul>
                </div>
                <div class="settingcontrol">
                    <asp:Button id="btnApply" OnClick="btnApply_Click" runat="server" Text="Apply"></asp:Button>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        With built-in animation transition options, you can customize how animation effects are transitioned while moving the splitter bar.
    </p>
</asp:Content>
