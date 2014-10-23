<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="ClientSideFunctions.aspx.cs" Inherits="ControlExplorer.C1Menu.ClientSideFunctions" %>

<%@ Register Namespace="C1.Web.Wijmo.Controls.C1Menu" Assembly="C1.Web.Wijmo.Controls.3"
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
    <wijmo:C1Menu runat="server" ID="Menu1">
        <Items>
            <wijmo:C1MenuItem ID="C1MenuItem1" runat="server" Text="Menu item">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem2" runat="server" Separator="true">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem3" runat="server" Text="Vertical" Value="DynamicOrientationItem">
                <Items>
                    <wijmo:C1MenuItem ID="C1MenuItem4" runat="server" Text="Menu item">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem5" runat="server" Text="Menu item">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem6" runat="server" Text="Menu item">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem7" runat="server" Text="Menu item">
                    </wijmo:C1MenuItem>
                    <wijmo:C1MenuItem ID="C1MenuItem8" runat="server" Text="Menu item">
                    </wijmo:C1MenuItem>
                </Items>
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem9" runat="server" Text="Menu item">
            </wijmo:C1MenuItem>
            <wijmo:C1MenuItem ID="C1MenuItem10" runat="server" Text="Menu item">
            </wijmo:C1MenuItem>
        </Items>
    </wijmo:C1Menu>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>This sample shows how to add and remove an item from the client side. </p>
    <br />
    <p>The following methods are used in this sample.</p>
    <ul>
        <li>add</li>
        <li>remove</li>
    </ul>
    <p>The add method has the following parameters.</p>
    <ul>
        <li><strong>item
        </strong>
        </li>
        <p>item specifies the markup that will be added to the menu or menu item.  "&lt;a&gt;item&lt;/a&gt;" for menu item, "&lt;h3&gt;head&lt;/h3&gt;" for head item and empty for separator item.</p>
        <li><strong>position
        </strong>
        </li>
        <p>the position to insert at.</p>
    </ul>
    <p>The remove method has the following parameters.</p>
    <ul>
        <li><strong>index
        </strong>
        </li>
        <p>the index of menuitem to be removed.</p>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label class="settinglegend">Remove function</label>
                </li>
                <li>
                    <label for="tbIndex">Index:</label>
                    <input type="text" id="tbIndex" />
                </li>
                <li>
                    <input type="button" value="Remove" onclick="removeItem()" />
                </li>
                <li class="fullwidth">
                    <label class="settinglegend">Add function</label>
                </li>
                <li>
                    <label for="tbItem">Item:</label>
                    <input type="text" id="tbItem" style="margin-bottom:3px;" />
                    <label for="tbAddIndex">Index:</label>
                    <input type="text" id="tbAddIndex" />
                </li>
                <li>
                    <input type="button" value="Add" onclick="add()" />
                </li>
                <li>
                    <asp:Button ID="Button1" runat="server" Text="Button" Visible="false"/>
                </li>
            </ul>
        </div>
    </div>
    <script type="text/javascript">
        function removeItem() {
            var index;
            if ($("#tbIndex").val() !== "" && !isNaN($("#tbIndex").val())) {
                index = parseInt($("#tbIndex").val());
            }

            if (index !== undefined) {
                $("#<%= Menu1.ClientID %>").c1menu("remove", index);
            }
        }

        function add() {
            var index, item;
            item = $("#tbItem").val();
            if ($("#tbAddIndex").val() != "" && !isNaN($("#tbAddIndex").val())) {
                index = parseInt($("#tbAddIndex").val());
            }
            if (index !== undefined) {
                $("#<%= Menu1.ClientID %>").c1menu("add", item, index);
            }
        }
    </script>

</asp:Content>
