<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Filtering.aspx.cs" Inherits="ControlExplorer.Grid.Filtering" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Grid" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:Table runat="server" ID="demo"></asp:Table>
	<wijmo:C1GridExtender runat="server" ID="GridExtender1" TargetControlID="demo" ShowFilter="true">
		<Columns>
			<wijmo:C1Field DataType="Number" DataFormatString="n0" />
			<wijmo:C1Field DataType="Currency" ValueRequired="true" FilterOperator="GreaterOrEqual">
				<FilterValue ValueString="30" />
			</wijmo:C1Field>
			<wijmo:C1Field DataType="Number" DataFormatString="n0" FilterOperator="GreaterOrEqual">
				<FilterValue ValueString="5" />
			</wijmo:C1Field>
			<wijmo:C1Field DataType="Number" DataFormatString="p0" />
		</Columns>
	</wijmo:C1GridExtender>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample shows how you can filter data by enabling the <b>showFilter</b> option.
	</p>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>