<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1TreeView.Overview" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1TreeView ID="C1TreeView1" runat="server">
        <Nodes>
            <wijmo:C1TreeViewNode Text="Folder 1">
                <Nodes>
                    <wijmo:C1TreeViewNode Text="Folder 1.1">
                        <Nodes>
                            <wijmo:C1TreeViewNode Text="Folder 1.1.1">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.1.2">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.1.3">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode Text="Folder 1.1.4">
                            </wijmo:C1TreeViewNode>
                        </Nodes>
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.4">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.5">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
            <wijmo:C1TreeViewNode Text="Folder 2">
                <Nodes>
                    <wijmo:C1TreeViewNode Text="Folder 2.1">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 2.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 2.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 2.4">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 2.5">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
            <wijmo:C1TreeViewNode Text="Folder 3">
                <Nodes>
                    <wijmo:C1TreeViewNode Text="Folder 3.1">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 3.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 3.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 3.4">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 3.5">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
        </Nodes>
    </wijmo:C1TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1TreeView</strong> presents items in a hierarchical tree structure. The
        <strong>C1TreeView </strong>supports expand/collapse animations, stylish themes, and drag-and-drop functionality.
    </p>
    <p>
        This sample illustrates the default behaviors of the <strong>C1TreeView </strong>
        control. The other samples in this section highlight the features of the 
        control, such as data binding, drag-and-drop nodes, and autocollapsing nodes.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
