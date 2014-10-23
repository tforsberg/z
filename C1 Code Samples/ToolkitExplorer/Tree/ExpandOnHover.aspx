<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="ExpandOnHover.aspx.cs" Inherits="Tree_ExpandOnHover" %>

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
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" ExpandCollapseHoverUsed="true"
        TargetControlID="treeDemo">
    </wijmo:C1TreeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>C1TreeExtender supports expanding or collapsing node when mouse hovers the node or not.</p><br/>
	<p>The expand on hover is enabled if the property <b>ExpandCollapseHoverUsed</b> is set to true.</p><br/>
    <p>You can also set the expanding/collapsing animations with the <b>ExpandAnimation</b> and <b>CollapseAnimation</b> properties.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
