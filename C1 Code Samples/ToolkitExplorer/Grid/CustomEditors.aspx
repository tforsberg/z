<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomEditors.aspx.cs" Inherits="ControlExplorer.Grid.CustomEditors" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1ComboBox" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        var positions = [
			    { label: "C", value: "C" },
			    { label: "D", value: "D" },
			    { label: "G", value: "G" },
			    { label: "LW", value: "LW" },
			    { label: "RW", value: "RW" }
		    ];

        function afterCellEdit(e, args) {
            switch (args.cell.column().dataKey) {
                case "Position":
                    args.cell.container().find("input").wijcombobox("destroy");
                    break;

                case "Age":
                case "Acquired":
                    args.cell.container().find("input").wijinputnumber("destroy");
                    break;
            }
		}

		function afterCellUpdate(e, args) {
		    $("#log").html(dump($(e.target).wijgrid("data")));
		}

		function beforeCellEdit(e, args) {
		    switch (args.cell.column().dataKey) {
		        case "Position":
		            $("<input />")
						.val(args.cell.value())
						.appendTo(args.cell.container().empty())
						.wijcombobox({
						    data: $.map($.extend(true, [], positions), function (item, index) {
						        if (item.value === args.cell.value()) {
						            item.selected = true;
						        }

						        return item;
						    }),
						    isEditable: false
						});

		            args.handled = true;

		            break;

                case "Age":
		        case "Acquired":
		            $("<input />")
						.width("100%")
						.appendTo(args.cell.container().empty())
						.wijinputnumber({
						    decimalPlaces: 0,
						    showSpinner: true,
						    value: args.cell.value()
						})
						.focus();

		            args.handled = true;

		            break;
		    }
		}

		function beforeCellUpdate(e, args) {
		    switch (args.cell.column().dataKey) {
		        case "Position":
		            args.value = args.cell.container().find("input").val();
		            break;

		        case "Age":
		            var $editor = args.cell.container().find("input"),
						value = $editor.wijinputnumber("getValue");

		            if (value < 1) {
		                $editor.addClass("ui-state-error")
		                alert("value must be greater than 0");
		                $editor.focus();
		                return false;
		            }

		            args.value = value;
		            break;
                    
		        case "Acquired":
		            var $editor = args.cell.container().find("input"),
						value = $editor.wijinputnumber("getValue"),
						curYear = new Date().getFullYear();

		            if (value < 1990 || value > curYear) {
		                $editor.addClass("ui-state-error")
		                alert("value must be between 1990 and " + curYear);
		                $editor.focus();
		                return false;
		            }

		            args.value = value;
		            break;
		    }
		}

		function dataLoaded(e) {
		    $("#log").html(dump($(e.target).wijgrid("data")));
		}

		function dump(d2array) {
		    var str = "<table class=\"ui-widget ui-widget-content\" rules=\"all\">" +
				"<caption class=\"ui-widget-header\">dump</caption>\n";

		    for (var i = 0, rowLen = d2array.length; i < rowLen; i++) {
		        var row = d2array[i];

		        str += "<tr>";

		        for (var key in row) {
		            if (row.hasOwnProperty(key)) {
		                str += "<td>" + row[key] + "</td>";
		            }
		        }

		        str += "</tr>\n";
		    }

		    return str + "</table>";
		}
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table runat="server" ID="demo"></asp:Table>
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowEditing="true"
        AllowKeyboardNavigation="true" HighlightCurrentCell="true"
        OnClientAfterCellEdit="afterCellEdit" OnClientAftercellupdate="afterCellUpdate"
        OnClientBeforecelledit="beforeCellEdit" OnClientBeforecellupdate="beforeCellUpdate"
        OnClientDataLoaded="dataLoaded">
    </wijmo:C1GridExtender>
        
    <hr />

    <div id="log">log</div>

    <wijmo:C1ComboBoxExtender runat="server" ID="ComboboxExtender1" TargetSelector="#foo" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        This sample shows how to customize the editors using the following wijgrid events: <b>beforecelledit</b>,
        <b>beforecellupdate</b>, <b>aftercellupdate</b> and <b>aftercelledit</b>.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
