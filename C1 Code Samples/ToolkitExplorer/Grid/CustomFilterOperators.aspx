<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomFilterOperators.aspx.cs" Inherits="ControlExplorer.Grid.CustomFilterOperators" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
    <script type="text/javascript">
        function fop1(dataVal, filterVal) {
            if (dataVal) {
                dataVal = dataVal.toLowerCase();
                filterVal = filterVal.toLowerCase();

                if (dataVal.indexOf(filterVal) === 0) {
                    var idx = dataVal.lastIndexOf(filterVal);
                    return idx > 0 && dataVal.length - idx === filterVal.length;
                }
            }

            return false;
        }

        function fop2(dataVal) {
            return dataVal % 2 === 0;
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Table ID="demo" runat="server"></asp:Table>
  
    <wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" ShowFilter="true" AllowSorting="true">
        <Columns>
            <wijmo:C1Field />
            <wijmo:C1Field DataType="Number" DataFormatString="n0" />
        </Columns>
        <CustomFilterOperators>
            <wijmo:CustomFilterOperator ApplicableTo="String" Arity="2" Name="BeginsEndsWith" Operator="fop1" />
            <wijmo:CustomFilterOperator ApplicableTo="Number, Currency" Arity="1" Name="Even" Operator="fop2" />
        </CustomFilterOperators>
    </wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        wijgrid allows custom filter operators. This sample shows two custom filters available in the filter drop down.
    </p>
    <ul>
        <li>BeginsEndsWith: applicable to string columns, filters values starting and ending with some string.</li>
        <li>Even: applicable to numeric columns, filters even values.</li>
    </ul>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
