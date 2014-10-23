<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientMode.aspx.cs" Inherits="ControlExplorer.C1Menu.ClientMode" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00
        {
            overflow: visible;
            overflow-y: visible;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<wijmo:C1Menu runat="server" ID="Menu1" Orientation="Horizontal">
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

    <script type="text/javascript">
        $(document).ready(function () {
            $(":radio").click(function () {
                var menu = $("#<%= Menu1.ClientID %>");
                if (this.id == "rdHorizontal") {
                    menu.c1menu("option", "orientation", "horizontal");
                }
                else if (this.id == "rdVertical") {
                    menu.c1menu("option", "orientation", "vertical");
                }
            })
        })
</script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This sample shows how to modify menu bar's client option with scripts.</p>
<p>The following options are used in this samples:</p>
<ul>
<li>orientation</li>
</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<label>Orientation</label>
<p><input type="radio" id="rdHorizontal" name="rdOrientation" /><label>Horizontal</label>
<input type="radio" id="rdVertical" name="rdOrientation" /><label>Vertical</label>
</p>
</asp:Content>
