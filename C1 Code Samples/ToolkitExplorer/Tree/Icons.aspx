<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Icons.aspx.cs" Inherits="Tree_Icons" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tree"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="treeDemo" runat="server" Font-Overline="False">
        <ul>
            <li expandediconclass="ui-icon-folder-open" collapsediconclass="ui-icon-folder-collapsed"
                class="folder"><a><span>Folder 1</span></a>
                <ul>
                    <li expandediconclass="ui-icon-folder-open" collapsediconclass="ui-icon-folder-collapsed"
                        class="folder"><a><span>Folder 1.1</span></a>
                        <ul>
                            <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.1</span></a></li>
                            <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.2</span></a></li>
                            <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.3</span></a></li>
                            <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.4</span></a></li>
                            <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.5</span></a></li>
                        </ul>
                    </li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.2</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.3</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.4</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 1.5</span></a></li>
                </ul>
            </li>
            <li expandediconclass="ui-icon-folder-open" collapsediconclass="ui-icon-folder-collapsed"
                class="folder"><a><span>Folder 2</span></a>
                <ul>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 2.1</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 2.2</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 2.3</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 2.4</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 2.5</span></a></li>
                </ul>
            </li>
            <li expandediconclass="ui-icon-folder-open" collapsediconclass="ui-icon-folder-collapsed"
                class="folder"><a><span>Folder 3</span></a>
                <ul>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 3.1</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 3.2</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 3.3</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 3.4</span></a></li>
                    <li itemiconclass="ui-icon-document" class="file"><a><span>File 3.5</span></a></li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" TargetControlID="treeDemo">
    </wijmo:C1TreeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates how to add icons to treeview node; in addition, it also
        shows how you can switch icons based on a C1TreeViewNode's current state.
    </p><br/>
    <p>Set following properties to support this feature.</p>
    <ul>
        <li>ItemIconClass </li>
        <li>ExpandedIconClass </li>
        <li>CollapsedIconClass </li>
    </ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
