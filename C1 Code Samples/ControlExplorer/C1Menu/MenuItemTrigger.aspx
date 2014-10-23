<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="MenuItemTrigger.aspx.cs" Inherits="ControlExplorer.C1Menu.MenuItemTrigger" %>

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
    <wijmo:C1Menu runat="server" ID="Menu1" Orientation="Vertical" Trigger=".wijmo-wijmenu-item" TriggerEvent="Mouseenter">
        <Items>
            <wijmo:C1MenuItem runat="server" Text="Menu1" IconClass="ui-icon ui-icon-arrowthick-1-w"
                ID="MenuItem1">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu2" IconClass="ui-icon ui-icon-arrowrefresh-1-s"
                ID="C1MenuItem01">
                <Items>
                    <wijmo:C1MenuItem ID="C1MenuItem1" runat="server" Text="submenu1">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem8" runat="server" Text="submenu2">
                        <Items>
                            <wijmo:C1MenuItem ID="C1MenuItem2" Text="submenu21" runat="server">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem15" Text="submenu22" runat="server">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem16" Text="submenu23" runat="server">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem17" Text="submenu24" runat="server">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem18" Text="submenu25" runat="server">
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem9" runat="server" Text="submenu3">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem10" runat="server" Text="submenu4">
                        <Items>
                            <wijmo:C1MenuItem ID="C1MenuItem3" runat="server" Text="submenu41">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem19" runat="server" Text="submenu42">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem20" runat="server" Text="submenu43">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem21" runat="server" Text="submenu44">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem22" runat="server" Text="submenu45">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem23" runat="server" Text="submenu46">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem24" runat="server" Text="submenu47">
                            </wijmo:C1MenuItem>
                            <wijmo:C1MenuItem ID="C1MenuItem25" runat="server" Text="submenu48">
                            </wijmo:C1MenuItem>
                        </Items>
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem11" runat="server" Text="submenu5">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem12" runat="server" Text="submenu6">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem13" runat="server" Text="submenu7">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem14" runat="server" Text="submenu8">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu3" IconClass="ui-icon ui-icon-comment"
                ID="C1MenuItem4">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu4" IconClass="ui-icon ui-icon-person"
                ID="C1MenuItem5">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu5" IconClass="ui-icon ui-icon-trash" ID="C1MenuItem6">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu6" IconClass="ui-icon ui-icon-bookmark"
                ID="C1MenuItem7">
                <Items>
                    <wijmo:C1MenuItem ID="C1MenuItem08" runat="server" Text="submenu61">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem26" runat="server" Text="submenu62">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem27" runat="server" Text="submenu63">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem28" runat="server" Text="submenu64">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem29" runat="server" Text="submenu65">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem30" runat="server" Text="submenu66">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem31" runat="server" Text="submenu67">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem32" runat="server" Text="submenu68">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem33" runat="server" Text="submenu69">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu7" IconClass="ui-icon ui-icon-clock" ID="C1MenuItem09">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem runat="server" Text="Menu8" IconClass="ui-icon ui-icon-minusthick"
                ID="C1MenuItem010">
            </wijmo:C1MenuItem>
        </Items>
    </wijmo:C1Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how different trigger events can be used to open a menu item.
		A user can either click, double-click, mouse over, or right-click a menu item to
		open the submenu.
    </p>
    <p>The following properties are used in this sample</p>
    <ul>
        <li>Trigger</li>
        <li>TriggerEvent</li>
    </ul>
    <p>
        <strong>TriggerEvent</strong> can only effect&nbsp; elements that match the selector specified by
            <strong>Trigger </strong>property.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li>
                    <label>Trigger Event:</label>
                    <asp:DropDownList ID="cbxTriggerEvents" runat="server" AutoPostBack="true" OnSelectedIndexChanged="cbxTriggerEvents_SelectedIndexChanged">
                        <asp:ListItem Text="Click" Value="Click" />
                        <asp:ListItem Text="Double Click" Value="Dblclick" />
                        <asp:ListItem Text="Mouse Enter" Value="MouseEnter" Selected="true" />
                        <asp:ListItem Text="Right Click" Value="Rtclick"></asp:ListItem>
                    </asp:DropDownList>
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
