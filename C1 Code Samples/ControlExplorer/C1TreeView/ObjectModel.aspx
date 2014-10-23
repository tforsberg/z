<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ObjectModel.aspx.cs" Inherits="ControlExplorer.C1TreeView.ObjectModel" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function getNode() {
            return $("#<%= C1TreeView1.ClientID %>").c1treeview("findNodeByText", "Folder 1"); ;
        }

        function add() {
            var node = getNode();
            if (node != null)
                node.element.c1treeviewnode("add", $("#addValue").val(), parseInt($("#addIndex").val()));
        }

        function removenode() {
            var node = getNode();
            if (node != null)
                node.element.c1treeviewnode("remove", parseInt($("#removeIndex").val()));
        }

    </script>

    <style type="text/css">
        .settingcontent .settingitem
        {
            width:200px;
        }

        .settingcontent .settingitem label
        {
             width:60px;
        }

        .settingcontent .settingcommand
        {
            width:90px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1TreeView ID="C1TreeView1" runat="server">
        <Nodes>
            <wijmo:C1TreeViewNode Text="Folder 1" Expanded="True">
                <Nodes>
                    <wijmo:C1TreeViewNode Text="Folder 1.1">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.2">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.3">
                    </wijmo:C1TreeViewNode>
                    <wijmo:C1TreeViewNode Text="Folder 1.4">
                    </wijmo:C1TreeViewNode>
                </Nodes>
            </wijmo:C1TreeViewNode>
        </Nodes>
    </wijmo:C1TreeView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how to dynamically add and remove nodes from the <strong>C1TreeView </strong>from client side code.</p>
    <p>
        The following client-side methods are used in this sample.</p>
    <ul>
        <li>add</li>
        <li>remove</li>
    </ul>
    <p>
        The add method has the following parameters.</p>
    <ul>
        <li><strong>node</strong> - The <strong>node</strong> parameter specifies the markup/jquery object/tree node options that will be added to the <strong>C1TreeView</strong> or <strong>C1TreeViewNode</strong>.</li>
        <li><strong>index</strong> - The <strong>index</strong> parameter specifies the index of its siblings. If <strong>index</strong> is null, then the node will be added to the end.</li>
    </ul>
    <p>
        The remove method has the following parameters.</p>
    <ul>
        <li><strong>index</strong> - The <strong>index</strong> parameter specifies the index of the child nodes of the <strong>C1TreeView</strong> or <strong>C1TreeViewNode</strong>.</li>
    </ul>
    <p>
        For example:
        <pre>$("#treeId").c1treeviewnode("add", 'Node text 1');</pre>
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth"><label class="settinglegend">Add:</label></li>
                <li class="settingitem">
                    <label>Index:</label>
                    <input id="addIndex" type="text" value="0" />
                </li>
                <li class="settingitem">
                    <label>Value:</label>
                    <input id="addValue" type="text" value="New node" />
                </li>
                <li class="settingcommand">
                    <input id="addNode" onclick="add();" type="button" value="Add" />
                </li>

                <li class="fullwidth"><label class="settinglegend">Remove:</label></li>
                <li class="settingitem">
                    <label>Index:</label>
                    <input id="removeIndex" type="text" value="0" />
                </li>
                <li class="settingcommand">
                    <input id="removeNode" onclick="removenode();" type="button" value="Remove" />
                </li>
            </ul>
        </div>
    </div>
</asp:Content>
