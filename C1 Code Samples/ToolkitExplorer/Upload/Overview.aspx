<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.Upload.Overview" %>

<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Upload" tagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
	<style type="text/css">
	.Loading
	{
		width: 37px;
		height: 37px;
		background-image: url("../images/waiting.gif");
	}
	</style>

	<script type="text/javascript">
		var supportXhr;
		var progressbar;
		function change(e, data) {
		}
		function complete(e, data) {
		}
		function progress(e, data) {
		}
		function totalComplete() {
			progressbar.fadeOut(1500, function () {
				if (supportXhr) {
					$("#progressbar").wijprogressbar("option", "value", 0);
				}
			});
		}
		function totalProgress(e, data) {
			if (supportXhr) {
				$("#progressbar").wijprogressbar("option", "maxValue", data.total);
				$("#progressbar").wijprogressbar("option", "value", data.loaded);
			}
		}
		function totalUpload() {
			progressbar.show();
		}
		function upload(e, data) {
		}

		function pageLoad() {
			progressbar = $("#progressbar");
			supportXhr = $("#ctl00_MainContent_uploadPanel").wijupload("supportXhr");
			if (supportXhr) {
				progressbar.wijprogressbar({ value: 0 });
			} else {
				progressbar.addClass("Loading");
			}
			progressbar.hide();
		}
	</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
	<asp:ScriptManager ID="ScriptManager1" runat="server">
	</asp:ScriptManager>
	<div style="height:300px">
		<asp:Panel runat="server" ID="uploadPanel" Width="300px"></asp:Panel>
		<wijmo:C1UploadExtender ID="uploadPanel_C1UploadExtender" runat="server" 
			Action="upload.ashx" onclientchange="change" onclientcomplete="complete" 
			onclientprogress="progress" onclienttotalcomplete="totalComplete" 
			onclienttotalprogress="totalProgress" onclienttotalupload="totalUpload" 
			onclientupload="upload" TargetControlID="uploadPanel">
		</wijmo:C1UploadExtender>
		<div id="progressbar"></div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	<p>
		The C1UploadExtender allows you upload multiply files. The sample shows how to customize a progress.</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>

