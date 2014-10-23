<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ColumnVisibility.aspx.cs" Inherits="ControlExplorer.Grid.ColumnVisibility" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            var grid = $("#<%=demo.ClientID %>"),
                columns = grid.wijgrid("option", "columns"),
                listContainer = $("#columnsList"),
                checkBox, isChecked;

            $.each(columns, function (index, col) {
                isChecked = (col.visible)
                    ? "checked = 'checked'"
                    : "";

                checkBox = $("<label><input type='checkbox' " + isChecked + " />" + col.headerText + "</label>");
                listContainer.append(checkBox);
                checkBox.click(function (e) {
                    columns[index].visible = $(this).children("input")[0].checked;
                    grid.wijgrid("doRefresh");
                })
            })
        });
    </script>

    <asp:GridView runat="server" ID="demo" DataSourceID="AccessDataSource1" ShowHeader="False" />

    <asp:AccessDataSource ID="AccessDataSource1" runat="server" 
        DataFile="~/App_Data/C1NWind.mdb" 
        SelectCommand="SELECT TOP 10 [ProductID], [UnitPrice], [UnitsInStock], [Discontinued] FROM [Products]">
    </asp:AccessDataSource>
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" AllowColSizing="true">
        <Columns>
            <wijmo:C1Field HeaderText="ID" />
            <wijmo:C1Field HeaderText="Unit Price" />
            <wijmo:C1Field HeaderText="Quantity" />
            <wijmo:C1Field HeaderText="Discontinued" />
        </Columns>
    </wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
    This sample illustrates how columns can be hidden using the <b>visible</b> option.
    To hide a particular column deselect the appropriate checkbox shown at the bottom of the grid.
    To show a particular column select the appropriate checkbox shown at the bottom of the grid.  
    </p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
    <label for="columnsList">Columns in Grid:</label>
    <div id="columnsList"></div>
</asp:Content>
