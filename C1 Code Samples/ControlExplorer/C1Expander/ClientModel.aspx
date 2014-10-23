<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="ClientModel.aspx.cs" Inherits="ControlExplorer.C1Expander.ClientModel" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="C1Expander" %>
<%@ Register Src="../ClientLogger.ascx" TagName="ClientLogger" TagPrefix="ClientLogger" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<ClientLogger:ClientLogger ID="ClientLogger1" runat="server" />
	<C1Expander:C1Expander runat="server" ID="C1Expander1">
		<Header>
			Header
		</Header>
		<Content>
			Vestibulum ut eros non enim commodo hendrerit. Donec porttitor tellus non magna.
			Nam ligula elit, pretium et, rutrum non, hendrerit id, ante. Nunc mauris sapien,
			cursus in.
		</Content>
	</C1Expander:C1Expander>
	<script type="text/javascript">
		$(document).ready(
		function () {
			$("#expandedOption")[0].checked = $("#<%=C1Expander1.ClientID%>").c1expander("option", "expanded");
			$("#allowExpandOption")[0].checked = $("#<%=C1Expander1.ClientID%>").c1expander("option", "allowExpand");
			$("#expandDirectionOption").val($("#<%=C1Expander1.ClientID%>").c1expander("option", "expandDirection"));
			$("#expandedOption").change(function () {
				var expanded = $("#expandedOption")[0].checked;
				$("#<%=C1Expander1.ClientID%>").c1expander("option", "expanded", expanded);
				log.message("expanded property changed to " + expanded);
			})

			$("#allowExpandOption").change(function () {
				var allowExpand = $("#allowExpandOption")[0].checked;
				$("#<%=C1Expander1.ClientID%>").c1expander("option", "allowExpand", allowExpand);
				log.message("allowExpand property changed to " + allowExpand);
			});

			$("#expandDirectionOption").change(function () {
				var selectedDir = $("#expandDirectionOption").val();
				$("#<%=C1Expander1.ClientID%>").c1expander("option", "expandDirection", selectedDir);
				log.message("expandDirection property changed to " + selectedDir);
			})

			$("#bindExpandEvents").change(function () {
				if ($("#bindExpandEvents")[0].checked) {
					$("#<%=C1Expander1.ClientID%>").bind("c1expanderbeforeexpand.sampleExpandEvents", function (e) {
						log.message("beforeExpand event fired.");
						/*if (confirm("Do you want to cancel beforeExpand event?")) {
						e.preventDefault();
						}*/
					}).bind("c1expanderafterexpand.sampleExpandEvents", function () {
						log.message("afterExpand event fired.");
					});
				} else {
					$("#<%=C1Expander1.ClientID%>").unbind(".sampleExpandEvents");
				}
			});

			$("#bindCollapseEvents").change(function () {
				if ($("#bindCollapseEvents")[0].checked) {
					$("#<%=C1Expander1.ClientID%>").bind("c1expanderbeforecollapse.sampleCollapseEvents", function (e) {
						log.message("beforeCollapse event fired.");
						/*if (confirm("Do you want to cancel beforeCollapse event?")) {
						e.preventDefault();
						}*/
					}).bind("c1expanderaftercollapse.sampleCollapseEvents", function () {
						log.message("afterCollapse event fired.");
					});
				} else {
					$("#<%=C1Expander1.ClientID%>").unbind(".sampleCollapseEvents");
				}
			});
		}
		);
	</script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>This sample shows how to modify the expander behavior and appearance using client-side script.</p>
	<p>The following client-side options are used in the sample:</p>
	<ul>
		<li><strong>expanded -</strong> determines the visibility state of the content 
    panel. If True, the content element is visible.</li>
		<li><strong>allowExpand -</strong> determines if the widget can expand. Set this 
    option to False if you want to disable the collapse/expand ability.</li>
		<li><strong>expandDirection -</strong> determines the content expand direction. 
    Available values are top, right, bottom, and left.</li>
	</ul>
	<p>The following client-side events used in the sample:</p>
	<ul>
		<li><strong>beforeCollapse</strong> -  occurs before the content area collapses. Return false or call event.preventDefault() in order to cancel event and prevent the content area from collapsing;</li>
		<li><strong>beforeExpand -</strong> occurs before the content area expands. Return false or call event.preventDefault() in order to cancel event and prevent the content area from expanding;</li>
		<li><strong>afterCollapse </strong>- occurs after the content area collapses;</li>
		<li><strong>afterExpand </strong>- occurs after the content area expands;</li>
	</ul>
	
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<ul>
				<li class="fullwidth">
					<input type="checkbox" id="expandedOption" />
					<label>
						expanded</label>
				</li>
				<li class="fullwidth">
					<label>
						expandDirection</label>
					<select id="expandDirectionOption">
						<option value="top" selected="selected">top</option>
						<option value="right">right</option>
						<option value="bottom">bottom</option>
						<option value="left">left</option>
					</select>
				</li>
				<li class="fullwidth">
					<input type="checkbox" id="allowExpandOption" />
					<label>
						allowExpand</label>
				</li>
				<li class="fullwidth">
					<input type="checkbox" id="bindCollapseEvents" />
					<label>
						Bind/Unbind collapse events</label>
				</li>
				<li class="fullwidth">
					<input type="checkbox" id="bindExpandEvents" />
					<label>
						Bind/Unbind expand events</label>
				</li>
			</ul>
		</div>
	</div>
	
</asp:Content>
