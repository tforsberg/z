<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Pager.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Pager" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManger1"></asp:ScriptManager>

    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
        <ContentTemplate>
            <wijmo:C1Pager runat="server" ID="C1Pager1" AutoPostBack="true" Mode="NumericFirstLast"
                OnPageIndexChanged="C1Pager1_PageIndexChanged" />

            <asp:GridView Width="100%" runat="server" ID="GridView1" DataSourceID="AccessDataSource1" AllowPaging="true"
                CssClass="ui-widget" OnDataBound="GridView1_DataBound">
                <HeaderStyle CssClass="ui-widget-header" />
                <RowStyle CssClass="ui-widget-content" />
                <PagerSettings Visible="false" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:AccessDataSource ID="AccessDataSource1" runat="server"
        DataFile="~/App_Data/C1NWind.mdb"
        SelectCommand="SELECT [OrderID], [ProductID], [UnitPrice], [Quantity] FROM [Order Details]"></asp:AccessDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Pager </strong>allows users to scroll through elements or pages by clicking on a visible element. This sample 
    illustrates a <strong>C1Pager</strong> control with a combination of numeric and 'first' and 'last' 
    buttons.&nbsp;  
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
