<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomizedIcon.aspx.cs" Inherits="ToolkitExplorer.Rating.CustomizedIcon" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Rating" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<h4>
		String 24</h4>
	<div>
		<asp:Panel runat="server" ID="Panel1"></asp:Panel>
		<wijmo:C1RatingExtender ID="Panel1_C1RatingExtender" runat="server" TargetControlID="Panel1" 
			 Value="4" Count="6" TotalValue="6" IconHeight="24" IconWidth="24">
			<ResetButton Disabled="true" />
			<Hint Content="Bad,Below Average,Average,Above Average,Awesome,Epic" />
			<Icons>
				<IconsClass IconClass="wijmo-wijrating-normal-24" />
				<HoverIconsClass IconClass="wijmo-wijrating-hover-24" />
				<RatedIconsClass IconClass="wijmo-wijrating-rated-24" />
			</Icons>
		</wijmo:C1RatingExtender>
	</div>

	<h4>
		String 32</h4>
	<div>
		<asp:Panel runat="server" ID="Panel2"></asp:Panel>
		<wijmo:C1RatingExtender ID="Panel2_C1RatingExtender" runat="server" TargetControlID="Panel2" Value="4" Count="6" TotalValue="6" IconHeight="32" IconWidth="32">
			<ResetButton Disabled="true" />
			<Hint Content="Bad,Below Average,Average,Above Average,Awesome,Epic" />
			<Icons>
				<IconsClass IconClass="wijmo-wijrating-normal-32" />
				<HoverIconsClass IconClass="wijmo-wijrating-hover-32" />
				<RatedIconsClass IconClass="wijmo-wijrating-rated-32" />
			</Icons>
		</wijmo:C1RatingExtender>
	</div>

	<h4>
		Thumb</h4>
	<div>
		<asp:Panel runat="server" ID="Panel3"></asp:Panel>
		<wijmo:C1RatingExtender ID="Panel3_C1RatingExtender" runat="server" TargetControlID="Panel3" Count="2" TotalValue="2" IconHeight="16" IconWidth="16">
			<ResetButton Disabled="true" />
			<Hint Content="Like,Dislike" />
			<Icons>
				<IconsClass IconsClass="wijmo-wijrating-normal-thumbdown,wijmo-wijrating-normal-thumbup" />
				<HoverIconsClass IconsClass="wijmo-wijrating-hover-thumbdown,wijmo-wijrating-hover-thumbup" />
				<RatedIconsClass IconsClass="wijmo-wijrating-rated-thumbdown,wijmo-wijrating-rated-thumbup" />
			</Icons>
		</wijmo:C1RatingExtender>
	</div>

	<h4>
		Array</h4>
	<div>
		<asp:Panel runat="server" ID="Panel4"></asp:Panel>
		<wijmo:C1RatingExtender ID="Panel4_C1RatingExtender" runat="server" TargetControlID="Panel4" IconHeight="61" IconWidth="11" 
			Value="4" Count="6" TotalValue="6">
			<ResetButton Disabled="true" />
			<Hint Content="Bad,Below Average,Average,Above Average,Awesome,Epic" />
			<Icons>
				<IconsClass IconsClass="wijmo-wijrating-normal-bar-11,wijmo-wijrating-normal-bar-21,wijmo-wijrating-normal-bar-31,wijmo-wijrating-normal-bar-41,wijmo-wijrating-normal-bar-51,wijmo-wijrating-normal-bar-61" />
				<HoverIconsClass IconsClass="wijmo-wijrating-hover-bar-11,wijmo-wijrating-hover-bar-21,wijmo-wijrating-hover-bar-31,wijmo-wijrating-hover-bar-41,wijmo-wijrating-hover-bar-51,wijmo-wijrating-hover-bar-61" />
				<RatedIconsClass IconsClass="wijmo-wijrating-rated-bar-11,wijmo-wijrating-rated-bar-21,wijmo-wijrating-rated-bar-31,wijmo-wijrating-rated-bar-41,wijmo-wijrating-rated-bar-51,wijmo-wijrating-rated-bar-61" />
			</Icons>
		</wijmo:C1RatingExtender>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how to use rating extender to create a rating widget simply with customized icon.</p>
</asp:Content>
