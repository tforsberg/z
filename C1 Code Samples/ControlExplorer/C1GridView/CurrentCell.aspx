<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CurrentCell.aspx.cs" Inherits="ControlExplorer.C1GridView.CurrentCell" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1GridView" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        function currentCellChanging(e, args) {
            var value = "(" + args.oldCellIndex + "," + args.oldRowIndex + ") -> (" +
                args.cellIndex + "," + args.rowIndex + ")";

            writeLog(value);
        }

        function currentCellChanged(e) {
            var curCell = $(e.target).c1gridview("currentCell");

            $("#currentValue").html((curCell) ? encode(curCell.value() + "") : "");
        }

        var log;
        function writeLog(value) {
            if (!log) {
                log = $("#log")[0];
            }

            if (log) {
                if (log.size < log.options.length + 1) {
                    log.options.length = 0;
                }
            }

            log.options[log.options.length] = new Option(value, "", false, false);
        }

        function encode(text) {
            var chars = Array("&", "<", ">", '"', "'");
            var replacements = Array("&amp;", "&lt;", "&gt;", "&quot;", "'");
            for (var i = 0; i < chars.length; i++) {
                var re = new RegExp(chars[i], "gi");
                if (re.test(text)) {
                    text = text.replace(re, replacements[i]);
                }
            }
            return text;
        }
    </script>

    <table>
        <colgroup>
            <col />
            <col width="10px" />
            <col />
        </colgroup>
        <tr>
            <td style="vertical-align: top">
                <wijmo:C1GridView ID="C1GridView1" runat="server" DataSourceID="SqlDataSource1" AllowKeyboardNavigation="true"
                    AutoGenerateColumns="false" ShowRowHeader="true" HighlightCurrentCell="true"
                     OnClientCurrentCellChanging="currentCellChanging" OnClientCurrentCellChanged="currentCellChanged">
                    <Columns>
                        <wijmo:C1BoundField DataField="OrderID" HeaderText="ID" />
                        <wijmo:C1BoundField DataField="ShipName" HeaderText="Ship name" />
                        <wijmo:C1BoundField DataField="ShipCity" HeaderText="Ship city" />
                        <wijmo:C1BoundField DataField="ShippedDate" HeaderText="Shipped date" DataFormatString="d" />
                    </Columns>
                </wijmo:C1GridView>
            </td>
            <td></td>
            <td style="vertical-align: top">
                <p>
                    <label for="log">OnCurrentCellChanging event log:</label>
                    <select multiple="multiple" id="log" size="6" style="width: 200px"></select>
                </p>
                <p>
                    Current cell value:
                    <span id="currentValue" />
                </p>
            </td>
        </tr>
    </table>
    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Provider=Microsoft.Jet.OLEDB.4.0;Data Source=|DataDirectory|\C1NWind.mdb;Persist Security Info=True"
        ProviderName="System.Data.OleDb" SelectCommand="SELECT TOP 10 [OrderID], [ShipName], [ShipCity], [ShippedDate] FROM ORDERS">
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The <strong>C1GridView</strong> supports operations on the current cell. The Current cell is a data cell having focus.
        <strong>C1GridView</strong> highlights the current cell position, tracks it changes, and allows 
        the retrieval of data value.
    </p>

    <p>
       The following properties are used in this sample:
    </p>
    <ul>
        <li><strong>AllowKeyboardNavigation</strong> - to allow user to change current cell position using keyboard.</li>
    </ul>
    <ul>
        <li><strong>HighlightCurrentCell</strong> - to highlight position of the current cell.</li>
    </ul>

    <p>
       The following client-side event handlers are used in this sample:
    </p>
    <ul>
        <li><strong>OnClientCurrentCellChanging</strong> - to track current cell position and write it into the log.</li>
        <li><strong>OnClientCurrentCellChanged</strong> - to update the currentValue element's html with the current cell data value.</li>
    </ul>

    <p>
       If the <strong>AllowKeyboardNavigation</strong> property is set to False then end-user can change the current cell position
       by clicking on data cells only.
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
