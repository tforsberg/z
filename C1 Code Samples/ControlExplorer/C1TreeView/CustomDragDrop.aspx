<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomDragDrop.aspx.cs" Inherits="ControlExplorer.C1TreeView.CustomDragDrop" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1TreeView" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style>
        #trash
        {
            float: right;
            min-height: 12em;
            padding: 1%;
            width: 32%;
        }
        #trash ul
        {
            list-style: none;
        }
         
        #trash ul li
        {
            margin-bottom: 10px;
        }
               
        div.wijmo-wijtree
        {
            float: left;
        }
         
             
        .dropVisual
        {
            height:1px;
            font-size:0px;/*fix ie 6 issue*/
            background-color:Red;
        }    
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="main demo">             
        <div>
            <wijmo:C1TreeView ID="C1TreeView1" AllowDrag="true" AllowDrop="false" runat="server" OnClientNodeDragging="C1TreeView1_Dragging" OnClientNodeDragStarted="C1TreeView1_DragStarted">
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
        </div>
 
           
        <div id="trash" class="ui-widget-content">
            <h4 class="ui-widget-header">
                <span class="ui-icon ui-icon-trash">Trash</span> Trash</h4>
            <ul>
            </ul>
        </div>
        <div style="clear:both"></div>
        <p>
        Clone node to this tree:</p>
        <div>
            <wijmo:C1TreeView ID="C1TreeView2" AllowDrag="false" AllowDrop="true" runat="server">
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
        </div>
    </div>
    <div style="clear:both"></div>

    <script id="scriptInit" type="text/javascript">
        var span = "<span class=\"ui-widget-content helperInner\">";
        function C1TreeView1_DragStarted(event, ui) {
            var inner = ui.element.siblings(".ui-draggable-dragging");
            if (inner.length) {
                inner.html(inner.html() + span);
            }
        }

        function C1TreeView1_Dragging(event, ui)
        {
            var inner = ui.element.siblings(".ui-draggable-dragging").children(".helperInner");
            if (inner.length) {
                inner.html("x:" + event.pageX + " y:" + event.pageX);
            }
        }

        $(function () {
            $("#trash").droppable({
                activeClass: "ui-state-hover",
                hoverClass: "ui-state-active",
                scope: "tree",
                //Drop the node to "trash".
                drop: function (event, ui) {
                    var node = ui.draggable;
                    node.appendTo($(trash).children("ul:eq(0)"));
                }
            });

            // Get the initial HTML markup of dragged node.
            var getInitMarkup = function (dragNode) {
                var node = dragNode.clone();
                node.find("a").unwrap().unwrap();
                node.find("li>span,>span").remove();
                return node;
            };

            $("#<%=C1TreeView2.ClientID%> >ul:first-child").c1treeview({
                allowDrop: true,
                allowDrag: false,
                droppable: {
                    //Clone the dragged node and append to the new parent-node.
                    drop: function (event, ui) {
                        var dragNode = ui.draggable,
                        p = ui.newParent,
                        po = ui.newIndex, node;

                        node = getInitMarkup(dragNode);
                        
                        if (p.is(".wijmo-wijtree-list")) {
                            p.c1treeview("add", node, po);
                        }
                        else {
                            p.c1treeviewnode("add", node, po);
                        }
                    }
                }
            });
        });
    </script>

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
