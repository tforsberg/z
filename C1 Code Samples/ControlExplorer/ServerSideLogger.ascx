<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ServerSideLogger.ascx.cs" Inherits="ControlExplorer.ServerSideLogger" %>
<div class="serversidelogger">
	<div class="serversidelogger-title">
	<asp:Label ID="TitleLb" runat="server">Server-side events:</asp:Label>
</div>
	<div class="serversidelogger-content">
		<asp:Label ID="ContentLb" runat="server"></asp:Label>
</div>
</div>
<div class="serversidelogger-after">
</div>