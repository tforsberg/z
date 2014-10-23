<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="Overview.aspx.cs" Inherits="Tree_Overview" %>

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
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" TargetControlID="treeDemo">    
    </wijmo:C1TreeExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The C1TreeExtender presents items in a hierarchical tree structure. The C1TreeExtender
        supports expand/collapse animations, stylish themes, and drag-and-drop functionality.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
