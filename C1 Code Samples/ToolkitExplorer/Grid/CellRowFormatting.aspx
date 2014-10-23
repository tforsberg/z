<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CellRowFormatting.aspx.cs" Inherits="ControlExplorer.Grid.CellRowFormatting" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Tooltip" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css">
		.wijmo-wijgrid 
		{
			min-height: 100px;
		}
	</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<script type="text/javascript">
		function rowStyleFormatter(args) {
			if ((args.state & $.wijmo.wijgrid.renderState.rendering) && (args.type & $.wijmo.wijgrid.rowType.data)) {
				args.$rows
					.css("cursor", "pointer")
					.click(function (e) {
						$("#tooltipAnchor").wijtooltip(
						{
							title: args.data.Name,
							content: "<img src=\"" + args.data.LargeCover + "\" />"
						}).wijtooltip("showAt", { x: e.pageX, y: e.pageY });
					});
			}
		}

		function ratingCellFormatter(args) {
			if (args.row.type & $.wijmo.wijgrid.rowType.data) {
				args.$container.closest("td").attr("title", args.row.data.Rating);

				var color = "#FF0000"; // red
				if (args.row.data.Rating > 3) {
					color = args.row.data.Rating < 4
						? "#FFFF00" // yellow
						: "#00FF00"; // green
				}

				$("<div />")
					.height(16)
					.width(0)
					.css("background-color", color)
					.appendTo(args.$container)
					.animate({ width: args.row.data.Rating * 20 + "%" }, 1000);

				return true;
			}
		}

		function coverCellFormatter(args) {
			if (args.row.type & $.wijmo.wijgrid.rowType.data) {
				args.$container
					.css("text-align", "center")
					.empty()
					.append($("<img />")
					.attr("src", args.row.data.Cover));

				return true;
			}
		}

		var wijDataSource = new wijdatasource({
			proxy: new wijhttpproxy({
				url: "http://odata.netflix.com/Catalog/Genres('Sci-Fi & Fantasy')/Titles",
				dataType: "jsonp",
				jsonp: "$callback",
				data: {
					$format: "json",
					$inlinecount: "allpages",
					$skip: 0,
					$top: 20
				},
				key: "d"
			}),
			reader: {
				read: function (dataSource) {
					dataSource.data = dataSource.data.results;
					new wijarrayreader([{ name: "Name", mapping: "Name" },
								{ name: "ReleaseYear", mapping: "ReleaseYear" },
								{ name: "Rating", mapping: "AverageRating" },
								{ name: "Synopsis", mapping: "ShortSynopsis" },
								{ name: "Cover", mapping: function (item) { return item.BoxArt.SmallUrl; } },
								{ name: "LargeCover", mapping: function (item) { return item.BoxArt.LargeUrl; } }]
							).read(dataSource);
				}
			}
		});
	</script>

	<a id="tooltipAnchor"></a>
	<asp:Table runat="server" ID="demo"></asp:Table>

	<wijmo:C1TooltipExtender runat="server" ID="TooltipExtender" TargetSelector="#foo">
	</wijmo:C1TooltipExtender>

	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowPaging="true" PageSize="5" RowStyleFormatter="rowStyleFormatter">
		<Data DataSourceID="wijDataSource" />
		<Columns>
			<wijmo:C1Field />
			<wijmo:C1Field /> 
			<wijmo:C1Field CellFormatter="ratingCellFormatter" />
			<wijmo:C1Field />
			<wijmo:C1Field CellFormatter="coverCellFormatter" />
			<wijmo:C1Field Visible="false" />
		</Columns>
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	This sample shows how to change the content, style and attributes of the column and row cells using jQuery.
	The <b>cellFormatter</b> option is used to format the cells and the <b>rowStyleFormatter</b> option is used
	to format the rows.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
