<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientSideEvents.aspx.cs" Inherits="ControlExplorer.C1FileExplorer.ClientSideEvents" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FileExplorer" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>

        var messageId = 0;

        function printMessage(str) {
            var element = document.getElementById("output");
            messageId++;
            element.value += formatMessage(messageId + ":", 6) + str;
            element.scrollTop = element.scrollHeight;
        }

        function formatMessage(str, len) {
            var formattedMessage = null;
            if (str != null) {
                var formattedMessage = str.toString();
                formattedMessage += " ";
                for (var idx = formattedMessage.length; idx < len; idx++) {
                    formattedMessage += " ";
                }
            }
            return formattedMessage;
        }

        function onClientNodeEvent(evt, node) {
            var str =
                formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                formatMessage(node.options.value, 16) +
                "\n";

            printMessage(str);
        }

        function onClientFileOpened(evt, path) {
            var str =
                formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                formatMessage(path, 30) +
                "\n";

            printMessage(str);
        }

        function onClientMove(evt, data) {
            var str =
                formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                formatMessage(data.desPath, 30) +
                formatMessage(data.srcPath.join(), 30) +
                "\n";

            printMessage(str);
        }

        function onClientCopy(evt, data) {
            var str =
                formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                formatMessage(data, 30) +
                "\n";

            printMessage(str);
        }

        function onClientDelete(evt, data) {
            var str =
                formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                formatMessage(data, 30) +
                "\n";

            printMessage(str);
        }

        function onClientNewFolderCreated(evt, data) {
            var str =
            formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
            formatMessage(data.path, 30) +
            formatMessage(data.name, 30) +
            "\n";

            printMessage(str);
        }

        function onClientSelect(evt, item) {

            if (!item.isFolder) {
                var str =
                    formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                    formatMessage(item.path, 30) +
                    "\n";

                printMessage(str);
            }
        }

        function onClientFilter(evt, val) {
            if ($.type(val) === "string") {
                var str =
                formatMessage(evt.type.replace('c1fileexplorer', ''), 30) +
                formatMessage(val, 30) +
                "\n";

                printMessage(str);
            }
        }

    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <cc1:C1FileExplorer ID="C1FileExplorer1" runat="server" InitPath="~/C1FileExplorer/Example" SearchPatterns="*.jpg,*.png,*.jpeg,*.gif" 
        OnClientCopy="onClientCopy" 
        OnClientDelete="onClientDelete" 
        OnClientFileOpened="onClientFileOpened" OnClientNewFolderCreated="onClientNewFolderCreated"
        OnClientFolderLoaded="onClientNodeEvent" OnClientItemSelected="onClientSelect"
        OnClientMove="onClientMove" OnClientFolderChanged="onClientNodeEvent" OnClientFilter="onClientFilter" >
    </cc1:C1FileExplorer>

    <div>
        <br />

        <strong>
        <pre>
        <font size="2" face="Courier">
    Event Type                  Target                  Source
<textarea id="output" rows="6" style="width: 700px;" wrap="off" readonly="readonly" ></textarea>
    </font>

        </pre>

        </strong>

    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1FileExplorer</strong> provides following client side events:
    </p>
    <ul>
        <li>OnClientItemSelected - fired after the item is selected.</li>
        <li>OnClientFolderLoaded - fired after a folder content is loaded.</li>
        <li>OnClientFileOpened - fired after a file is opened.</li>
        <li>OnClientFolderChanged - fired after current active folder is changed.</li>
        <li>OnClientNewFolderCreated - fired after a new folder is created.</li>
        <li>OnClientDelete - fired before deleting an item.</li>
        <li>OnClientMove - fired after an item is moved to a new place or renamed.</li>
        <li>OnClientCopy - fired before an item is copied to the new destination directory.</li>
    </ul>
    <p>
        In this demo, when performing different actions, the log will list the according client side events and target fodler/file.
    </p>
</asp:Content>
