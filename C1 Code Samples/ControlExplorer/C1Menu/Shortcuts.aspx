<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Shortcuts.aspx.cs" Inherits="ControlExplorer.C1Menu.Shortcuts" %>

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
					<wijmo:C1MenuItem ID="C1MenuItem10" runat="server" Separator="true"></wijmo:C1MenuItem>
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
		</Items>
	</wijmo:C1Menu>
	<script id="scriptInit" type="text/javascript">
		$(document).ready(function () {
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>This sample demonstrates how to create a menu with shortcut menu items.</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
