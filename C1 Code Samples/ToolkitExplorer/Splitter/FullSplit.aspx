<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="FullSplit.aspx.cs" Inherits="Splitter_FullSplit" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Splitter"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div style="height:300px;">
	<asp:Panel runat="server" ID="splitter">
		<div>
			panel1
		</div>
		<div>
			panel2
		</div>
	</asp:Panel>
    </div>
	<wijmo:C1SplitterExtender runat="server" ID="SplitterExtender1" TargetControlID="splitter" FullSplit="true"
		Orientation="Vertical" />
</asp:Content>
<asp:Content ID = "Content3" ContentPlaceHolderID = "Description" runat ="server">
	<p>A full-size splitter can be made with the FullSplit property.</p><br/>
	<p>Full-size splitter is made if the FullSplit property is set to true.</p><br/>
	<p>If the container's size is changed, then the client side refresh method should be triggered to refresh the splitter just like $(selector).wijsplitter("refresh").</p>
</asp:Content>
<asp:Content ID = "Content4" ContentPlaceHolderID = "ControlOptions" runat = "server">
</asp:Content>
