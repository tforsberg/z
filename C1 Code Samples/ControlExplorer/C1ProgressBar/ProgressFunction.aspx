<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ProgressFunction.aspx.cs" Inherits="ControlExplorer.C1ProgressBar.ProgressFunction" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ProgressBar"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
 <wijmo:C1ProgressBar runat="server" ID="Progressbar1"
		onruntask="Progressbar1_RunTask" StartTaskButton="btnStart" 
		StopTaskButton="btnStop">
	</wijmo:C1ProgressBar>
	<asp:Button runat="server" ID="btnStart" Text="Start" />
	<asp:Button runat="server" ID="btnStop" Text="Stop" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p><strong>C1ProgressBar </strong>supports updating the progress value on the server.</p><br/>
	<p>To enable this scenario, the following properties and events 
		need to be used:</p>
	<ul>
		<li><strong>StartTaskButton</strong> - specifies the button id that starts a server side task.</li>
		<li><strong>StopTaskButton</strong> - specifies the button id that stops a server side task.</li>
		<li><strong>OnRunTask</strong> - the event that will be raised when the button associated with StartTaskButton is clicked.</li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
