<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
    CodeBehind="Overview.aspx.cs" Inherits="ControlExplorer.C1AutoComplete.WebForm1" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1AutoComplete"
    TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1AutoComplete ID="C1AutoComplete1" runat="server" Width="250px">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        <strong>C1AutoComplete </strong>provides suggestions while you type into the
        field. Here the suggestions are tags for programming languages, give "ja" (for Java
        or JavaScript) a try.
    </p>
    <p>
        Users can set the data items, the minimum number of characters, the position of
        the Autocomplete in relation to the associated input element.
    </p>
</asp:Content>
