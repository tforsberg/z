<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomValidation.aspx.cs" Inherits="ControlExplorer.C1Upload.CustomValidation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Upload" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <wijmo:C1Upload ID="c1Upload1" runat="server" Width="300px" ShowUploadedFiles="true" OnValidatingFile="c1Upload1_ValidatingFile" OnClientValidatedFile="c1Upload1_ClientValidatedFile"/>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
         Custom validation can be used to override the built-in validation using the sever-side <strong>ValidatingFile</strong> event. In order to validate whether a file is invalid or valid in the Validating event handler, set the IsValid of the <strong>ValidateFileEventArgs</strong> property to True for valid or False for invalid.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <script type="text/javascript">
        function c1Upload1_ClientValidatedFile(e, args)
        {
            if (args.isValid) {
                var successFiles = $("#<%=TextBox1.ClientID%>");
                successFiles.val(successFiles.val() + args.file + "\r\n");
            }
            else {
                var invalidFiles = $("#<%=TextBox2.ClientID%>");
                invalidFiles.val(invalidFiles.val() + args.file + "\r\n");
            }
        }

        function clearlog()
        {
            $("#<%=TextBox1.ClientID%>").val("");
            $("#<%=TextBox2.ClientID%>").val("");
        }
    </script>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="settingcontainer">
                <div class="settingcontent">
                    <ul>
                        <li class="fullwidth"><label class="settinglegend">Custom validation:</label></li>
                        <li class="fullwidth">
                            <asp:CheckBox ID="Chk_JPG" runat="server" Text="*.JPG" />&nbsp;
                            <asp:CheckBox ID="Chk_PNG" runat="server" Text="*.PNG" />&nbsp;
                            <asp:CheckBox ID="Chk_GIF" runat="server" Text="*.GIF" />&nbsp;
                            <asp:CheckBox ID="Chk_BMP" runat="server" Text="*.BMP" />&nbsp;
                            <asp:CheckBox ID="Chk_DOC" runat="server" Text="*.DOC" />&nbsp;
                            <asp:CheckBox ID="Chk_TXT" runat="server" Text="*.TXT" />&nbsp;
                            <asp:CheckBox ID="Chk_ZIP" runat="server" Text="*.ZIP" />&nbsp;
                            <asp:CheckBox ID="Chk_RAR" runat="server" Text="*.RAR" />&nbsp;&nbsp;
                            <asp:Button ID="Apply" runat="server" Text="Apply"/>  
                        </li>
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
                    <input id="Button2" type="button" value="Clear Log" onclick="clearlog();"/>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
