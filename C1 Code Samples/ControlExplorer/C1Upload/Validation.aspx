<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Validation.aspx.cs" Inherits="ControlExplorer.C1Upload.Validation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Upload" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Upload ID="c1Upload1" runat="server" Width="300px" ShowUploadedFiles="true" ValidFileExtensions="BMP,JPG,JPEG,GIF" ValidMimeTypes="image/bmp,image/gif,image/jpeg" MaximumFileSize="1024" OnValidatingFile="c1Upload1_ValidatingFile" OnClientValidatedFile="c1Upload1_ClientValidatedFile" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        You can use <strong>C1Upload's</strong> built-in validation or custom validation using the <strong>ValidatingFile</strong> event. This example shows how to perform automatic validations by setting the <strong>MaximumFileSize</strong>, <strong>ValidFileExtensions</strong>, and <strong>ValidMimeTypes</strong> properties.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <script type="text/javascript">
        function c1Upload1_ClientValidatedFile(e, args) {
            if (args.isValid) {
                var successFiles = $("#<%=TextBox1.ClientID%>");
                successFiles.val(successFiles.val() + args.file + "\r\n");
            }
            else {
                var invalidFiles = $("#<%=TextBox2.ClientID%>");
                invalidFiles.val(invalidFiles.val() + args.file + "\r\n");
            }
        }

        function clearlog() {
            $("#<%=TextBox1.ClientID%>").val("");
            $("#<%=TextBox2.ClientID%>").val("");
        }
    </script>

    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label class="settinglegend">Validation:</label></li>
                <li class="autoheight">
                    <label>Success files:</label>
                    <asp:TextBox ID="TextBox1" runat="server" Height="105px" TextMode="MultiLine"
                        Width="200px"></asp:TextBox>
                </li>
                <li class="autoheight">
                    <label>Invalid files:</label>
                    <asp:TextBox ID="TextBox2" runat="server" Height="105px" TextMode="MultiLine"
                        Width="200px"></asp:TextBox>
                </li>
            </ul>
        </div>
        <div class="settingcontrol">
            <input id="Button2" type="button" value="Clear Log" onclick="clearlog();" />
        </div>
    </div>
</asp:Content>
