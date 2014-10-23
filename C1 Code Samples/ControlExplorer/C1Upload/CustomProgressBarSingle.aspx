<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomProgressBarSingle.aspx.cs" Inherits="ControlExplorer.C1Upload.CustomProgressBarSingle" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Upload" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Dialog" TagPrefix="cc1" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ProgressBar" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        .labelstyle
        {
            float: left;
            width: 150px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Upload ID="c1Upload1" runat="server" MaximumFiles="1" ShowUploadedFiles="true" Width="300px"
        OnClientUpload="c1Upload1_ClientUpload" OnClientProgress="c1Upload1_ClientProgress" />

    <script id="scriptInit" type="text/javascript">
        var c1Upload1StartTime = 0;
        function c1Upload1_ClientUpload(e, sender) {
            var filename = sender.parent().find(".wijmo-wijupload-file").text();
            $('#<%=dialog.ClientID%>').c1dialog('open');
            $("#<%=progressbar1.ClientID %>").c1progressbar("option", "value", 0);
            c1Upload1StartTime = e.timeStamp;
        }

        function c1Upload1_ClientProgress(e, args) {
            $("#<%=fileName.ClientID%>").html(args.sender);
            $("#<%=totalSize.ClientID%>").html(formatSize(args.total));
            $("#<%=uploadedSize.ClientID%>").html(formatSize(args.loaded));

            var elapsedTime = e.timeStamp - c1Upload1StartTime;
            var speed = args.loaded / elapsedTime;
            var estimatedTime = Math.floor((args.total - args.loaded) / speed);

            $("#<%=progressbar1.ClientID %>").c1progressbar("option", "value", args.loaded / args.total * 100);

            $("#<%=elapsedTime.ClientID%>").html(formatTime(elapsedTime));
            $("#<%=estimatedTime.ClientID%>").html(formatTime(estimatedTime));
            $("#<%=speed.ClientID%>").html(formatSize(speed * 1000) + "/S");
        }

        function formatTime(timeStamp) {
            var totalS = Math.floor(timeStamp / 1000);

            var s = totalS % 3600 % 60;
            var m = Math.floor((totalS % 3600) / 60);
            var h = Math.floor(totalS / 3600);

            var ss = s >= 10 ? s : "0" + s;
            var mm = m >= 10 ? m : "0" + m;

            return h + ":" + mm + ":" + ss;
        }

        function formatSize(size) {
            var kb = Math.floor((size * 1000) / 1024) / 1000;
            var mb = Math.floor((kb * 1000) / 1024) / 1000;
            var gb = Math.floor((mb * 1000) / 1024) / 1000;

            if (gb > 1) return gb + " GB";
            if (mb > 1) return mb + " MB";
            return kb + " KB";
        }

        function cancelClick() {
            $("#<%=c1Upload1.ClientID%> .wijmo-wijupload-cancelAll").click();
            $(this).c1dialog("close");
        }

    </script>
    <cc1:C1Dialog ID="dialog" runat="server" Height="420px" Width="600px" Title="Uploading..." ShowOnLoad="False" AppendTo="body" MaintainVisibilityOnPostback="False" Show="blind">
        <CollapsingAnimation Option=""></CollapsingAnimation>

        <ExpandingAnimation Option=""></ExpandingAnimation>

        <CaptionButtons>
            <Pin IconClassOn="ui-icon-pin-w" IconClassOff="ui-icon-pin-s"></Pin>

            <Refresh IconClassOn="ui-icon-refresh"></Refresh>

            <Minimize IconClassOn="ui-icon-minus"></Minimize>

            <Maximize IconClassOn="ui-icon-extlink"></Maximize>

            <Close IconClassOn="ui-icon-close"></Close>
        </CaptionButtons>
        <Buttons>
            <cc1:DialogButton Text="Cancel" OnClientClick="cancelClick" />
        </Buttons>
        <Content>
            <br />
            <span class="labelstyle">Current File: </span>
            <asp:Label ID="fileName" runat="server" Text=""></asp:Label>
            <br />
            <span class="labelstyle">Total Size: </span>
            <asp:Label ID="totalSize" runat="server" Text=""></asp:Label>
            <br />
            <span class="labelstyle">Uploaded Size: </span>
            <asp:Label ID="uploadedSize" runat="server" Text=""></asp:Label>
            <br />
            <br />

            <wijmo:C1ProgressBar runat="server" ID="progressbar1" Value="0" MaxValue="100" Width="100%"></wijmo:C1ProgressBar>
            <br />
            <br />

            <span class="labelstyle">Elapsed Time: </span>
            <asp:Label ID="elapsedTime" runat="server" Text=""></asp:Label>
            <br />
            <span class="labelstyle">Estimated Time: </span>
            <asp:Label ID="estimatedTime" runat="server" Text=""></asp:Label>
            <br />
            <span class="labelstyle">Speed: </span>
            <asp:Label ID="speed" runat="server" Text=""></asp:Label>
            <br />
        </Content>
    </cc1:C1Dialog>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Upload</strong> allows you to upload file handling with comprehensive information about the upload progress. 
    </p>
    <p>
        This example shows how to show single-file upload progress use custom progress bar by handling the <strong>OnClientUpload</strong> and <strong>OnClientProgress</strong> client-side event.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
