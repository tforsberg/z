<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1TreeView.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <wijmo:C1TreeView ID="C1TreeView1" runat="server">
                <ExpandAnimation Option=""></ExpandAnimation>
                <CollapseAnimation Option="" Duration="500" Easing="EaseInOutBounce">
                    <Animated Effect="fade" />
                </CollapseAnimation>
                <Nodes>
                    <wijmo:C1TreeViewNode Text="Folder 1">
                        <Nodes>
                            <wijmo:C1TreeViewNode Text="Folder 1.1">
                                <Nodes>
                                    <wijmo:C1TreeViewNode Text="Folder 1.1.1">
                                    </wijmo:C1TreeViewNode>
                                    <wijmo:C1TreeViewNode Text="Folder 1.1.2">
                                    </wijmo:C1TreeViewNode>
                                    <wijmo:C1TreeViewNode Text="Folder 1.1.3">
                                    </wijmo:C1TreeViewNode>
                                    <wijmo:C1TreeViewNode Text="Folder 1.1.4">
                                    </wijmo:C1TreeViewNode>
                                </Nodes>
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.2">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.3">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.4">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.5">
                            </wijmo:C1TreeViewNode>
                        </Nodes>
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 2">
                        <Nodes>
                            <wijmo:C1TreeViewNode Text="Folder 2.1">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 2.2">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 2.3">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 2.4">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 2.5">
                            </wijmo:C1TreeViewNode>
                        </Nodes>
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 3">
                        <Nodes>
                            <wijmo:C1TreeViewNode Text="Folder 3.1">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 3.2">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 3.3">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 3.4">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 3.5">
                            </wijmo:C1TreeViewNode>
                        </Nodes>
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        You can add and expand animations by setting the <strong>ExpandAnimation</strong> property, and you can add a collapse animations by setting the <strong>CollapseAnimation</strong> property.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth">
                            <label class="settinglegend">Expand Animation:</label></li>
                        <li>
                            <asp:CheckBox ID="expandAnimationDisabled" Text="Disabled" runat="server" /></li>
                        <li>
                            <label>Effect:</label>
                            <asp:DropDownList ID="expandAnimationEffect" runat="server">
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
                                <asp:ListItem Value="transfer">Transfer</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>Duration: </label>
                            <asp:DropDownList ID="expandDuration" runat="server">
                                <asp:ListItem>200</asp:ListItem>
                                <asp:ListItem>400</asp:ListItem>
                                <asp:ListItem>800</asp:ListItem>
                                <asp:ListItem>1500</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>Easing: </label>
                            <asp:DropDownList ID="expandEasing" runat="server">
                                <asp:ListItem>Linear</asp:ListItem>
                                <asp:ListItem>Swing</asp:ListItem>
                                <asp:ListItem>EaseInQuad</asp:ListItem>
                                <asp:ListItem>EaseOutQuad</asp:ListItem>
                                <asp:ListItem>EaseInOutQuad</asp:ListItem>
                                <asp:ListItem>EaseInCubic</asp:ListItem>
                                <asp:ListItem>EaseOutCubic</asp:ListItem>
                                <asp:ListItem>EaseInOutCubic</asp:ListItem>
                                <asp:ListItem>EaseInQuart</asp:ListItem>
                                <asp:ListItem>EaseOutQuart</asp:ListItem>
                                <asp:ListItem>EaseInOutQuart</asp:ListItem>
                                <asp:ListItem>EaseInQuint</asp:ListItem>
                                <asp:ListItem>EaseOutQuint</asp:ListItem>
                                <asp:ListItem>EaseInOutQuint</asp:ListItem>
                                <asp:ListItem>EaseInSine</asp:ListItem>
                                <asp:ListItem>EaseOutSine</asp:ListItem>
                                <asp:ListItem>EaseInOutSine</asp:ListItem>
                                <asp:ListItem>EaseInExpo</asp:ListItem>
                                <asp:ListItem>EaseOutExpo</asp:ListItem>
                                <asp:ListItem>EaseInOutExpo</asp:ListItem>
                                <asp:ListItem>EaseInCirc</asp:ListItem>
                                <asp:ListItem>EaseOutCirc</asp:ListItem>
                                <asp:ListItem>EaseInOutCirc</asp:ListItem>
                                <asp:ListItem>EaseInElastic</asp:ListItem>
                                <asp:ListItem>EaseOutElastic</asp:ListItem>
                                <asp:ListItem>EaseInOutElastic</asp:ListItem>
                                <asp:ListItem>EaseInBack</asp:ListItem>
                                <asp:ListItem>EaseOutBack</asp:ListItem>
                                <asp:ListItem>EaseInOutBack</asp:ListItem>
                                <asp:ListItem>EaseInBounce</asp:ListItem>
                                <asp:ListItem>EaseOutBounce</asp:ListItem>
                                <asp:ListItem>EaseInOutBounce</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li class="fullwidth">
                            <label class="settinglegend">Collapse Animation:</label></li>
                        <li>
                            <asp:CheckBox ID="collapseAnimationDisabled" Text="Disabled" runat="server" /></li>
                        <li>
                            <label>Effect: </label>
                            <asp:DropDownList ID="collapseAnimationEffect" runat="server">
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
                                <asp:ListItem Value="transfer">Transfer</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>Duration: </label>
                            <asp:DropDownList ID="collapseDuration" runat="server">
                                <asp:ListItem>200</asp:ListItem>
                                <asp:ListItem>400</asp:ListItem>
                                <asp:ListItem>800</asp:ListItem>
                                <asp:ListItem>1500</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                        <li>
                            <label>Easing: </label>
                            <asp:DropDownList ID="collapseEasing" runat="server">
                                <asp:ListItem>Linear</asp:ListItem>
                                <asp:ListItem>Swing</asp:ListItem>
                                <asp:ListItem>EaseInQuad</asp:ListItem>
                                <asp:ListItem>EaseOutQuad</asp:ListItem>
                                <asp:ListItem>EaseInOutQuad</asp:ListItem>
                                <asp:ListItem>EaseInCubic</asp:ListItem>
                                <asp:ListItem>EaseOutCubic</asp:ListItem>
                                <asp:ListItem>EaseInOutCubic</asp:ListItem>
                                <asp:ListItem>EaseInQuart</asp:ListItem>
                                <asp:ListItem>EaseOutQuart</asp:ListItem>
                                <asp:ListItem>EaseInOutQuart</asp:ListItem>
                                <asp:ListItem>EaseInQuint</asp:ListItem>
                                <asp:ListItem>EaseOutQuint</asp:ListItem>
                                <asp:ListItem>EaseInOutQuint</asp:ListItem>
                                <asp:ListItem>EaseInSine</asp:ListItem>
                                <asp:ListItem>EaseOutSine</asp:ListItem>
                                <asp:ListItem>EaseInOutSine</asp:ListItem>
                                <asp:ListItem>EaseInExpo</asp:ListItem>
                                <asp:ListItem>EaseOutExpo</asp:ListItem>
                                <asp:ListItem>EaseInOutExpo</asp:ListItem>
                                <asp:ListItem>EaseInCirc</asp:ListItem>
                                <asp:ListItem>EaseOutCirc</asp:ListItem>
                                <asp:ListItem>EaseInOutCirc</asp:ListItem>
                                <asp:ListItem>EaseInElastic</asp:ListItem>
                                <asp:ListItem>EaseOutElastic</asp:ListItem>
                                <asp:ListItem>EaseInOutElastic</asp:ListItem>
                                <asp:ListItem>EaseInBack</asp:ListItem>
                                <asp:ListItem>EaseOutBack</asp:ListItem>
                                <asp:ListItem>EaseInOutBack</asp:ListItem>
                                <asp:ListItem>EaseInBounce</asp:ListItem>
                                <asp:ListItem>EaseOutBounce</asp:ListItem>
                                <asp:ListItem>EaseInOutBounce</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
                <div class="settingcontrol">
                    <asp:Button ID="apply" runat="server" Text="Apply" CssClass="settingapply" OnClick="apply_Click" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
