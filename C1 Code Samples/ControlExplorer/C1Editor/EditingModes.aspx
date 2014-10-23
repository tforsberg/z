<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="EditingModes.aspx.cs" Inherits="ControlExplorer.C1Editor.EditingModes" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<wijmo:C1Editor runat="server" ID="Editor1" Width="760" Height="530"></wijmo:C1Editor>
		</ContentTemplate>
	</asp:UpdatePanel>
	<script type="text/javascript">
		function switchview(index) {
			var eidtor = $("#<%= Editor1.ClientID %>");
			switch (index) {
				case 1:
					//sets the editor is "wysiwyg" mode.
					eidtor.c1editor("executeEditorAction", "wysiwyg");
					break;
				case 2:
					//sets the editor is "code" mode.
					eidtor.c1editor("executeEditorAction", "code");
					break;
				case 3:
					//sets the editor is "split" mode(wysiwyg and code).
					eidtor.c1editor("executeEditorAction", "split");
					break;
			}
		}

	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		<strong>C1Editor</strong> supports three editing views: design, source, and split. 
	The toolbar at the bottom of the Editor lets users switch between views.
	<strong>C1Editor</strong> also supports a full screen editing mode in which the control resizes to fit the entire browser window (or parent frame). 
	Full screen mode is available for all three editing views.
	</p>
	<p>The <strong>EditorMode</strong> property supports three values: </p>
	<ul>
		<li><strong>WYSIWYG </strong>-design view support.</li>
		<li><strong>Code </strong>-source view support.</li>
		<li><strong>Split </strong>-split view(design and source) support.</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<label>Editing Modes</label>
					<ul>
						<li>
							<input type="radio" id="view_Design" name="view" checked="checked" onclick="switchview(1)" />
                            <label for="view_Design">
                                Design View</label>
						</li>
						<li>
							 <input type="radio" id="view_Source" name="view" onclick="switchview(2)" />
                            <label for="view_Source">
                                Source View</label>
						</li>
						<li>
							<input type="radio" id="view_Split" name="view" onclick="switchview(3)" />
                            <label for="view_Split">
                                Split View</label>
						</li>
					</ul>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
