<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	Inherits="FlipCard_Callback" CodeBehind="Callback.aspx.cs" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1FlipCard"
	TagPrefix="C1FlipCard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<C1FlipCard:C1FlipCard ID="FlipCard1" runat="server" Width="200" Height="300" AllowCallback="true" OnUpdateContent="FlipCard1_UpdateContent">
        <FrontPanel>
            Get ready to <em>flip</em> this!
        </FrontPanel>
	</C1FlipCard:C1FlipCard>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates the ability of <strong>C1FlipCard</strong> control to use callback event to update the content of the card.
	</p>
	<p>
		The <strong>C1FlipCard</strong> allows you to update content of <strong>FrontPanel</strong> through <strong>UpdateContent</strong> event callback. Remember to set <strong>AllowCallback</strong> property to true.
	</p>
</asp:Content>
