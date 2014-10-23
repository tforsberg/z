<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="DragDrop.aspx.cs" Inherits="ControlExplorer.C1TreeView.DragDrop" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <wijmo:C1TreeView ID="C1TreeView1" AllowDrag="true" AllowDrop="true" runat="server">
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
        <p style="color:#333333">
            Between 2 trees</p>
    </div>
    <wijmo:C1TreeView ID="C1TreeView2" AllowDrop="true" runat="server">
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
        <strong>C1TreeView</strong> supports drag and drop behavior which allows the end-user to drag and drop nodes to rearrange the tree structure.</p>
    <p>
        The drag and drop behavior is allowed if the following properties are set to True.</p>
    <ul>
        <li><strong>AllowDrag </strong>- for specifying whether dragging is allowed</li>
        <li><strong>AllowDrop </strong>- for specifying whether dropping is allowed</li>
    </ul>
    <p>
        Drag and drop node behavior can be made in single treeview or between two tree views. Furthermore, end-users can even can customize their own draggable and droppable behaviors from the client side using draggable and droppable client-side properties.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
