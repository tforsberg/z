<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Icon.aspx.cs" Inherits="ControlExplorer.C1TreeView.Icon" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1TreeView ID="C1TreeView1" runat="server">
        <Nodes>
            <wijmo:C1TreeViewNode ExpandedIconClass="ui-icon-folder-open" CollapsedIconClass="ui-icon-folder-collapsed"
                Text="Folder 1">
                <Nodes>
                    <wijmo:C1TreeViewNode ExpandedIconClass="ui-icon-folder-open" CollapsedIconClass="ui-icon-folder-collapsed"
                        Text="Folder 1.1">
                        <Nodes>
                            <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.1.1">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.1.2">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.1.3">
                            </wijmo:C1TreeViewNode>
                            <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.1.4">
                            </wijmo:C1TreeViewNode>
                        </Nodes>
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.4">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 1.5">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
            <wijmo:C1TreeViewNode ExpandedIconClass="ui-icon-folder-open" CollapsedIconClass="ui-icon-folder-collapsed"
                Text="Folder 2">
                <Nodes>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 2.1">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 2.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 2.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 2.4">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 2.5">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
            <wijmo:C1TreeViewNode ExpandedIconClass="ui-icon-folder-open" CollapsedIconClass="ui-icon-folder-collapsed"
                Text="Folder 3">
                <Nodes>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 3.1">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 3.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 3.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 3.4">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode ItemIconClass="ui-icon-document" Text="File 3.5">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
        </Nodes>
    </wijmo:C1TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to add icons to <strong>C1TreeViewNode</strong>; in addition, it also
        shows how you can switch icons based on a <strong>C1TreeViewNode</strong>'s current state.
    </p>
    <p>This sample sets the following properties in support of this feature:</p>
    <ul>
        <li>ItemIconClass </li>
        <li>ExpandedIconClass </li>
        <li>CollapsedIconClass </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
