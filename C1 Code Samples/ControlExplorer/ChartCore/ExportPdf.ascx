<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExportPdf.ascx.cs" Inherits="ControlExplorer.ChartCore.ExportPdf" %>
<script type="text/javascript">
    $(function() {
        $("#exportPdf").click(exportPdf);
    });

	function exportPdf() {
		var fileName = $("#fileName").val();
        var url = $("#serverUrl").val() + "/exportapi/chart";
		var pdfSetting = {
			imageQuality: wijmo.exporter.ImageQuality[$("#imageQuality option:selected").val()],
			compression: wijmo.exporter.CompressionType[$("#compression option:selected").val()],
			fontType: wijmo.exporter.FontType[$("#fontType option:selected").val()],
			author: $("#pdfAuthor").val(),
			creator: $("#pdfCreator").val(),
			subject: $("#pdfSubject").val(),
			title: $("#pdfTitle").val(),
			producer: $("#pdfProducer").val(),
			keywords: $("#pdfKeywords").val(),
			encryption: wijmo.exporter.PdfEncryptionType[$("#encryption option:selected").val()],
			ownerPassword: $("#ownerPassword").val(),
			userPassword: $("#userPassword").val(),
			allowCopyContent: $("#allowCopyContent").prop('checked'),
			allowEditAnnotations: $("#allowEditAnnotations").prop('checked'),
			allowEditContent: $("#allowEditContent").prop('checked'),
			allowPrint: $("#allowPrint").prop('checked')
		}
        $(":data(<%=ChartWidgetType %>)").<%=C1ChartWidgetName%>("exportChart", fileName, "pdf", pdfSetting, url);
	}
</script>
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="exportPdf"/></li>
			<li class="fullwidth">
				<label class="settinglegend">File Content:</label>
			</li>
			<li>
				<label>Image Quality:</label>
				<select id="imageQuality">
					<option selected="selected" value="Default">Default</option>
					<option value="Low">Low</option>
					<option value="Medium">Medium</option>
					<option value="High">High</option>
				</select> 
			</li>
			<li>
				<label>Compression:</label>
				<select id="compression">
					<option selected="selected" value="Default">Default</option>
					<option value="None">None</option>
					<option value="BestSpeed">BestSpeed</option>
					<option value="BestCompression">BestCompression</option>
				</select> 
			</li>
			<li>
				<label>Font Type:</label>
				<select id="fontType">
					<option value="Standard">Standard</option>
					<option value="TrueType" selected="selected">TrueType</option>
					<option value="Embedded">Embedded</option>
				</select> 
			</li>
			<li class="fullwidth">
				<label class="settinglegend">Dcoument Info.:</label>
			</li>
			<li>
				<label>Author:</label><input type="text" value="ComponentOne" id="pdfAuthor"/>
			</li>
			<li>
				<label>Creator:</label><input type="text" value="ComponentOne" id="pdfCreator"/>
			</li>
			<li>
				<label>Subject:</label><input type="text" id="pdfSubject"/>
			</li>
			<li>
				<label>Title:</label><input type="text" value="Export" id="pdfTitle"/>
			</li>
			<li>
				<label>Producer:</label><input type="text" value="ComponentOne" id="pdfProducer"/>
			</li>
			<li>
				<label>Keywords:</label><input type="text" id="pdfKeywords"/>
			</li>
			<li class="fullwidth">
				<label class="settinglegend">Dcoument Security:</label>
			</li>
			<li class="fullwidth">
				<label>Encryption Type:</label>
				<select id="encryption">
					<option selected="selected" value="NotPermit">NotPermit</option>
					<option value="Standard40">Standard40</option>
					<option value="Standard128">Standard128</option>
					<option value="Aes128">Aes128</option>
				</select> 
			</li>
			<li>
				<label>OwnerPassword:</label><input type="password" id="ownerPassword"/>
			</li>
			<li>
				<label>User Password:</label><input type="password" id="userPassword"/>
			</li>
			<li><input type="checkbox" checked="checked" id="allowCopyContent"/><label class="widelabel">Allow Copy Content</label></li>
			<li><input type="checkbox" checked="checked" id="allowEditAnnotations"/><label class="widelabel">Allow Edit Annotations</label></li>
			<li><input type="checkbox" checked="checked" id="allowEditContent"/><label class="widelabel">Allow Edit Content</label></li>
			<li><input type="checkbox" checked="checked" id="allowPrint"/><label class="widelabel">Allow Print</label></li>
			<li class="fullwidth">
				<label class="settinglegend">Configuration:</label>
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