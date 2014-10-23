<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Margin.aspx.cs" Inherits="ControlExplorer.C1RadialGauge.Margin" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge"  TagPrefix="Wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="update1" runat="server" UpdateMode="Conditional">
        <ContentTemplate>

        <Wijmo:C1RadialGauge runat="server" ID="Gauge1" Value="100" Max="150" StartAngle="-45"
            SweepAngle="270" Width = "400px" Height = "400px">
            <Cap>
                <PointerCapStyle Stroke="#7F9CAD">
                    <Fill Color="#7F9CAD">
                    </Fill>
                </PointerCapStyle>
            </Cap>
            <TickMajor Factor="2" Visible="True" Interval="10" Offset="15" Position="Inside">
                <TickStyle Stroke="#556A7C">
                    <Fill Color="#556A7C">
                    </Fill>
                </TickStyle>
            </TickMajor>
            <TickMinor Visible="True" Interval="2" Offset="20" Position="Inside">
                <TickStyle Stroke="#556A7C">
                    <Fill Color="#556A7C">
                    </Fill>
                </TickStyle>
            </TickMinor>
            <Pointer Length="1" Width="4" Offset="0.15">
                <PointerStyle Stroke="#BF551C">
                    <Fill Color="#BF551C">
                    </Fill>
                </PointerStyle>
            </Pointer>
            <Labels Offset="-10">
                <LabelStyle Stroke="#556A7C">
                    <Fill Color="#556A7C">
                    </Fill>
                </LabelStyle>
            </Labels>
            <Animation Duration="2000" Easing="EaseOutBack"></Animation>
            <Face>
                <FaceStyle Stroke="#E0E8EF">
                    <Fill Color="#E0E8EF">
                    </Fill>
                </FaceStyle>
            </Face>
        </Wijmo:C1RadialGauge>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
    <asp:UpdatePanel ID="update2" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <label>MarginLeft:</label>
                            <asp:TextBox ID="txLeft" runat="server" Width="100"  Text="0">
                            </asp:TextBox>
                        </li>
                        <li>
                            <label>MarginRight:</label>
                             <asp:TextBox ID="txRight" runat="server" Width="100" Text="0">
                            </asp:TextBox>
                        </li>
                        <li>
                            <label>MarginTop:</label>
                            <asp:TextBox ID="txTop" runat="server" Width="100"  Value="0" >
                            </asp:TextBox>
                        </li>
                        <li>
                            <label>MarginBottom:</label>
                            <asp:TextBox ID="txBottom" runat="server" Width="100"  Value="0"  >
                            </asp:TextBox>
                        </li>
                    </ul>
                </div>
                <div class="settingcontrol">
                        <asp:Button runat="server" OnClick="btnExec_Click" id="btnExec" Text="Apply" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how to use the <b>MarginLeft</b>, <b>MarginTop</b>, <b>MarginRight</b>,
        and <b>MarginBottom</b> properties to set the gauge's margin.</p>
</asp:Content>
