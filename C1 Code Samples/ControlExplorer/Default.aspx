<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WijmoSite.Master" CodeBehind="Default.aspx.cs" Inherits="ControlExplorer.Default" %>

<asp:Content ID="headContent" runat="server" ContentPlaceHolderID="head">
    <!--jQuery References-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeaderButtons">
    <a runat="server">Home</a>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="MainContent">
    <article class="ui-helper-clearfix">
        <aside>
            <div class="padder">
                <span class="content-title">
                    The Ultimate UI Tools for WebForms</span>
                <p>
                    Over 40 styled, supercharged, and easy-to-use controls built on Web standards including AJAX, CSS, HTML5, and jQuery. All of which are available as ASP.NET Controls, Extenders and MVC tools. Shift your site into overdrive with ComponentOne Studio® for ASP.NET Wijmo.</p>
            </div>
            <div class="padder">
                <span class="content-title">
                    What's new</span>
                <asp:Repeater runat="server" ID="RptWhatsNew">
                    <HeaderTemplate>
                        <ul class="widget-icons ui-helper-clearfix">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <a>
                                <img id="Img1" runat="server" src='<%# Eval("Icon") %>' alt='<%# Eval("Name") %>' />
                            </a>
                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("Title") %>' CssClass="description"></asp:Label>
                            <a runat="server" href='<%# Eval("link") %>'  class="description"><%# Eval("Description") %></a>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </aside>
        <div class="main-content">
            <div class="padder">
                <span class="content-title">
                    Favourites <a runat="server" href="~/Controls.aspx" class="description">(View All)</a></span>                
                <asp:Repeater runat="server" ID="RptFavoriteControls">
                    <HeaderTemplate>
                        <ul class="favorite-widgets widget-icons ui-helper-clearfix">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a runat="server" href='<%# Eval("Link") %>'>
                            <img runat="server" src='<%# Eval("Icon") %>' alt='<%# Eval("Title") %>' /><%# Eval("Title")%></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </article>
</asp:Content>
