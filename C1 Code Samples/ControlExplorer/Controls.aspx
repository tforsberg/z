<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/WijmoSite.Master" CodeBehind="Controls.aspx.cs" Inherits="ControlExplorer.Controls" %>

<asp:Content ID="headContent" runat="server" ContentPlaceHolderID="head">
    <!--jQuery References-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeaderButtons">
    <a runat="server" href="~/">Home</a>
    <span> > </span>
    <a runat="server" class="description">Controls</a>
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="MainContent">
    <div class="nosidebar">
        <article class="ui-helper-clearfix">
            <div class="main-content">
                <div class="padder">
                    <asp:Repeater runat="server" ID="RptWidgets">
                        <HeaderTemplate>
                            <ul class="widget-icons ui-helper-clearfix">
                        </HeaderTemplate>
                        <ItemTemplate>
                            <li><a runat="server" href='<%# Eval("Link") %>'>
                                <img runat="server" src='<%# Eval("Icon") %>' alt='<%# Eval("Title") %>' /><%# Eval("Title")%></a></li>
                        </ItemTemplate>
                        <FooterTemplate>
                            </ul>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </article>
    </div>
</asp:Content>
