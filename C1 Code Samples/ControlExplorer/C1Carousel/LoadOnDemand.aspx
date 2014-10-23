<%@ Page Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" 
CodeBehind="LoadOnDemand.aspx.cs" Inherits="ControlExplorer.C1Carousel.LoadOnDemand" 
Title="LoadOnDemand" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
    TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        #<%=C1Carousel1.ClientID%>
        {
            width: 680px;
            height: 195px;
        }
        
        #<%=C1Carousel1.ClientID%> img
        {
            float: left;
            background: #fafafa;
            border: solid 1px #999DB2;
            -moz-border-radius: 4px;
            -webkit-border-radius: 4px;
            border-radius: 4px;
            padding: 5px;
            margin: 0 1em 0 0;
        }
        #<%=C1Carousel1.ClientID%> li
        {
            padding: 1em 2em;
        }
        #<%=C1Carousel1.ClientID%> .image-shadow
        {
            float: left;
            padding-bottom: 9px;
        }
        #<%=C1Carousel1.ClientID%> p
        {
            font-style: italic;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Databind with template
    </p>
    <cc1:C1Carousel ID="C1Carousel1" runat="server" ButtonPosition="Inside" Width="750px"  LoadOnDemand="true" 
        Height="200px" Display="1" EnableTheming="True" ShowPager="false" CssClass="ui-corner-all ui-widget-content">
        <itemcontent>
                <div class="image-shadow">
                    <img class="wijmo-wijcarousel-image" src="<%# Eval("ImgUrl")%>">
                </div>
                <h3>
                    <%# Eval("Caption")%></h3>
                <p>
                    <%# Eval("Content")%></p>
            </itemcontent>
    </cc1:C1Carousel>
    <br />
    <br />
    <br />
    <cc1:C1Carousel ID="C1Carousel2" DataImageUrlField="ImgUrl" runat="server" PagerType="Dots"  LoadOnDemand="true" 
        Width="720px" Height="180px" Display="3" EnableTheming="True" ShowPager="True">
        <pagerposition>
                <My Left="Right"></My>
                <At Top="Bottom" Left="Right"></At>
            </pagerposition>
    </cc1:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Carousel </strong>supports retrieving data (nodes) dynamically. Child items are loaded using AJAX when they are scrolled into view. To enable loading data on demand set the LoadOnDemand property to true.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

