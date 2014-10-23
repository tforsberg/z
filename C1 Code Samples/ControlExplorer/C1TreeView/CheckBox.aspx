<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="CheckBox.aspx.cs" Inherits="ControlExplorer.C1TreeView.CheckBox" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView"
    TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1TreeView ID="C1TreeView1" ShowCheckBoxes="true"  runat="server">
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
    <p><strong>C1TreeView </strong>supports showing tree nodes with tri-state check boxes.</p>
    <p>In order to show tree nodes with check box, the following properties are used in this sample.</p>
	<ul>
        <li><strong>ShowCheckBoxes</strong> - set to True to show check boxes<strong>.</strong></li>
        <li><strong>AutoCheckNodes</strong> - for specifying whether the sub-nodes will be checked according to its parent's check state.</li>
        <li><strong>AllowTriState</strong> - for specifying whether the node can be in indeterminate state.</li>
    </ul>
	<p>Tri-state check boxes have 3 states "Checked", "Unchecked" and "Indeterminate".  The "Indeterminate" state
        indicates that the node has both checked and unchecked child nodes.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
