<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomHandleResponse.ascx.cs" Inherits="ControlExplorer.ChartCore.CustomHandleResponse" %>
<script type="text/javascript" src="<%= Page.ResolveUrl("~/explore/js/export/FileSaver.js") %>"></script>
<script type="text/javascript" src="<%= Page.ResolveUrl("~/explore/js/export/utils.js") %>"></script>
<script type="text/javascript">
    $(function() {
        $("#exportFile").click(exportFile);
    });
	
	function exportFile() {
		wijmo.exporter.exportChart({
			receiver: saveFile,
			contentType: "application/json",
			fileName: $("#fileName").val(),
			serviceUrl: $("#serverUrl").val()+"/exportapi/chart",
			chart: $(":data(<%=ChartWidgetType %>)").data("<%=ChartWidgetType %>"),
			exportFileType: wijmo.exporter.ExportFileType[$("#fileFormats > option:selected").val()],
		});
	}
</script>
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="exportFile"/></li>
            <li class="longinput">
				<label>Server Url:</label>
				<input type="text" id="serverUrl" value="http://demos.componentone.com/ASPNET/ExportService">
			</li>
            <li>
				<label>File Name:</label>
				<input type="text" id="fileName" value="export">
			</li>
		    <li>
			    <label>File Format:</label>
			    <select id="fileFormats">
				    <option selected="selected" value="Png">Png</option>
				    <option value="Jpg">Jpg</option>
				    <option value="Bmp">Bmp</option>
				    <option value="Gif">Gif</option>
				    <option value="Tiff">Tiff</option>
				    <option value="Pdf">Pdf</option>
			    </select> 
		    </li>
	    </ul>
    </div>
</div>