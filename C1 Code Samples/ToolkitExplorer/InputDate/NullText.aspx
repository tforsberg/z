<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="NullText.aspx.cs" Inherits="ControlExplorer.C1InputDate.NullText" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Input" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    	<asp:TextBox ID="TextBox1" runat="server" Width="350px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate1" runat="server"  TargetControlID="TextBox1" DateFormat="d" Placeholder="Birth date">
    </wijmo:C1InputDateExtender>
    <br/>
    <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate2" runat="server" TargetControlID="TextBox2" DateFormat="g" Placeholder="Flight time">
    </wijmo:C1InputDateExtender>
    <br/>
    <asp:TextBox ID="TextBox3" runat="server" Width="350px"></asp:TextBox>
    <wijmo:C1InputDateExtender ID="C1InputDate3" runat="server" TargetControlID="TextBox3" DateFormat="U" Placeholder="Type date here...">
    </wijmo:C1InputDateExtender>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
    <p>
        wijinputdate displays inputting tips when blank date value is applied.<p>
        <p>
                You can select all the text, then delete, you show delte twice then leave focue, then the placeholder will show.
            </p>
    <p>
        Tips text is determined by the <b>PlaceHolder</b> property.
    </p>
</asp:Content>
