<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ClientModel.aspx.cs" Inherits="ControlExplorer.C1Accordion.ClientObjectModel" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Accordion"
	TagPrefix="C1Accordion" %>
<%@ Register Src="../ClientLogger.ascx" TagName="ClientLogger" TagPrefix="ClientLogger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<C1Accordion:C1Accordion runat="server" ID="C1Accordion1" 
		OnClientSelectedIndexChanged="onClientSelectedIndexChanged" Width="80%">
		<Panes>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane1" runat="server">
				<Header>
					Step 1
				</Header>
				<Content>
					<h1>
						Step 1</h1>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac lacus ac nibh
					viverra faucibus. Mauris non vestibulum dui
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane2" runat="server">
				<Header>
					Step 2
				</Header>
				<Content>
					<h1>
						Step 2</h1>
					Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia
					Curae; Vestibulum ante ipsum primis in faucibus.
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane3" runat="server">
				<Header>
					Step 3
				</Header>
				<Content>
					<h1>
						Step 3</h1>
					Sed facilisis placerat commodo. Nam odio dolor, viverra eu blandit in, hendrerit
					eu arcu. In hac habitasse platea dictumst.
				</Content>
			</C1Accordion:C1AccordionPane>
			<C1Accordion:C1AccordionPane ID="Accordion1Pane4" runat="server" Expanded="True">
				<Header>
					Step 4
				</Header>
				<Content>
					<h1>
						Step 4</h1>
					Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ac lacus ac nibh
					viverra faucibus. Mauris non vestibulum dui.
				</Content>
			</C1Accordion:C1AccordionPane>
		</Panes>
	</C1Accordion:C1Accordion>
  <br/>
	<ClientLogger:ClientLogger ID="ClientLogger1" runat="server" />
	<script type="text/javascript">
		var selectedIndexInputUpdating = false;
		function updateSelectedIndexInput() {
			selectedIndexInputUpdating = true;
			var input = $("#selectedIndexInput");
			input.empty();
			var c1Accordion1 = $("#<%=C1Accordion1.ClientID%>");
		var count = c1Accordion1.c1accordion("count");
		if (count > 0) {
			for (var i = 0; i < count; i++) {
				input.append($("<option>").val(i).text(i));
			}
			input.val(c1Accordion1.c1accordion("option", "selectedIndex"));
		}
		selectedIndexInputUpdating = false;
	}

	function clearPanes() {
		$('#<%=C1Accordion1.ClientID%>	').c1accordion('clear');
		updateSelectedIndexInput();
	}

	function onClientSelectedIndexChanged(ev, args) {
		log.message("Event selectedIndexChanged fired. New selectedIndex value is " + args.newIndex);
		updateSelectedIndexInput();
	}
	var _dynPanesCount = 0;
	function addNewPane() {
		$("#<%=C1Accordion1.ClientID%>").c1accordion("add", "dyn header " + ++_dynPanesCount, "dyn content " + _dynPanesCount);
		updateSelectedIndexInput();
	}
	function insertNewPane() {
		var index = parseInt($("#paneIndexToInsert").val(), 10);
		if ((index || index === 0) && index >= 0 && index < $("#<%=C1Accordion1.ClientID%>").c1accordion("count") + 1) {
			_dynPanesCount++;
			$("#<%=C1Accordion1.ClientID%>").c1accordion("insert", index, "dyn header " + index, "dyn content " + index);
			updateSelectedIndexInput();
		} else {
			alert("Incorrect index: " + $("#paneIndexToInsert").val());
		}
	}
	function showPanesCount() {
		alert($("#<%=C1Accordion1.ClientID%>").c1accordion("count"));
	}
	function removePaneByIndex() {
		var index = parseInt($("#paneIndexToRemove").val(), 10);
		if ((index || index === 0) && index >= 0 && index < $("#<%=C1Accordion1.ClientID%>").c1accordion("count")) {
			$("#<%=C1Accordion1.ClientID%>").c1accordion("removeAt", index);
			log.message("Accordion pane " + index + " removed.");
			updateSelectedIndexInput();
		} else {
			alert("Incorrect index: " + $("#paneIndexToRemove").val());
		}
	}
	$(document).ready(function () {

		$("#requireOpenedPaneCheckBox")[0].checked = $("#<%=C1Accordion1.ClientID%>").c1accordion("option", "requireOpenedPane");
		updateSelectedIndexInput();

		$("#requireOpenedPaneCheckBox").bind("change", function () {
			var requireOpenedPane = $("#requireOpenedPaneCheckBox")[0].checked;
			$("#<%=C1Accordion1.ClientID%>").c1accordion("option", "requireOpenedPane", requireOpenedPane);
			log.message("Property requireOpenedPane changed to " + requireOpenedPane);
		});
	});

	function applySelectedIndex() {
		if (selectedIndexInputUpdating) return;

		var index = parseInt($("#selectedIndexInput").val(), 10);
		if ((index || index === 0) && index >= 0 && index < $("#<%=C1Accordion1.ClientID%>").c1accordion("count")) {
			$("#<%=C1Accordion1.ClientID%>").c1accordion("option", "selectedIndex", index);
			log.message("Property selectedIndex changed to " + index + "");
		} else {
			alert("Incorrect index: " + $("#selectedIndexInput").val());
		}
	}
