<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="ExpandDirection.aspx.cs" Inherits="ControlExplorer.C1Expander.ExpandDirection" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Expander"
	TagPrefix="C1Expander" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
	<style type="text/css" media="all">
		.ui-expander-left.wijmo-wijexpander .ui-expander-header,
		.ui-expander-right.wijmo-wijexpander .ui-expander-header,
		.ui-expander-left.wijmo-wijexpander .ui-expander-header a,
		.ui-expander-right.wijmo-wijexpander .ui-expander-header a
		{
			width: 32px;
			text-align: center;
			text-overflow: ellipsis;
			overflow: hidden;
		}
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<C1Expander:C1Expander runat="server" ID="C1Expander1">
				<Header>
			Header
		</Header>
				<Content>
					C1Expander control allows the user to show or hide any embedded or external content by clicking on an expander header.                    
				</Content>
			</C1Expander:C1Expander>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		The sample shows how to change the direction of the expanding content area from the client side.
	</p>
	<p>&nbsp;</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
		<ContentTemplate>
			<div class="settingcontainer">
				<div class="settingcontent">
					<ul>
						<li class="fullwidth">
							<label>Select Expand Direction:</label></li>
						<li class="fullwidth autoheight">
							<asp:RadioButtonList runat="server" Width="100%" ID="rblDirection" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblDirection_SelectedIndexChanged">
								<asp:ListItem Text="Top" Value="Top"></asp:ListItem>
								<asp:ListItem Text="Right" Value="Right"></asp:ListItem>
								<asp:ListItem Text="Bottom" Value="Bottom" Selected="True"></asp:ListItem>
								<asp:ListItem Text="Left" Value="Left"></asp:ListItem>
							</asp:RadioButtonList>
						</li>
					</ul>
				</div>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
