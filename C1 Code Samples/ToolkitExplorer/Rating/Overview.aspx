<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Overview.aspx.cs" Inherits="ToolkitExplorer.Rating.Overview" %>
<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Rating" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<div>
		<asp:DropDownList runat="server" ID="ratingSelect">
			<asp:ListItem Text="Below Average" Value="1"></asp:ListItem>
			<asp:ListItem Text="Average" Value="2"></asp:ListItem>
			<asp:ListItem Text="Above Average" Value="3" Selected="True"></asp:ListItem>
			<asp:ListItem Text="Awesome" Value="4"></asp:ListItem>
			<asp:ListItem Text="Epic" Value="5"></asp:ListItem>
		</asp:DropDownList>
		<wijmo:C1RatingExtender ID="ratingSelect_C1RatingExtender" runat="server" TargetControlID="ratingSelect">
		</wijmo:C1RatingExtender>
	</div>
	<div>
		<asp:Panel runat="server" ID="ratingRadio">
			<label for="input1a">Below Average</label>
			<input type="radio" id="input1a" value="1" name="rating" />
			<label for="input2a">Average</label>
			<input type="radio" checked="checked" id="input2a" value="2" name="rating"/>
			<label for="input3a">Above Average</label>
			<input type="radio" id="input3a" value="3" name="rating"/>
			<label for="input4a">Awesome</label>
			<input type="radio" id="input4a" value="4" name="rating"/>
			<label for="input5a">Epic</label>
			<input type="radio" id="input5a" value="5" name="rating"/>
		</asp:Panel>
		<wijmo:C1RatingExtender ID="ratingRadio_C1RatingExtender" runat="server" TargetControlID="ratingRadio">
		</wijmo:C1RatingExtender>
	</div>
	<div>
		<asp:Panel runat="server" ID="ratingDiv"></asp:Panel>
		<wijmo:C1RatingExtender ID="ratingDiv_C1RatingExtender" runat="server" TargetControlID="ratingDiv" Value="4">
		</wijmo:C1RatingExtender>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
	The C1RatingExtender(wijrating at client side) allows you to generates a customizable star rating widget automatically.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
