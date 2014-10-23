<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="CustomizedIcon.aspx.cs" Inherits="ControlExplorer.C1Rating.CustomizedIcon" %>
<%@ Register assembly="C1.Web.Wijmo.Controls.3" namespace="C1.Web.Wijmo.Controls.C1Rating" tagprefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
				<h4>
					String 24</h4>
				<div>
					<wijmo:C1Rating ID="C1Rating1" runat="server" Value="4" Count="6" TotalValue="6" IconHeight="24" IconWidth="24">
						<Hint Content="Bad,Below Average,Average,Above Average,Awesome,Epic" />
						<Icons>
							<IconsClass IconClass="wijmo-wijrating-normal-24" />
							<HoverIconsClass IconClass="wijmo-wijrating-hover-24" />
							<RatedIconsClass IconClass="wijmo-wijrating-rated-24" />
						</Icons>
					</wijmo:C1Rating>
				</div>

				<h4>
					String 32</h4>
				<div>
					<wijmo:C1Rating ID="C1Rating2" runat="server" Value="4" Count="6" TotalValue="6" IconHeight="32" IconWidth="32">
						<Hint Content="Bad,Below Average,Average,Above Average,Awesome,Epic" />
						<Icons>
							<IconsClass IconClass="wijmo-wijrating-normal-32" />
							<HoverIconsClass IconClass="wijmo-wijrating-hover-32" />
							<RatedIconsClass IconClass="wijmo-wijrating-rated-32" />
						</Icons>
					</wijmo:C1Rating>
				</div>

				<h4>
					Thumb</h4>
				<div>
					<wijmo:C1Rating ID="C1Rating3" RatingMode="Single" runat="server" Count="2" TotalValue="2" IconHeight="16" IconWidth="16">
						<Hint Content="Dislike,Like" />
						<Icons>
							<IconsClass IconsClass="wijmo-wijrating-normal-thumbdown,wijmo-wijrating-normal-thumbup" />
							<HoverIconsClass IconsClass="wijmo-wijrating-hover-thumbdown,wijmo-wijrating-hover-thumbup" />
							<RatedIconsClass IconsClass="wijmo-wijrating-rated-thumbdown,wijmo-wijrating-rated-thumbup" />
						</Icons>
					</wijmo:C1Rating>
				</div>

				<h4>
					Array</h4>
				<div>
					<wijmo:C1Rating ID="C1Rating4" runat="server" IconHeight="61" IconWidth="11" 
						Value="4" Count="6" TotalValue="6">
						<Hint Content="Bad,Below Average,Average,Above Average,Awesome,Epic" />
						<Icons>
							<IconsClass IconsClass="wijmo-wijrating-normal-bar-11,wijmo-wijrating-normal-bar-21,wijmo-wijrating-normal-bar-31,wijmo-wijrating-normal-bar-41,wijmo-wijrating-normal-bar-51,wijmo-wijrating-normal-bar-61" />
							<HoverIconsClass IconsClass="wijmo-wijrating-hover-bar-11,wijmo-wijrating-hover-bar-21,wijmo-wijrating-hover-bar-31,wijmo-wijrating-hover-bar-41,wijmo-wijrating-hover-bar-51,wijmo-wijrating-hover-bar-61" />
							<RatedIconsClass IconsClass="wijmo-wijrating-rated-bar-11,wijmo-wijrating-rated-bar-21,wijmo-wijrating-rated-bar-31,wijmo-wijrating-rated-bar-41,wijmo-wijrating-rated-bar-51,wijmo-wijrating-rated-bar-61" />
						</Icons>
					</wijmo:C1Rating>
				</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
	<p>This sample demonstrates how to create a rating control with customized images.</p>
</asp:Content>
