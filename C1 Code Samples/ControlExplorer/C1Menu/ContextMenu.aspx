<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="ContextMenu.aspx.cs" Inherits="ControlExplorer.C1Menu.ContextMenu" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00 {
            overflow: visible;
            overflow-y: visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:TextBox ID="TextBox1" Text="Click here to show the context menu." Width="260px" Height="25px" runat="server"></asp:TextBox>
    <wijmo:C1Menu runat="server" ID="Menu1" Orientation="Vertical" TriggerEvent="Click">
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
        This sample shows how different trigger events can be used to open a menu. A user
                can either click, double-click, mouse over, or right-click to open the menu.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
        <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Trigger Event:</label>
                    <asp:DropDownList ID="cbxTriggerEvents" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbxTriggerEvents_SelectedIndexChanged">
                        <asp:ListItem Text="Click" Value="Click" Selected="true" />
                        <asp:ListItem Text="Double Click" Value="Dblclick" />
                        <asp:ListItem Text="Mouse Enter" Value="MouseEnter" />
                        <asp:ListItem Text="Right Click" Value="Rtclick"></asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
