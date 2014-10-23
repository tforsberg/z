<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="AutoPostBack.aspx.cs" Inherits="ControlExplorer.C1AutoComplete.MultipleValues" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1AutoComplete"
    TagPrefix="wijmo" %>
<%@ Register Src="~/ServerSideLogger.ascx" TagPrefix="uc1" TagName="ServerSideLogger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1AutoComplete ID="C1AutoComplete1" runat="server" AutoPostBack="true" Width="250px" CssClass="serversidelogger-before"
		OnItemSelected="C1AutoComplete1_ItemSelected">
        <Items>
            <wijmo:C1AutoCompleteDataItem Label="c++" Value="c++" />
            <wijmo:C1AutoCompleteDataItem Label="java" Value="java" />
            <wijmo:C1AutoCompleteDataItem Label="php" Value="php" />
            <wijmo:C1AutoCompleteDataItem Label="coldfusion" Value="coldfusion" />
            <wijmo:C1AutoCompleteDataItem Label="javascript" Value="javascript" />
            <wijmo:C1AutoCompleteDataItem Label="asp" Value="asp" />
            <wijmo:C1AutoCompleteDataItem Label="ruby" Value="ruby" />
            <wijmo:C1AutoCompleteDataItem Label="python" Value="python" />
            <wijmo:C1AutoCompleteDataItem Label="c" Value="c" />
            <wijmo:C1AutoCompleteDataItem Label="scala" Value="scala" />
            <wijmo:C1AutoCompleteDataItem Label="groovy" Value="groovy" />
            <wijmo:C1AutoCompleteDataItem Label="haskell" Value="haskell" />
            <wijmo:C1AutoCompleteDataItem Label="perl" Value="perl" />
        </Items>
    </wijmo:C1AutoComplete>
	<uc1:ServerSideLogger runat="server" ID="ServerSideLogger" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        This is an example showing the feature that posts back to client after you select the autocomplete item.
        Set the<strong>AutoPostBack</strong> property to true to support this feature, give "ja" (for Java
        or JavaScript) a try.
    </p>
</asp:Content>
