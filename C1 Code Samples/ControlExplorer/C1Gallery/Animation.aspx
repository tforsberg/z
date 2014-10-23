<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true"
	CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1Gallery.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Gallery"
	TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
		<ContentTemplate>
			<cc1:C1Gallery ID="Gallery" runat="server" ShowTimer="True" Width="750px" Height="256px"
				ThumbnailOrientation="Vertical" ThumbsDisplay="3" ShowPager="false">
				<Transitions>
					<Animated Disabled="false" Effect="slide" />
				</Transitions>
				<Items>
					<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/1" ImageUrl="http://lorempixum.com/200/150/sports/1" />
					<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/2" ImageUrl="http://lorempixum.com/200/150/sports/2" />
					<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/3" ImageUrl="http://lorempixum.com/200/150/sports/3" />
					<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/4" ImageUrl="http://lorempixum.com/200/150/sports/4" />
					<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/5" ImageUrl="http://lorempixum.com/200/150/sports/5" />
					<cc1:C1GalleryItem LinkUrl="http://lorempixum.com/750/300/sports/6" ImageUrl="http://lorempixum.com/200/150/sports/6" />
				</Items>
			</cc1:C1Gallery>
		</ContentTemplate>
	</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		This sample demonstrates animation effects when transitioning from one image to
        the next.
	</p>
	<p>Set following properties to support this feature:</p>
	<ul>
		<li><b>Transitions</b></li>
	</ul>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
	<div class="settingcontainer">
		<div class="settingcontent">
			<asp:UpdatePanel ID="UpdatePanel2" runat="server">
				<ContentTemplate>
					<ul>
						<li>
							<label for="showingEffectTypes">
								Animation
							</label>

							<asp:DropDownList ID="showEffectTypes" runat="server" AutoPostBack="true" OnSelectedIndexChanged="showEffectTypes_SelectedIndexChanged">
								<asp:ListItem Value="blind" Selected="True">Blind</asp:ListItem>
								<asp:ListItem Value="clip">Clip</asp:ListItem>
								<asp:ListItem Value="drop">Drop</asp:ListItem>
								<asp:ListItem Value="explode">Explode</asp:ListItem>
								<asp:ListItem Value="fade">Fade</asp:ListItem>
								<asp:ListItem Value="fold">Fold</asp:ListItem>
								<asp:ListItem Value="highlight">Highlight</asp:ListItem>
								<asp:ListItem Value="puff">Puff</asp:ListItem>
								<asp:ListItem Value="pulsate">Pulsate</asp:ListItem>
								<asp:ListItem Value="scale">Scale</asp:ListItem>
								<asp:ListItem Value="size">Size</asp:ListItem>
								<asp:ListItem Value="slide">Slide</asp:ListItem>
							</asp:DropDownList>

						</li>
					</ul>
				</ContentTemplate>
			</asp:UpdatePanel>
		</div>
	</div>


</asp:Content>
