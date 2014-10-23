<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientSide.aspx.cs" Inherits="ControlExplorer.C1Upload.ClientSide" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Upload" tagprefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Upload ID="c1Upload1" runat="server" ShowUploadedFiles="true" Width="300px" OnClientUpload="c1Upload1_ClientUpload" OnClientComplete="c1Upload1_ClientComplete" OnClientProgress="c1Upload1_ClientProgress" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1Upload</strong> includes several client-side events that allow you to manipulate the upload items in the <strong>C1Upload</strong> when an action such as adding a file or uploading a file occurs. 
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">

    <script type="text/javascript">
        function c1Upload1_ClientUpload(e, args) {
            clearlog();
            logMsg("UploadBegin");
            return confirm("Start uploading now?");
        }

        function c1Upload1_ClientComplete(e, args) {
            logMsg("UploadEnd");
        }

        function c1Upload1_ClientProgress(e, args) {
            logMsg("ProgressChanged");
        }
     
        function logMsg(msg)
        {
            $("#TextArea1").val($("#TextArea1").val() + "[" + msg + "]" + "\r\n");
        }
    
        function clearlog()
        {
            $("#TextArea1").val("");
        }
    </script>
    <div class="settingcontainer">
        <div class="settingcontent">
            <ul>
                <li class="fullwidth">
                    <label class="settinglegend">Client Event List:</label>
                </li>
                <li class="fullwidth autoheight">
                    <textarea id="TextArea1" name="S1" cols="20" style="height:100px;width:300px;"></textarea>
                </li>
            </ul>
        </div>
        <div class="settingcontrol">
            <input id="Button2" type="button" value="Clear Log" onclick="clearlog();"/>
        </div>
    </div>
</asp:Content>
