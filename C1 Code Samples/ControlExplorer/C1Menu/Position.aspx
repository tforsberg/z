<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Position.aspx.cs" Inherits="ControlExplorer.C1Menu.Position" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
    TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00 {
            overflow: visible;
            overflow-y: visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <input type="button" value="click here" id="btn1" style="width: 70px; height: 28px;" />
    <wijmo:C1Menu runat="server" ID="Menu1" Orientation="Vertical" Trigger="#btn1" TriggerEvent="Click">
        <Items>
            <wijmo:C1MenuItem ID="C1MenuItem1" runat="server" Text="Breaking News">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem2" runat="server" Text="Entertainment">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem3" runat="server" Text="Finance">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem4" runat="server" Text="Food &#38; Cooking">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem5" runat="server" Text="Lifestyle">
                <Items>
                    <wijmo:C1MenuItem ID="C1MenuItem8" runat="server" Text="submenu"></wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem6" runat="server" Text="News">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem7" runat="server" Text="Politics">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem9" runat="server" Text="Sports">
            </wijmo:C1MenuItem>
        </Items>
    </wijmo:C1Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample demonstrates how the <strong>Position</strong> property can be used to determine
	where a menu opens relative to a trigger, such as a button that is clicked to open
	the menu.
    </p>
    <p>The following properties are used in this sample.</p>
    <ul>
        <li><strong>Position</strong> - Where to position the control relative to another document element.  This property is based on the jQuery UI position widget.</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li style="white-space: nowrap;">
                    <label>My:</label>
                    <asp:DropDownList ID="cbxMyHorizontal" runat="server">
                        <asp:ListItem Text="Left" Value="Left" Selected="true" />
                        <asp:ListItem Text="Center" Value="Center" />
                        <asp:ListItem Text="Right" Value="Right" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="cbxMyVertical" runat="server">
                        <asp:ListItem Text="Top" Value="Top" Selected="true" />
                        <asp:ListItem Text="Center" Value="Center" />
                        <asp:ListItem Text="Bottom" Value="Bottom" />
                    </asp:DropDownList>
                </li>
                <li style="white-space: nowrap; clear: left;">
                    <label>At:</label>
                    <asp:DropDownList ID="cbxAtHorizontal" runat="server">
                        <asp:ListItem Text="Left" Value="Left" Selected="true" />
                        <asp:ListItem Text="Center" Value="Center" />
                        <asp:ListItem Text="Right" Value="Right" />
                    </asp:DropDownList>
                    <asp:DropDownList ID="cbxAtVertical" runat="server">
                        <asp:ListItem Text="Top" Value="Top" Selected="true" />
                        <asp:ListItem Text="Center" Value="Center" />
                        <asp:ListItem Text="Bottom" Value="Bottom" />
                    </asp:DropDownList>
                </li>
            </ul>
            <div class="settingcontrol">
                <asp:Button ID="btnApply" Text="Apply" CssClass="settingapply" runat="server" OnClick="btnApply_Click" />
            </div>
        </div>
    </div>
</asp:Content>
