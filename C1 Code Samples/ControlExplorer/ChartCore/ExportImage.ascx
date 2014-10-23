<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExportImage.ascx.cs" Inherits="ControlExplorer.ChartCore.ExportImage" %>
<script type="text/javascript">
    $(function() {
        $("#exportImage").click(exportImage);
    });
	
    function exportImage() {
        var fileName = $("#fileName").val();
        var type = $("#fileFormats > option:selected").val();
        var url = $("#serverUrl").val() + "/exportapi/chart";
        $(":data(<%=ChartWidgetType %>)").<%=C1ChartWidgetName%>("exportChart", fileName, type, url);
    }
</script>
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="exportImage"/></li>
		    <li>
			    <label>File Format:</label>
			    <select id="fileFormats">
				    <option selected="selected" value="Png">Png</option>
				    <option value="Jpg">Jpg</option>
				    <option value="Bmp">Bmp</option>
				    <option value="Gif">Gif</option>
				    <option value="Tiff">Tiff</option>
			    </select> 
		    </li>
            <li>
				<label>File Name:</label>
				<input type="text" id="fileName" value="export">
			</li>
            <li class="longinput">
				<label>Server Url:</label>
				<input type="text" id="serverUrl" value="http://demos.componentone.com/ASPNET/ExportService">
			</li>
	    </ul>
    </div>
</div>