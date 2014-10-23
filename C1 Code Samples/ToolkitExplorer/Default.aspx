<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WijmoSite.Master" CodeBehind="Default.aspx.cs" Inherits="ToolkitExplorer.Default" %>

<asp:Content ID="headContent" runat="server" ContentPlaceHolderID="head">
    <!--jQuery References-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeaderButtons">
    <a runat="server" href="~/Widgets.aspx" class="button">
        <img runat="server" src="~/explore/css/images/dots.png"><span>Controls</span></a>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeaderTitle">
    Welcome</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="MainContent">
    <section>
        <article class="ui-helper-clearfix">
            <aside>
                <div class="padder">
                    <h3>
                        The Ultimate UI Tools for WebForms</h3>
                    <p>
                        Over 40 styled, supercharged, and easy-to-use controls built on Web standards including AJAX, CSS, HTML5, and jQuery. All of which are available as ASP.NET Controls, Extenders and MVC tools. Shift your site into overdrive with ComponentOne Studio® for ASP.NET Wijmo.</p>
                </div>
            </aside>
            <div class="main-content">
                <div class="padder">
                    <h3 class="page-title">
                        Favorites</h3>
                    <asp:Repeater runat="server" ID="RptFavoriteWidgets">
                        <HeaderTemplate>
                            <ul class="favorite-widgets widget-icons ui-helper-clearfix">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a runat="server" href='<%# Eval("WidgetHref") %>'>
                                <img runat="server" src='<%# Eval("Icon") %>' alt='<%# Eval("Title") %>' /><%# Eval("Title")%></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            <li class="explore-all"><a runat="server" href="~/Widgets.aspx">
                                <img runat="server" src="~/explore/css/images/dots94x94.png" />
                                Explore All</a></li>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </article>
    </section>
</asp:Content>
