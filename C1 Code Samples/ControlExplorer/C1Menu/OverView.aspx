<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="OverView.aspx.cs"
    Inherits="ControlExplorer.C1Menu.OverView" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00
        {
            overflow: visible;
            overflow-y: visible;
        }
    </style>    
</asp:Content>
<asp:Content runat="server" ID="Content2" ContentPlaceHolderID="MainContent">
    <h3>Default Menu</h3>
    <wijmo:C1Menu runat="server" ID="Menu1" DataSourceID="XmlDataSource1">
        <HideAnimation>
            <Animated Effect="fade"></Animated>
        </HideAnimation>
        <DataBindings>
            <wijmo:C1MenuItemBinding DataMember="Menuitem" HeaderField="header" NavigateUrlField="navigateUrl"
                SeparatorField="separator" TextField="text" />
        </DataBindings>
    </wijmo:C1Menu>

    <h3>iPod Style Menu</h3>
    <wijmo:C1Menu runat="server" ID="Menu2" Mode="Sliding" DataSourceID="XmlDataSource1">
    </wijmo:C1Menu>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/App_Data/menu_structure.xml"
        XPath="/root/menuitem"></asp:XmlDataSource>
</asp:Content>
<asp:Content ContentPlaceHolderID="Description" ID="Content3" runat="server">
    <p>
        Create multi-level menus with animation effects, images and check box items, interactive
		item scrolling, and more using the <strong>C1Menu</strong> control. You can even create a pop-up
		menu for context help within your application. The samples in this section will 
        show you how to use several features of the control, such as orientation, 
        client-side functions, triggers, and much more.
    </p>
</asp:Content>
