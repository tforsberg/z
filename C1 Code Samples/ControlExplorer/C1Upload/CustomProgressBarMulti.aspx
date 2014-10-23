<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomProgressBarMulti.aspx.cs" Inherits="ControlExplorer.C1Upload.CustomProgressBarMulti" %>

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

        #fileList .fileName
        {
            width: 180px;
            white-space: nowrap;
            overflow: hidden;
            -ms-text-overflow: ellipsis;
            -o-text-overflow: ellipsis;
            text-overflow: ellipsis;
        }

        #fileList .size
        {
            width: 90px;
        }

        #fileList .uploaded
        {
            width: 90px;
        }

        #fileList .progress
        {
            width: 100px;
        }

        #fileList .elapsed
        {
            width: 110px;
        }

        #fileList .estimated  
        {
            width: 110px;
        }

        #fileList .speed  
        {
            width: 80px;
        }

        #fileList td  
        {
            height:22px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1Upload ID="c1Upload1" runat="server" Width="300px" ShowUploadedFiles="true"
        OnClientUpload="c1Upload1_ClientUpload" OnClientProgress="c1Upload1_ClientProgress" OnClientComplete="c1Upload1_ClientComplete" />

    <script id="scriptInit" type="text/javascript">

        var uploadFiles = [];

        function c1Upload1_ClientUpload(e, sender) {
            var filename = sender.parent().find(".wijmo-wijupload-file").text().replace(/; /g,";");

            if (uploadFiles[filename] == undefined) {
                var startTime = e.timeStamp;

                var fileNameTag = $("<td><div class='fileName'>" + filename + "</div></td>");
                var sizeTag = $("<td class='size'></td>");
                var uploadedTag = $("<td class='uploaded'></td>");
                var progressTag = $("<td><div class='progress'></div></td>");
                var elapsedTimeTag = $("<td class='elapsed'></td>");
                var estimatedTimeTag = $("<td class='estimated'></td>");
                var speedTag = $("<td class='speed'></td>");

                var fileRow = $("<tr></tr>");
                fileRow.append(fileNameTag);
                fileRow.append(sizeTag);
                fileRow.append(uploadedTag);
                fileRow.append(progressTag);
                fileRow.append(elapsedTimeTag);
                fileRow.append(estimatedTimeTag);
                fileRow.append(speedTag);

                $("#fileList").append(fileRow);

                var uploadFile = {
                    "fileName": filename,
                    "startTime": startTime,
                    "fileNameTag": fileNameTag,
                    "sizeTag": sizeTag,
                    "uploadedTag": uploadedTag,
                    "progressTag": progressTag,
                    "elapsedTimeTag": elapsedTimeTag,
                    "estimatedTimeTag": estimatedTimeTag,
                    "speedTag": speedTag,
                    "fileRow": fileRow
                }

                uploadFiles[filename] = uploadFile;

                progressTag.find(".progress").c1progressbar({ "value": 0 });
            }

            $('#<%=dialog.ClientID%>').c1dialog('open');
       }

        function c1Upload1_ClientProgress(e, args) {
            var filename = args.sender;
            var fileInfo = getFileInfo(filename);

            if (fileInfo) {
                fileInfo.sizeTag.html(formatSize(args.total));
                fileInfo.uploadedTag.html(formatSize(args.loaded));

                var elapsedTime = e.timeStamp - fileInfo.startTime;
                var speed = args.loaded / elapsedTime;
                var estimatedTime = Math.floor((args.total - args.loaded) / speed);

                fileInfo.progressTag.find(".progress").c1progressbar({ "value": args.loaded / args.total * 100 });

                fileInfo.elapsedTimeTag.html(formatTime(elapsedTime));
                fileInfo.estimatedTimeTag.html(formatTime(estimatedTime));
                fileInfo.speedTag.html(formatSize(speed * 1000) + "/S");
            }
        }

        function getFileInfo(filename)
        {
            for (f in uploadFiles)
            {
                if (f.indexOf(filename) != -1)
                {
                    return uploadFiles[f];
                }
            }
            return undefined;
        }

        function c1Upload1_ClientComplete(e, args) {
            var filename = $(args.input.context).children(":first-child").text();
            delete (uploadFiles[filename]);
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
            $("#fileList tr:first").nextAll().remove();
            $(this).c1dialog("close");
            $("#<%=c1Upload1.ClientID%> .wijmo-wijupload-cancelAll").click();
        }
        
    </script>
    <cc1:C1Dialog ID="dialog" runat="server" Height="400px" Width="800px" Title="Uploading..." ShowOnLoad="False" AppendTo="body" MaintainVisibilityOnPostback="False" Show="blind">
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
            <cc1:DialogButton Text="Cancel All" OnClientClick="cancelClick" />
        </Buttons>
        <Content>
            <table id="fileList" style="font-size: 12px">
                <tr style=" font-weight:bold">
                    <td class="fileName">File Name</td>
                    <td class="size">Size</td>
                    <td class="uploaded">Uploaded</td>
                    <td class="progress">Progress</td>
                    <td class="elapsed">Elapsed Time</td>
                    <td class="estimated">Estimated Time</td>
                    <td class="speed">Speed</td>
                </tr>
            </table>
        </Content>
    </cc1:C1Dialog>
    <wijmo:C1ProgressBar runat="server" ID="progressbar1" Value="0" MaxValue="100" Width="0" Height="0"></wijmo:C1ProgressBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1Upload</strong> allows you to upload file handling with comprehensive information about the upload progress. 
    </p>
    <p>
        This example shows how to show multi-file upload progress use custom progress bar by handling the <strong>OnClientUpload</strong>, <strong>OnClientProgress</strong> and <strong>OnClientComplete</strong> client-side event.
    </p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
