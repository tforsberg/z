<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" Inherits="Pager_PagedTable" Codebehind="PagedTable.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Pager" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
    <script type="text/javascript">
        var $rows, $pager,
            pageSize = 5;

        function pageLoad() {
            $rows = $("table[id$=\"C1GridView1\"] >tbody >tr.dataRowMarker");
            $pager = $("div[id$=\"PagerPanel1\"]");
            $pager.wijpager("option", "pageCount", Math.ceil($rows.length / pageSize) || 1);
            pageIndexChanged();
        }

        function pageIndexChanged() {
            var pageIndex = $pager.wijpager("option", "pageIndex");
            var showFrom = pageIndex * pageSize;
            var showTo = showFrom + pageSize;

            $.each($rows, function (index, tr) {
                if (index >= showFrom && index < showTo) {
                    $(tr).show();
                } else {
                    $(tr).hide();
                }
            });
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager runat="server" ID="ScriptManager1"></asp:ScriptManager>
    
    <wijmo:C1PagerExtender ID="PagerExtender1" runat="server" TargetControlID="PagerPanel1" Mode="NumericFirstLast"  OnClientPageIndexChanged="pageIndexChanged"  />
    <asp:Panel ID="PagerPanel1" runat="server"></asp:Panel>
    
    <asp:GridView runat="server" ID="C1GridView1" CssClass="ui-widget ui-widget-content" ShowHeader="true">
        <HeaderStyle CssClass="ui-widget-header" />
        <RowStyle CssClass="dataRowMarker" />
    </asp:GridView>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    This sample demonstrates how to use the wijpager widget with a series of tables to save
    screen real estate while creating a clean paged interface. 
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
