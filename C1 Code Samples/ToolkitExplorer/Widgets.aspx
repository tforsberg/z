<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WijmoSite.Master" CodeBehind="Widgets.aspx.cs" Inherits="ToolkitExplorer.Widgets" %>

<asp:Content ID="headContent" runat="server" ContentPlaceHolderID="head">
    <!--jQuery References-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeaderButtons">
    <a runat="server" href="~/" class="button button-icon">
        <img runat="server" src="~/explore/css/images/icons/24/home.png"></a></asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeaderTitle">
    Widgets</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="MainContent">
    <section class="nosidebar">
        <article class="ui-helper-clearfix">
            <div class="main-content">
                <div class="padder">
                    <asp:Repeater runat="server" ID="RptWidgets">
                        <HeaderTemplate>
                            <ul class="widget-icons widget-icons-grid ui-helper-clearfix">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a runat="server" href='<%# Eval("WidgetHref") %>'>
                                <img runat="server" src='<%# Eval("Icon") %>' alt='<%# Eval("Title") %>' /><%# Eval("Title")%></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </article>
    </section>
</asp:Content>
