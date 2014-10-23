<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="NullText.aspx.cs" Inherits="ControlExplorer.C1InputDate.NullText" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Input" TagPrefix="wijmo" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ComboBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <wijmo:C1InputDate ID="C1InputDate1" runat="server" Width="350px" DateFormat="d" Placeholder="Birth date">
    </wijmo:C1InputDate>
    <br/>
    <wijmo:C1InputDate ID="C1InputDate2" runat="server" Width="350px" DateFormat="g" Placeholder="Flight time">
    </wijmo:C1InputDate>
    <br/>
    <wijmo:C1InputDate ID="C1InputDate3" runat="server" Width="350px" DateFormat="U" Placeholder="Type date here...">
    </wijmo:C1InputDate>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        C1InputDate displays inputting tips when blank date value is applied.<p>
            <p>
                You can select all the text, then delete, you show delte twice then leave focue, then the placeholder will show.
            </p>
    <p>
        Tips text is determined by the <b>PlaceHolder</b> property.
    </p>
</asp:Content>
