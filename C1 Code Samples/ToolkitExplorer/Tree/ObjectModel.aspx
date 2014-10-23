<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
    CodeFile="ObjectModel.aspx.cs" Inherits="Tree_ObjectModel" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tree"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">

    <script type="text/javascript">
        function getNode() {
            return $("#<%= treeDemo.ClientID %>").wijtree("findNodeByText", "Folder 1"); ;
        }

        function add() {
            var node = getNode();
            if (node != null)
                node.element.wijtreenode("add", 'New node', parseInt($("#addIndex").val()));
        }

        function removeItem() {
            var node = getNode();
            if (node != null)
                node.element.wijtreenode("remove", parseInt($("#removeIndex").val()));
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Panel ID="treeDemo" runat="server" Font-Overline="False">
        <ul>
            <li><a><span>Folder 1</span></a>
                <ul>
                    <li><a><span>Folder 1.1</span></a></li>
                    <li><a><span>Folder 1.2</span></a></li>
                    <li><a><span>Folder 1.3</span></a></li>
                    <li><a><span>Folder 1.4</span></a></li>
                    <li><a><span>Folder 1.5</span></a></li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <wijmo:C1TreeExtender runat="server" ID="TreeExtender1" TargetControlID="treeDemo">
    </wijmo:C1TreeExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>This sample shows how to dynamically add and remove nodes for C1TreeExtender at client side.</p><br/>
	<p>The following client side methods are used in this sample.</p>
	<ul>
		<li>add</li>
		<li>remove</li>
	</ul>
	<p>The add method has the following parameters.</p>
	<ul>
		<li>node</li>
		<p>node specifies the markup/jquery object/tree node options that will be added to the wijtree or wijtreenode.</p>
		<li>index</li>
		<p>index specifies the index of its siblings.  If index is null, then the node will be added to the end.</p>
	</ul>
	<p>The remove method has the following parameters.</p>
	<ul>
		<li>index</li>
		<p>index specifies the index of the child nodes of the wijtree or wijtreenode.</p>
	</ul>
    <p>
        For example:
        $("#treeId").wijtreeviewnode("add", 'Node text 1');
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div>
        <input id="addNode" onclick="add();" type="button" value="Add" />
        at index
        <input id="addIndex" type="text" value="0" />
    </div>
    <div>
        <input id="removeNode" onclick="removeItem();" type="button" value="Remove" />
        at index
        <input id="removeIndex" type="text" value="0" />
    </div>
</asp:Content>
