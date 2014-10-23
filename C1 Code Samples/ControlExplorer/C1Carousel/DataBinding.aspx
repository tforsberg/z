<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="DataBinding.aspx.cs" Inherits="ControlExplorer.C1Carousel.DataBinding" %>

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
    <cc1:C1Carousel ID="C1Carousel1" runat="server" ButtonPosition="Inside" Width="750px"
        Height="200px" Display="1" EnableTheming="True" ShowPager="false" CssClass="ui-corner-all ui-widget-content">
        <ItemContent>
            <div class="image-shadow">
                <img class="wijmo-wijcarousel-image" src="<%# Eval("ImgUrl")%>">
            </div>
            <h3>
                <%# Eval("Caption")%></h3>
            <p>
                <%# Eval("Content")%></p>
        </ItemContent>
    </cc1:C1Carousel>
    <br />
    <br />
    <br />
    <cc1:C1Carousel ID="C1Carousel2" DataImageUrlField="ImgUrl" runat="server" PagerType="Dots"
        Width="750px" Height="300px" Display="1" EnableTheming="True" ShowPager="True">
        <PagerPosition>
            <My Left="Right"></My>
            <At Top="Bottom" Left="Right"></At>
        </PagerPosition>
    </cc1:C1Carousel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Carousel</strong> supports data binding, it can bind image url, caption, and link fields, or bind any data in the template.
    </p>
    <p>Data binding is allowed if the following properties are set: </p>
		<ul>
		<li><strong>DataSourceID </strong>- sets the ID of the data source.</li>
		<li><strong>DataCaptionField </strong>-&nbsp; sets the field in the data source from 
			which to load  the caption of the images.</li>
		<li><strong>DataLinkUrlField </strong>-&nbsp; sets the field in the data source from which to load link fields.</li>
        <li><strong>DataImageUrlField </strong>-&nbsp; sets the field in the data source from which to load image url fields.</li></ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
