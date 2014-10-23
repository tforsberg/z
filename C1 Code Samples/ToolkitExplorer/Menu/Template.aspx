<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Template.aspx.cs" Inherits="Menu_Template" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1FormDecorator"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <ul id="wijmenu1">
            <li><a href="#">File</a>
                <ul>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">New</a><span class="wijmo-wijmenu-icon-right">Ctrl+N</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">Open</a><span class="wijmo-wijmenu-icon-right">Ctrl+O</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">Save</a><span class="wijmo-wijmenu-icon-right">Ctrl+S</span>
                        </div>
                    </li>
                </ul>
            </li>
            <li><a href="#">Edit</a>
                <ul>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">Undo</a><span class="wijmo-wijmenu-icon-right">Ctrl+Z</span>
                        </div>
                    </li>
                    <li></li>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">Cut</a><span class="wijmo-wijmenu-icon-right">Ctrl+X</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">Copy</a><span class="wijmo-wijmenu-icon-right">Ctrl+C</span>
                        </div>
                    </li>
                    <li>
                        <div>
                            <a href="#" class="wijmo-wijmenu-text">Paste</a><span class="wijmo-wijmenu-icon-right">Ctrl+V</span>
                        </div>
                    </li>
                </ul>
            </li>
            <li><a href="#">View</a>
                <ul>
                    <li><span>
                        <input id="checkbox1" type="checkbox" /><label for="checkbox1">Status Bar</label>
                    </span></li>
                    <li><span>
                        <input id="checkbox2" type="checkbox" /><label for="checkbox2">Side Bar</label>
                    </span></li>
                    <li></li>
                    <li><a href="#">Character Encoding</a>
                        <ul>
                            <li><span>
                                <input type="radio" name="radiobutton1" id="radio1" /><label for="radio1">Western (ISO-8859-1)</label>
                            </span></li>
                            <li><span>
                                <input type="radio" name="radiobutton1" id="radio2" /><label for="radio2">Unicode (UTF-8)</label>
                            </span></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" TargetControlID="Panel1" />
    <wijmo:C1CheckboxExtender ID="CheckboxExtender1" runat="server" TargetSelector=":input[type='checkbox']" />
    <wijmo:C1RadioExtender ID="RadioExtender1" runat="server" TargetSelector=":input[type='radio']" />
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $(".wijmo-wijmenu-text").parent().bind("click", function () {
                $("#<%=Panel1.ClientID %>").wijmenu("hideAllMenus");
            }).hover(function () {
                $(this).addClass("ui-state-hover");
            }, function () {
                $(this).removeClass("ui-state-hover");
            })
        });
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
	<p>You can provide rich content for menu items using menu item templates.  This sample provides a template with menus, shortcut menu items, radio buttons, 
		and check boxes.</p>
</asp:Content>