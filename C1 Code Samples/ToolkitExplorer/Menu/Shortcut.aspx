<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Shortcut.aspx.cs" Inherits="Menu_Shortcut" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <ul id="menu1">
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
        </ul>
    </asp:Panel>
    <wijmo:C1MenuExtender ID="MenuExtender1" runat="server" TargetControlID="Panel1" />
    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $(".wijmo-wijmenu-text").parent().bind("click", function () {
                $("#<%=Panel1.ClientID %>").wijmenu("hideAllMenus");
            });
            $(".wijmo-wijmenu-link").hover(function () {
                $(this).addClass("ui-state-hover");
            }, function () {
                $(this).removeClass("ui-state-hover");
            })
        });
    </script>
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="Description" ID="Content3">
<p>This sample demonstrates how to create a menu with shortcut menu items.</p>
</asp:Content>