</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>The sample shows how to modify accordion behavior or appearance using client side script.</p>
<p>List of the client-side options used in the sample:</p>
<ul>
<li><strong>requireOpenedPane</strong> - determines whether clicking the header will close the currently opened pane 
	(leaving all the accordion's panes closed);</li>
<li><strong>selectedIndex</strong> - the index of the currently expanded accordion pane;</li>
</ul>
<p>List of the client-side methods used in the sample:</p>
<ul>
<li><strong>add(header, content)</strong> - add an accordion pane to the end of the accordion;</li>
<li><strong>insert(index, header, content) </strong>- insert an accordion pane at the specified index;</li>
<li><strong>count() </strong>- gets the number of the accordion panes;</li>
<li><strong>removeAt(index) </strong>- remove the accordion pane by its index;</li>
<li><strong>clear() </strong>- remove all accordion panes.</li>
</ul>
<p>
The <strong>OnClientSelectedIndexChanged</strong> property is used to listen the
    <strong>selectedIndexChanged</strong> event on the client side:
<pre class="controldescription-code">
&lt;C1Accordion:C1Accordion runat="server" 
		ID="C1Accordion1" 		
		OnClientSelectedIndexChanged="onClientSelectedIndexChanged"&gt;
.....
&lt;/C1Accordion:C1Accordion&gt;
&lt;script language="javascript" type="text/javascript"&gt;
	function onClientSelectedIndexChanged(ev, args) {
		log.message("The new selectedIndex value is " + args.newIndex);
	}
&lt;/script&gt;
</pre>
</p>
<p>
The following code demonstrates how to add a new accordion pane using client-side script:
<pre class="controldescription-code">
$("#&lt;%=C1Accordion1.ClientID%&gt;").c1accordion("add", "my header", "my content");
</pre>
</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth">
		<input type="checkbox" id="requireOpenedPaneCheckBox" /><label for="requireOpenedPaneCheckBox">requireOpenedPane</label>
	</li>
	<li class="fullwidth">
		<Label>selectedIndex:</Label>
		<select id="selectedIndexInput" onchange="applySelectedIndex(); return false;"></select>
	</li>
	<li class="fullwidth">
		<label class="settinglegend">Panes:</label>
	</li>
	<li class="fullwidth">
		<input type="button" title="Get panes' count" value="Count" onclick="showPanesCount(); return false;"/>
		<input type="button" value="Add" onclick="addNewPane(); return false;"/>
		<input type="button" title="Remove all panes" value="Clear" onclick="clearPanes(); return false;"/>
	</li>
	<li class="fullwidth">
		<input type="button" title="Insert new pane" value="Insert at" onclick="insertNewPane(); return false;"/>
		<input type="text" id="paneIndexToInsert" value="0" />
	</li>
	<li class="fullwidth">
		<input type="button" title="Remove pane by index" value="Remove at" onclick="removePaneByIndex(); return false;"/>
		<input type="text" id="paneIndexToRemove" value="0" />
	</li>
</ul>
</div>
</div>
</asp:Content>
