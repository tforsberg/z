<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Orientation.aspx.cs" Inherits="ControlExplorer.C1LinearGauge.GaugeOrientation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gauge" TagPrefix="Wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <Wijmo:C1LinearGauge runat="server" ID="Gauge1" Value="50" Width="310" Height="70">
                <tickmajor position="Inside" interval="20" factor="3">
                    <TickStyle Fill-Color="#1E395B"></TickStyle>
                </tickmajor>
                <tickminor position="Inside" interval="4" visible="true">
                    <TickStyle Fill-Color="#1E395B"></TickStyle>
                </tickminor>
                <pointer shape="Rect" length="0.5">
                    <PointerStyle Fill-Color="#1E395B" Stroke="#1E395B"></PointerStyle>
                </pointer>
                <face>
                    <FaceStyle Stroke="#7BA0CC" StrokeWidth="4"></FaceStyle>
                </face>
                <labels visible="true">
                    <LabelStyle Fill-Color="#1E395B" FontSize="12" FontWeight="800" />
                </labels>
            </Wijmo:C1LinearGauge>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li>
                            <label>Orientation:</label>
                            <asp:DropDownList ID="cbxOrientation" AutoPostBack="true" runat="server" OnSelectedIndexChanged="cbxOrientation_SelectedIndexChanged">
                                <asp:ListItem Value="Horizontal" Selected="true">Horizontal</asp:ListItem>
                                <asp:ListItem Value="Vertical">Vertical</asp:ListItem>
                            </asp:DropDownList>
                        </li>
                    </ul>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the horizontal and vertical orientations of <strong>C1LinearGauge</strong>. Set the <b>Orientation</b> property 
to Horizontal or Vertical to control the gauge's appearance.
    </p>

</asp:Content>
