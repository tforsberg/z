<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExportingPdf.aspx.cs" Inherits="ControlExplorer.C1GridView.ExportingPdf" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1GridView runat="server" ID="C1GridView1" AutogenerateColumns="False" DataSourceID="SqlDataSource1">
		<Columns>
			<wijmo:C1Band HeaderText="Product Information">
				<Columns>
					<wijmo:C1BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName">
						<ItemStyle HorizontalAlign="Center" />
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="UnitPrice" HeaderText="UnitPrice" SortExpression="UnitPrice">
					</wijmo:C1BoundField>
				</Columns>
			</wijmo:C1Band>
			<wijmo:C1Band HeaderText="Order Information">
				<Columns>
					<wijmo:C1BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
					</wijmo:C1BoundField>
			        <wijmo:C1CheckBoxField DataField="Discontinued" HeaderText="Discontinued" SortExpression="Discontinued">
			        </wijmo:C1CheckBoxField>
				</Columns>
			</wijmo:C1Band>
			<wijmo:C1Band HeaderText="Order Details">
				<Columns>
					<wijmo:C1BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate">
						<ItemStyle HorizontalAlign="Center" />
					</wijmo:C1BoundField>
					<wijmo:C1BoundField DataField="ShipName" HeaderText="ShipName" SortExpression="ShipName">
					</wijmo:C1BoundField>
				</Columns>
			</wijmo:C1Band>
		</Columns>
	</wijmo:C1GridView>
	<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:C1NWindConnectionString %>" ProviderName="<%$ ConnectionStrings:C1NWindConnectionString.ProviderName %>" 
    SelectCommand="SELECT top 25 [Order Details].OrderID, [Order Details].UnitPrice, [Order Details].Quantity,
     [Order Details].Discount, Products.ProductName, Orders.OrderDate, Orders.ShipName , Products.Discontinued
    FROM ((Products INNER JOIN [Order Details] ON Products.ProductID = [Order Details].ProductID) 
    INNER JOIN Orders ON [Order Details].OrderID = Orders.OrderID)"></asp:SqlDataSource>
<script type="text/javascript">
    $(function() {
        $("#exportPdf").click(exportPdf);
		addPaperKind();
		$("#paperKind").change(function(){
			var isCustom = wijmo.exporter.PaperKind[$("#paperKind option:selected").val()] == wijmo.exporter.PaperKind.Custom;
			$("#pageWidth").prop("disabled", !isCustom);
			$("#pageHeight").prop("disabled", !isCustom);
			$("#pageWidth").toggleClass("ui-state-disabled", !isCustom);
			$("#pageHeight").toggleClass("ui-state-disabled", !isCustom);
		});
    });
	
	function addPaperKind(){
		$.each(wijmo.exporter.PaperKind, function(item){
			if(!isNaN(parseInt(item))) return;
			$("#paperKind").append($("<option>").val(item).text(item).prop("selected",item=="Custom"));
		});
	}

	function getPdfSetting() {
	    return {
			repeatHeader: $("#repeatHeader").prop('checked'),
			landscape: $("#landscape").prop('checked'),
			autoFitWidth: $("#autoFitWidth").prop('checked'),
			pageSize: {
				width: parseFloat($("#pageWidth").val()),
				height: parseFloat($("#pageHeight").val())
			},
			paperKind: wijmo.exporter.PaperKind[$("#paperKind option:selected").val()],
			margins: {
				top: parseFloat($("#marginsTop").val()),
				right: parseFloat($("#marginsRight").val()),
				bottom: parseFloat($("#marginsBottom").val()),
				left: parseFloat($("#marginsLeft").val())
			},
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
	}

    function exportPdf() {
		var fileName = $("#fileName").val();
        var pdfSetting = getPdfSetting();
        var url = $("#serverUrl").val() + "/exportapi/grid";
        $("#<%=C1GridView1.ClientID%>").c1gridview("exportGrid", fileName, "pdf", pdfSetting, url);
	}
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates how to export <strong>C1GridView</strong> to Pdf files with settings by Export Service.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<div class="settingcontainer">
    <div class="settingcontent">
	    <ul>
		    <li class="fullwidth"><input type="button" value="Export" id="exportPdf"/></li>
		    <li class="narrowcheckbox"><input type="checkbox" checked="checked" id="repeatHeader"/><label class="widelabel">Repeat Grid Header</label></li>
			<li class="narrowcheckbox"><input type="checkbox" checked="checked" id="autoFitWidth"/><label class="widelabel">Auto Fit Width</label></li>
			<li class="narrowcheckbox"><input type="checkbox" checked="checked" id="landscape"/><label class="widelabel">Landscape</label></li>
			<li class="fullwidth"><label class="settinglegend">Margins:</label></li>
			<li>
				<label>Top(pt):</label><input type="text" value="72" id="marginsTop"/>
			</li>
			<li>
				<label>Right(pt):</label><input type="text" value="72" id="marginsRight"/>
			</li>
			<li>
				<label>Bottom(pt):</label><input type="text" value="72" id="marginsBottom"/>
			</li>
			<li>
				<label>Left(pt):</label><input type="text" value="72" id="marginsLeft"/>
			</li>
			<li>
				<label>Paper Kind:</label>
				<select id="paperKind">
				</select> 
			</li>
			<li class="fullwidth">
				<label class="settinglegend">Page Size:</label>
			</li>
			<li>
				<label>Width(pt):</label><input type="text" value="500" id="pageWidth"/>
			</li>
			<li>
				<label>Height(pt):</label><input type="text" value="900" id="pageHeight"/>
			</li>
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
				<label>Title:</label><input type="text" value="Export Grid" id="pdfTitle"/>
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
</asp:Content>
