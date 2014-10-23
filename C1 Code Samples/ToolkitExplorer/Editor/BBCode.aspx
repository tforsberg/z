<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="BBCode.aspx.cs" Inherits="Editor_BBCode" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div>
		<asp:TextBox ID="TextBox1" runat="server"  Height="530" TextMode="MultiLine" 
			Width="760">
			This is some [B]sample text[/B]. You can visit [URL=http://componentone.com/]C-ONE[/URL].
			</asp:TextBox>
		<wijmo:C1EditorExtender ID="EditorExtender1" runat="server" TargetControlID="TextBox1"  Mode="Bbcode" />

	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The <strong>C1EditorExtender </strong>supports Bulletin Board Code (BBCode) which is a lightweight markup language used by a number of popular forums.
	</p>
		<p>BBCode mode is allowed if the following options are set to corresponding values: </p>
	<ul>
	<li><strong>Mode </strong>- takes effect when the value is "Bbcode".</li>
	</ul>
</asp:Content>
