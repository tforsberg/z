<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="AutoCollapse.aspx.cs" Inherits="Tree_AutoCollapse" %>

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
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" AutoCollapse="true" TargetControlID="treeDemo">
    </wijmo:C1TreeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample illustrates the auto collapsed feature of the C1TreeExtender. In this feature
        all expanded node will be collapsed if other node is expanded.
    </p><br/>
    <p>To enable this feature, the property <b>AutoCollapse</b> should be set to true.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
