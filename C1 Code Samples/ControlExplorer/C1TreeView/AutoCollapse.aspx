<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="AutoCollapse.aspx.cs" Inherits="ControlExplorer.C1TreeView.AutoCollapse" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1TreeView ID="C1TreeView1" AutoCollapse="true" runat="server">
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
        This sample illustrates the auto collapsed feature of the <strong>C1TreeView </strong>control. In this feature all expanded node will be collapsed if other node is expanded.
    </p>
    <p>
        To enable this feature, the property <strong>AutoCollapse</strong> should be set to True.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
