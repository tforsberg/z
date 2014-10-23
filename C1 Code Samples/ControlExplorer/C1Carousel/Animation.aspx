<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="Animation.aspx.cs" Inherits="ControlExplorer.C1Carousel.Animation" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1Carousel"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
	<wijmo:C1Carousel ID="C1Carousel1" runat="server" Width="750px" Height="300px" Display="1"
		EnableTheming="True">
		<Items>
			<wijmo:C1CarouselItem ID="C1CarouselItem1" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/1" Caption="Word Caption 1">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem2" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/2" Caption="Word Caption 2">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem3" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/3" Caption="Word Caption 3">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem4" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/4" Caption="Word Caption 4">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem5" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/5" Caption="Word Caption 5">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem6" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/6" Caption="Word Caption 6">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem7" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/7" Caption="Word Caption 7">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem8" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/8" Caption="Word Caption 8">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem9" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/9" Caption="Word Caption 9">
			</wijmo:C1CarouselItem>
			<wijmo:C1CarouselItem ID="C1CarouselItem10" runat="server" ImageUrl="http://lorempixum.com/750/300/abstract/10" Caption="Word Caption 10">
			</wijmo:C1CarouselItem>
		</Items>
		<PagerPosition>
			<My Left="Right"></My>
			<At Top="Bottom" Left="Right"></At>
		</PagerPosition>
	</wijmo:C1Carousel>
				</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ControlOptions" runat="server">
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
<ContentTemplate>
<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth"><label class="settinglegend">Animation:</label>
	<li>
		<label>Easing:</label>
		<asp:DropDownList id="EasingDdl" runat="server">
			<asp:ListItem value="Swing">Swing</asp:ListItem>
			<asp:ListItem value="Linear">Linear</asp:ListItem>
			<asp:ListItem value="EaseInQuad" selected="true">EaseInQuad</asp:ListItem>
			<asp:ListItem value="EaseOutQuad">EaseOutQuad</asp:ListItem>
			<asp:ListItem value="EaseInOutQuad">EaseInOutQuad</asp:ListItem>
			<asp:ListItem value="EaseInCubic">EaseInCubic</asp:ListItem>
			<asp:ListItem value="EaseOutCubic">EaseOutCubic</asp:ListItem>
			<asp:ListItem value="EaseInOutCubic">EaseInOutCubic</asp:ListItem>
			<asp:ListItem value="EaseInQuart">EaseInQuart</asp:ListItem>
			<asp:ListItem value="EaseOutQuart">EaseOutQuart</asp:ListItem>
			<asp:ListItem value="EaseInOutQuart">EaseInOutQuart</asp:ListItem>
			<asp:ListItem value="EaseInQuint">EaseInQuint</asp:ListItem>
			<asp:ListItem value="EaseOutQuint">EaseOutQuint</asp:ListItem>
			<asp:ListItem value="EaseInOutQuint">EaseInOutQuint</asp:ListItem>
			<asp:ListItem value="EaseInSine">EaseInSine</asp:ListItem>
			<asp:ListItem value="EaseOutSine">EaseOutSine</asp:ListItem>
			<asp:ListItem value="EaseInOutSine">EaseInOutSine</asp:ListItem>
			<asp:ListItem value="EaseInExpo">EaseInExpo</asp:ListItem>
			<asp:ListItem value="EaseOutExpo">EaseOutExpo</asp:ListItem>
			<asp:ListItem value="EaseInOutExpo">EaseInOutExpo</asp:ListItem>
			<asp:ListItem value="EaseInCirc">EaseInCirc</asp:ListItem>
			<asp:ListItem value="EaseOutCirc">EaseOutCirc</asp:ListItem>
			<asp:ListItem value="EaseInOutCirc">EaseInOutCirc</asp:ListItem>
			<asp:ListItem value="EaseInElastic">EaseInElastic</asp:ListItem>
			<asp:ListItem value="EaseOutElastic">EaseOutElastic</asp:ListItem>
			<asp:ListItem value="EaseInOutElastic">EaseInOutElastic</asp:ListItem>
			<asp:ListItem value="EaseInBack">EaseInBack</asp:ListItem>
			<asp:ListItem value="EaseOutBack">EaseOutBack</asp:ListItem>
			<asp:ListItem value="EaseInOutBack">EaseInOutBack</asp:ListItem>
			<asp:ListItem value="EaseInBounce">EaseInBounce</asp:ListItem>
			<asp:ListItem value="EaseOutBounce">EaseOutBounce</asp:ListItem>
			<asp:ListItem value="EaseInOutBounce">EaseInOutBounce</asp:ListItem>
		</asp:DropDownList>
	</li>
	<li>
		<label>Duration:</label>
		<asp:TextBox runat="server" ID="DurationTxt" Text="1000" />
	</li>
</ul>
</div>
	<div class="settingcontrol">
	<asp:Button ID="ApplyBtn" Text="Apply" CssClass="settingapply" runat="server" OnClick="ApplyBtn_Click"/>
	</div>
</div>
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Description" runat="server">
<p>The animation effect of the <strong>C1Carousel</strong> scrolling can be set by <strong>Animation</strong> property.</p>
</asp:Content>
