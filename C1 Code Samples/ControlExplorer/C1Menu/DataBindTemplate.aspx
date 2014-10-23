<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="DataBindTemplate.aspx.cs" Inherits="ControlExplorer.C1Menu.DataBindTemplate" %>

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
    <wijmo:C1Menu runat="server" ID="C1Menu" DataSourceID="XmlDataSource1">
        <HideAnimation>
            <Animated Effect="fade"></Animated>
        </HideAnimation>
        <DataBindings>
            <wijmo:C1MenuItemBinding TextField="Text" HeaderField="header" SeparatorField="Separator" />
        </DataBindings>
        <TopItemsTemplate>
            <a>
                <%#DataBinder.Eval(Container.DataItem,"Text")%></a>
        </TopItemsTemplate>
        <ChildItemsTemplate>
            <a class="wijmo-wijmenu-text"><%#DataBinder.Eval(Container.DataItem,"Text")%></a>
        </ChildItemsTemplate>
    </wijmo:C1Menu>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/menu_structure.xml"
        XPath="/root/menuitem"></asp:XmlDataSource>

    <script id="scriptInit" type="text/javascript">
        $(document).ready(function () {
            $(".wijmo-wijmenu-text").parent().bind("click", function () {
                $("#<%= C1Menu.ClientID %>").c1menu("hideAllMenus");
		});
	    $(".wijmo-wijmenu-link").hover(function () {
	        $(this).addClass("ui-state-hover");
	    }, function () {
	        $(this).removeClass("ui-state-hover");
	    })
	});

    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The sample demonstrates how to bind the <strong>C1Menu </strong>to a data source and show menu items with different templates.
    </p>
    <p>The following properties are used in this sample</p>
    <ul>
        <li>DataBindings</li>
        <li>TopItemsTemplate</li>
        <li>ChildItemsTemplate</li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
