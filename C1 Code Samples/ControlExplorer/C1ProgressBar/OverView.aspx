<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="OverView.aspx.cs" Inherits="ControlExplorer.C1ProgressBar.OverView" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ProgressBar" TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div>Horizontal Progressbar</div>
<div>
<wijmo:C1ProgressBar runat="server" ID="HProgressbar" Value="50" 
		onruntask="HProgressbar_RunTask"></wijmo:C1ProgressBar>
</div>
<div style="clear:both">Vertical Progressbar</div>
<wijmo:C1ProgressBar runat="server" ID="VProgressbar" FillDirection="South" Value="50"></wijmo:C1ProgressBar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
<p>Showing a fixed indication or a real-time indicator of progress is quick and easy 
	for web developers using <strong>C1ProgressBar</strong>. 
  By default, the progress bar is horizontal, you can change the orientation by setting the 
	<strong>FillDirection</strong> property to North or South; in this sample, the 
	<strong>FillDirection</strong> option is set to North.</p><br/>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
