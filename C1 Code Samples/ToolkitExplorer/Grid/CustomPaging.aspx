<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomPaging.aspx.cs" Inherits="ControlExplorer.Grid.CustomPaging" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

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
		var localData = new wijdatasource({
			dynamic: true,
			loading: function (dataSource, userData) {
				var r = userData.data.paging;
				var fooData = [];

				for (var i = r.pageIndex * r.pageSize; i < (r.pageIndex + 1) * r.pageSize; i++) {
					fooData.push({ "ID": i, "Name": "Name" + i });
				}

				dataSource.data = {
					totalRows: 100,
					rows: fooData
				}
			}
		});

		var remoteData = new wijdatasource({
			dynamic: true,
			proxy: new wijhttpproxy({
				url: "http://netflix.cloudapp.net/Catalog/Genres('Horror Movies')/Titles/",
				dataType: "jsonp",
				jsonp: "$callback",
				data: {
					$format: "json",
					$inlinecount: "allpages",
					$select: "Name,ReleaseYear,AverageRating,BoxArt"
				},
				key: "d"
			}),

			reader: {
				read: function (dataSource) {
					var count = parseInt(dataSource.data.__count, 10);

					$("#entries").text("(" + count + " entries found)");

					dataSource.data = dataSource.data.results;
					dataSource.data.totalRows = count;

					new wijarrayreader([{ name: "Name", mapping: "Name" },
							{ name: "ReleaseYear", mapping: "ReleaseYear" },
							{ name: "Rating", mapping: "AverageRating" },
							{ name: "Cover", mapping: function (item) { return item.BoxArt.SmallUrl; } }]
						).read(dataSource);
				}
			},

			loading: function (dataSource, userData) {
				var r = userData.data.paging;
				dataSource.proxy.options.data.$skip = r.pageIndex * r.pageSize;
				dataSource.proxy.options.data.$top = r.pageSize;
			}
		});

		function coverFormatter(args) {
			if (args.row.type & $.wijmo.wijgrid.rowType.data) {
				args.$container
					.css("text-align", "center")
					.empty()
					.append($("<img />")
					.attr("src", args.row.data.Cover));

				return true;
			}
		}
	</script>

	<p>Custom paging using local data</p>
	<asp:Table ID="demoLocal" runat="server"></asp:Table>
	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demoLocal" AllowPaging="true" PageSize="5">
		<Data DataSourceID="localData" />
	</wijmo:C1GridExtender>

	<p>Custom paging using remote data <span id="entries">...</span></p>
	<asp:Table ID="demoRemote" runat="server"></asp:Table>
	<wijmo:C1GridExtender runat="server" ID="GridExtender2" TargetControlID="demoRemote" AllowPaging="true" PageSize="5">
		<Data DataSourceID="remoteData" />
		<Columns>
			<wijmo:C1Field />
			<wijmo:C1Field />
			<wijmo:C1Field />
			<wijmo:C1Field  CellFormatter="coverFormatter"/>
		</Columns>
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how to use custom paging using local and remote data.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
