﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="MenuitemTrigger.aspx.cs" Inherits="ControlExplorer.Menu.MenuitemTrigger" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Panel ID="Panel1" runat="server">
        <ul id="menu1">
            <li><a><span class="ui-icon ui-icon-arrowthick-1-w wijmo-wijmenu-icon-left"></span><span
                class="wijmo-wijmenu-text">Menu1</span></a></li>
            <li><a><span class="ui-icon ui-icon-arrowrefresh-1-s wijmo-wijmenu-icon-left"></span>
                <span class="wijmo-wijmenu-text">Menu2</span></a>
                <ul>
                    <li><a>submenu1</a></li>
                    <li><a>submenu2</a>
                        <ul>
                            <li><a>submenu21</a></li>
                            <li><a>submenu22</a></li>
                            <li><a>submenu23</a></li>
                            <li><a>submenu24</a></li>
                            <li><a>submenu25</a></li>
                        </ul>
                    </li>
                    <li><a>submenu3</a></li>
                    <li><a>submenu4</a>
                        <ul>
                            <li><a>submenu41</a></li>
                            <li><a>submenu42</a></li>
                            <li><a>submenu43</a></li>
                            <li><a>submenu44</a></li>
                            <li><a>submenu45</a></li>
                            <li><a>submenu46</a></li>
                            <li><a>submenu47</a></li>
                            <li><a>submenu48</a></li>
                        </ul>
                    </li>
                    <li><a>submenu5</a></li>
                    <li><a>submenu6</a></li>
                    <li><a>submenu7</a></li>
                    <li><a>submenu8</a></li>
                </ul>
            </li>
            <li><a><span class="ui-icon ui-icon-comment wijmo-wijmenu-icon-left"></span><span
                class="wijmo-wijmenu-text">Menu3</span></a></li>
            <li><a><span class="ui-icon ui-icon-person wijmo-wijmenu-icon-left"></span><span
                class="wijmo-wijmenu-text">Menu4</span></a></li>
            <li><a><span class="ui-icon ui-icon-trash wijmo-wijmenu-icon-left"></span><span class="wijmo-wijmenu-text">
                Menu5</span></a></li>
            <li><a><span class="ui-icon ui-icon-bookmark wijmo-wijmenu-icon-left"></span><span
                class="wijmo-wijmenu-text">Menu6</span></a>
                <ul>
                    <li><a>submenu61</a></li>
                    <li><a>submenu62</a></li>
                    <li><a>submenu63</a></li>
                    <li><a>submenu64</a></li>
                    <li><a>submenu65</a></li>
                    <li><a>submenu66</a></li>
                    <li><a>submenu67</a></li>
                    <li><a>submenu68</a></li>
                    <li><a>submenu69</a></li>
                </ul>
            </li>
            <li><a><span class="ui-icon ui-icon-clock wijmo-wijmenu-icon-left"></span><span class="wijmo-wijmenu-text">
                Menu7</span></a></li>
            <li><a><span class="ui-icon ui-icon-minusthick wijmo-wijmenu-icon-left"></span><span
                class="wijmo-wijmenu-text">Menu8</span></a></li>
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" Trigger=".wijmo-wijmenu-item"
        TriggerEvent="Mouseenter" Orientation="Vertical" TargetControlID="Panel1" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how different trigger events can be used to open a menu item.
		A user can either click, double-click, mouse over or right-click a menu item to
		open the submenu.</p>
		<p>The following properties are used in this sample</p>
		<ul>
		<li>Trigger</li>
		<li>TriggerEvent</li>
		</ul>
		<p>TriggerEvent can only take effect on those elements which match the selector specified by Trigger property.
		</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
        <!-- Begin options markup -->
        <label>
            TriggerEvent</label><select id="triggerEvent">
                <option value="click">click</option>
                <option value="dblclick">dblclick</option>
                <option value="mouseenter" selected="selected">mouse enter</option>
                <option value="rtclick">right click</option>
            </select>
        <!-- End options markup -->
    
<script type="text/javascript">
    $(document).ready(function () {
        $("#triggerEvent").change(function () {
            var triggerEvent = $(this).val();
            $("#<%=Panel1.ClientID %>").wijmenu("option", "triggerEvent", triggerEvent);
        });
    });
    </script>
   <%-- <label>
        TriggerEvent</label>
        
    <asp:DropDownList ID="triggerEvent" runat="server" AutoPostBack="true" 
        onselectedindexchanged="triggerEvent_SelectedIndexChanged">
    <asp:ListItem Value="click" Text="click"></asp:ListItem>
    <asp:ListItem Value="dblclick" Text="dblclick"></asp:ListItem>
    <asp:ListItem Value="mouseenter" Text="mouseenter" Selected="True"></asp:ListItem>
    <asp:ListItem Value="rtclick" Text="rtclick"></asp:ListItem>
    </asp:DropDownList>--%>
</asp:Content>
