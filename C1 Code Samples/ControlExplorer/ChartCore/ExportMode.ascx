<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExportMode.ascx.cs" Inherits="ControlExplorer.ChartCore.ExportMode" %>
<script type="text/javascript">
    $(function() {
        $("#exportFile").click(exportFile);
    });
	
	function exportFile() {
		wijmo.exporter.exportChart({
			fileName: $("#fileName").val(),
			serviceUrl: $("#serverUrl").val()+"/exportapi/chart",
			chart: $(":data(<%=ChartWidgetType %>)").data("<%=ChartWidgetType %>"),
			exportFileType: wijmo.exporter.ExportFileType[$("#fileFormats > option:selected").val()],
			method: wijmo.exporter.ChartExportMethod[$("#exportMode > option:selected").val()]
		});
	}
</script>
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="exportFile"/></li>
            <li>
				<label>Export Mode:</label>
			    <select id="exportMode">
				    <option selected="selected" value="Content">Content</option>
				    <option value="Options">Options</option>
			    </select> 
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
            <li class="longinput">
				<label>Server Url:</label>
				<input type="text" id="serverUrl" value="http://demos.componentone.com/ASPNET/ExportService">
			</li>
            <li>
				<label>File Name:</label>
				<input type="text" id="fileName" value="export">
			</li>
	    </ul>
    </div>
</div>