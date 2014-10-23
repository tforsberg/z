<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Template.aspx.cs" Inherits="ControlExplorer.C1Menu.Template" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Menu"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <style type="text/css">
        div#ctl00_ctl00_MainContent_WidgetTabs_ctl00
        {
            overflow: visible;
            overflow-y: visible;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<wijmo:C1Menu runat="server" ID="Menu1">
		<Items>
			<wijmo:C1MenuItem ID="C1MenuItem3" runat="server" Text="File">
				<Items>
					<wijmo:C1MenuItem ID="C1MenuItem1" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">New</a><span class="wijmo-wijmenu-icon-right">Ctrl+N</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem2" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">Open</a><span class="wijmo-wijmenu-icon-right">Ctrl+O</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem5" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">Save</a><span class="wijmo-wijmenu-icon-right">Ctrl+S</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem4" runat="server" Text="Edit">
				<Items>
					<wijmo:C1MenuItem ID="C1MenuItem6" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">Undo</a><span class="wijmo-wijmenu-icon-right">Ctrl+Z</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem10" runat="server" Separator="true">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem8" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">Cut</a><span class="wijmo-wijmenu-icon-right">Ctrl+X</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem7" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">Copy</a><span class="wijmo-wijmenu-icon-right">Ctrl+C</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem9" runat="server">
						<Template>
							<div>
								<a href="#" class="wijmo-wijmenu-text">Paste</a><span class="wijmo-wijmenu-icon-right">Ctrl+V</span>
							</div>
						</Template>
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
			<wijmo:C1MenuItem ID="C1MenuItem11" runat="server" Text="View">
				<Items>
					<wijmo:C1MenuItem ID="C1MenuItem12" runat="server">
						<Template>
							<span>
								<input id="checkbox1" type="checkbox" /><label for="checkbox1">Status Bar</label>
							</span>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem13" runat="server">
						<Template>
							<span>
								<input id="checkbox2" type="checkbox" /><label for="checkbox2">Side Bar</label>
							</span>
						</Template>
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem14" runat="server" Separator="true">
					</wijmo:C1MenuItem>
					<wijmo:C1MenuItem ID="C1MenuItem15" runat="server" Text="Character Encoding">
						<Items>
							<wijmo:C1MenuItem ID="C1MenuItem16" runat="server">
								<Template>
									<span>
										<input type="radio" name="radiobutton1" id="radio1" /><label for="radio1">Western (ISO-8859-1)</label>
									</span>
								</Template>
							</wijmo:C1MenuItem>
							<wijmo:C1MenuItem ID="C1MenuItem17" runat="server">
								<Template>
									<span>
										<input type="radio" name="radiobutton1" id="radio2" /><label for="radio2">Unicode (UTF-8)</label>
									</span>
								</Template>
							</wijmo:C1MenuItem>
						</Items>
					</wijmo:C1MenuItem>
				</Items>
			</wijmo:C1MenuItem>
		</Items>
	</wijmo:C1Menu>
	<script id="scriptInit" type="text/javascript">
		$(document).ready(function () {
			$(":input").wijradio().wijcheckbox();
			$(".wijmo-wijmenu-text").parent().bind("click", function () {
				$("#<%= Menu1.ClientID %>").c1menu("hideAllMenus");
			});
			$(".wijmo-wijmenu-link").hover(function () {
				$(this).addClass("ui-state-hover");
			}, function () {
				$(this).removeClass("ui-state-hover");
			})
		});

	</script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~/explore/js/jquery.wijmo.wijcheckbox.min.js") %>"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>You can provide rich content for menu items using menu item templates.  This sample provides a template with menus, shortcut menu items, radio buttons, 
		and check boxes.</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
