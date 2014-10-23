<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1Splitter.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Splitter" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .splitterContainer
        {
            height: 210px;
        }
        
        .layout
        {
            float: left;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="splitterContainer">
        <div class="layout">
            <h3>Vertical</h3>
            <h4>
                Collapsing Panel: panel1</h4>
            <wijmo:C1Splitter runat="server" ID="C1Splitter1" Orientation="Vertical" Width="200px" Height="200px">
                <Panel1>
                    <ContentTemplate>
                        <div>panel1</div>
                    </ContentTemplate>
                </Panel1>
                <Panel2>
                    <ContentTemplate>
                        <div>panel2</div>
                    </ContentTemplate>
                </Panel2>
            </wijmo:C1Splitter>
            <h4>
                Collapsing Panel: panel2</h4>
            <wijmo:C1Splitter runat="server" ID="C1Splitter3" Orientation="Vertical" Width="200px" CollapsingPanel="Panel2" Height="200px">
                <Panel1>
                    <ContentTemplate>
                        <div>panel1</div>
                    </ContentTemplate>
                </Panel1>
                <Panel2>
                    <ContentTemplate>
                        <div>panel2</div>
                    </ContentTemplate>
                </Panel2>
            </wijmo:C1Splitter>
        </div>
        <div class="layout" style="width: 100px;">
            &nbsp;</div>
        <div class="layout">
            <h3>Horizontal</h3>
            <h4>
                Collapsing Panel: panel1</h4>
            <wijmo:C1Splitter runat="server" ID="C1Splitter2" Orientation="Horizontal" Width="200px" Height="200px">
                <Panel1>
                    <ContentTemplate>
                        <div>panel1</div>
                    </ContentTemplate>
                </Panel1>
                <Panel2>
                    <ContentTemplate>
                        <div>panel2</div>
                    </ContentTemplate>
                </Panel2>
            </wijmo:C1Splitter>
            <h4>
                Collapsing Panel: panel2</h4>
            <wijmo:C1Splitter runat="server" ID="C1Splitter4" Orientation="Horizontal" Width="200px" CollapsingPanel="Panel2" Height="200px">
                <Panel1>
                    <ContentTemplate>
                        <div>panel1</div>
                    </ContentTemplate>
                </Panel1>
                <Panel2>
                    <ContentTemplate>
                        <div>panel2</div>
                    </ContentTemplate>
                </Panel2>
            </wijmo:C1Splitter>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Splitter</strong> is a container control that consists of a draggable bar that divides a container's display area into two resizable panes. This sample illustrates how to use the <strong>Orientation</strong> property to make a vertical or horizontal splitter. Other samples in this section will teach you how to make nested splitters and full-size splitters.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
