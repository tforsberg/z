<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="DragDrop.aspx.cs" Inherits="Tree_DragDrop" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tree"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="treeDemo1" runat="server" Font-Overline="False">
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
    <p>
        Between 2 trees</p>
    <asp:Panel ID="treeDemo2" runat="server" Font-Overline="False">
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
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" AllowDrag="true" AllowDrop="true"
        TargetControlID="treeDemo1">
    </wijmo:C1TreeExtender>
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender2" AllowDrag="false" AllowDrop="true"
        TargetControlID="treeDemo2">
    </wijmo:C1TreeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>C1TreeExtender supports drag and drop nodes behavior for end-user.</p><br/>
    <p>The drag and drop behavior is allowed if the following properties are set to true.</p>
    <ul>
        <li>AllowDrag for specifying whether dragging is allowed</li>
        <li>AllowDrop for specifying whether dropping is allowed</li>
    </ul>
    <p>Drag and drop node behavior can be made in single tree view or between two tree views.  Furthermore, end-user even can customize his own draggable and droppable behavior at client side using draggable and droppable client side properties.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
