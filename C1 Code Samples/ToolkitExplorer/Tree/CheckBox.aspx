<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="CheckBox.aspx.cs" Inherits="Tree_CheckBox" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tree"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="treeDemo" runat="server" Font-Overline="False">
        <ul>
            <li class="folder"><a><span>Folder 1</span></a>
                <ul>
                    <li class="folder"><a><span>Folder 1.1</span></a>
                        <ul>
                            <li class="file"><a><span>File 1.1</span></a></li>
                            <li class="file"><a><span>File 1.2</span></a></li>
                            <li class="file"><a><span>File 1.3</span></a></li>
                            <li class="file"><a><span>File 1.4</span></a></li>
                            <li class="file"><a><span>File 1.5</span></a></li>
                        </ul>
                    </li>
                    <li class="file"><a><span>File 1.2</span></a></li>
                    <li class="file"><a><span>File 1.3</span></a></li>
                    <li class="file"><a><span>File 1.4</span></a></li>
                    <li class="file"><a><span>File 1.5</span></a></li>
                </ul>
            </li>
            <li class="folder"><a><span>Folder 2</span></a>
                <ul>
                    <li class="file"><a><span>File 2.1</span></a></li>
                    <li class="file"><a><span>File 2.2</span></a></li>
                    <li class="file"><a><span>File 2.3</span></a></li>
                    <li class="file"><a><span>File 2.4</span></a></li>
                    <li class="file"><a><span>File 2.5</span></a></li>
                </ul>
            </li>
            <li class="folder"><a><span>Folder 3</span></a>
                <ul>
                    <li class="file"><a><span>File 3.1</span></a></li>
                    <li class="file"><a><span>File 3.2</span></a></li>
                    <li class="file"><a><span>File 3.3</span></a></li>
                    <li class="file"><a><span>File 3.4</span></a></li>
                    <li class="file"><a><span>File 3.5</span></a></li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" ShowCheckBoxes="true" AllowEdit="true"
        TargetControlID="treeDemo">
    </wijmo:C1TreeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>C1TreeExtender supports showing tree nodes with checkbox.</p><br/>
    <p>In order to show tree nodes with checkbox, the following properties are used in this sample.</p>
	<ul>
        <li>ShowCheckBoxes</li>
        <li>AutoCheckNodes for specifying whether the sub-nodes will be checked according to its parent's check state</li>
        <li>AllowTriState for specifying whether the node can be in indeterminate state</li>
    </ul>
	<p>The tri states check box has 3 states "Checked", "Unchecked" and "Indeterminate".  The "Indeterminate" state
        indicates that the node has both checked and unchecked sub-nodes.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
