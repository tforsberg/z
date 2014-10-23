<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Icon.aspx.cs" Inherits="Menu_Icon" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
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
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" TargetControlID="Panel1" />
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
<p>This sample illustrates how to display icons in a <strong>C1MenuExtender </strong>menu item.</p>
<p>To show icons in a menu item, the following properties are used in the menu item object.</p>
<ul>
<li><strong>IconClass</strong> - for specifying css classes which show a image</li>
</ul>
<p>You can also use the <strong>ImagePosition </strong>property along with the 
	<strong>IconClass</strong> to specify the position of the image.</p>
</asp:Content>