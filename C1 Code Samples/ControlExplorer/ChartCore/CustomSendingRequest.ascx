<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomSendingRequest.ascx.cs" Inherits="ControlExplorer.ChartCore.CustomSendingRequest" %>
<script type="text/javascript">
    $(function() {
        $("#exportFile").click(exportFile);
    });
	
	function exportFile() {
		wijmo.exporter.exportChart({
			sender: customSendingRequest,
			fileName: $("#fileName").val(),
			serviceUrl: $("#serverUrl").val()+"/exportapi/chart",
			chart: $(":data(<%=ChartWidgetType %>)").data("<%=ChartWidgetType %>"),
			exportFileType: wijmo.exporter.ExportFileType[$("#fileFormats > option:selected").val()],
		});
	}

     function customSendingRequest(content, setting) {
        var formInnerHtml = '<input type="hidden" name="type" value="application/json"/>';
        formInnerHtml += '<input type="hidden" name="data" value="' + _htmlSpecialCharsEntityEncode(content) + '" />';
        var $iframe = $("<iframe style='display: none' src='about:blank'></iframe>").appendTo("body");
        $iframe.ready(function () {
            var formDoc = _getiframeDocument($iframe);
            formDoc.write("<html><head></head><body><form method='Post' action='" + setting.serviceUrl + "'>" + formInnerHtml + "</form>dummy windows for postback</body></html>");
            var $form = $(formDoc).find('form');
            $form.submit();
        });
    }
    function _getiframeDocument($iframe) {
        var iframeDoc = $iframe[0].contentWindow || $iframe[0].contentDocument;
        if (iframeDoc.document) {
            iframeDoc = iframeDoc.document;
        }
        return iframeDoc;
    }
    var _htmlSpecialCharsRegEx = /[<>&\r\n"']/gm;
    var _htmlSpecialCharsPlaceHolders = {
        '<': 'lt;',
        '>': 'gt;',
        '&': 'amp;',
        '\r': "#13;",
        '\n': "#10;",
        '"': 'quot;',
        "'": 'apos;'
    };
    function _htmlSpecialCharsEntityEncode(str) {
        return str.replace(_htmlSpecialCharsRegEx, function (match) {
            return '&' + _htmlSpecialCharsPlaceHolders[match];
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