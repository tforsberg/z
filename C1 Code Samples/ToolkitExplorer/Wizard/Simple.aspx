﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Simple.aspx.cs" Inherits="Wizard_Simple" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Wizard" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:Panel ID="Panel1" runat="server">
		<div>
			<p>
				Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec
				arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante.
				Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper
				leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
				tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel
				pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum.
				Nunc tristique tempus lectus.</p>
		</div>
		<div>
			<p>
				Morbi tincidunt, dui sit amet facilisis feugiat, odio metus gravida ante, ut pharetra
				massa metus id nunc. Duis scelerisque molestie turpis. Sed fringilla, massa eget
				luctus malesuada, metus eros molestie lectus, ut tempus eros massa ut dolor. Aenean
				aliquet fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam. Praesent
				in eros vestibulum mi adipiscing adipiscing. Morbi facilisis. Curabitur ornare consequat
				nunc. Aenean vel metus. Ut posuere viverra nulla. Aliquam erat volutpat. Pellentesque
				convallis. Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem euismod
				felis, eu ornare leo nisi vel felis. Mauris consectetur tortor et purus.</p>
		</div>
		<div>
			<p>
				Mauris eleifend est et turpis. Duis id erat. Suspendisse potenti. Aliquam vulputate,
				pede vel vehicula accumsan, mi neque rutrum erat, eu congue orci lorem eget lorem.
				Vestibulum non ante. Class aptent taciti sociosqu ad litora torquent per conubia
				nostra, per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim commodo
				pellentesque. Praesent eu risus hendrerit ligula tempus pretium. Curabitur lorem
				enim, pretium nec, feugiat nec, luctus a, lacus.</p>
			<p>
				Duis cursus. Maecenas ligula eros, blandit nec, pharetra at, semper at, magna. Nullam
				ac lacus. Nulla facilisi. Praesent viverra justo vitae neque. Praesent blandit adipiscing
				velit. Suspendisse potenti. Donec mattis, pede vel pharetra blandit, magna ligula
				faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque. Donec non libero
				sed nulla mattis commodo. Ut sagittis. Donec nisi lectus, feugiat porttitor, tempor
				ac, tempor vitae, pede. Aenean vehicula velit eu tellus interdum rutrum. Maecenas
				commodo. Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus hendrerit
				hendrerit.</p>
		</div>
		<div>
			<h4>
				Studio Enterprise</h4>
			<p>
				Seven platforms, hundreds of controls, one studio. Build awesome desktop, Web, and
				mobile apps with our tools for WinForms, WPF, ASP.NET, Silverlight, iPhone, Mobile,
				and ActiveX.</p>
		</div>
		<div>
			<h4>
				Studio for WinForms</h4>
			<p>
				Over 65 .NET controls, including the ones you can't get anywhere else. Studio for
				WinForms can handle anything, from a grid with a million rows to a chart with unlimited
				points.</p>
		</div>
		<div>
			<h4>
				Studio for WPF</h4>
			<p>
				Studio for WPF offers everything from advanced data binding to rich data visualizations
				included in grids, schedulers, charts, reports, and more.</p>
		</div>
		<div>
			<h4>
				Studio for ASP.NET AJAX</h4>
			<p>
				Do more with less code. Over 45 styled, supercharged, and easy-to-use controls built
				on Web standards including AJAX, CSS, and XHTML.</p>
		</div>
		<div>
			<h4>
				Studio for Silverlight</h4>
			<p>
				Industrial strength Silverlight controls you cannot find anywhere else. Download
				ComponentOne Studio? for Silverlight, play, and watch the Web shine.</p>
		</div>
		<div>
			<h4>
				Studio for iPhone</h4>
			<p>
				Use your existing ASP.NET skill set and take your Web apps to the iPhone. ComponentOne
				Studio? for iPhone gives you the iPhone UX.</p>
		</div>

    </asp:Panel>

    <wijmo:C1WizardExtender ID="WizardExtender1" runat="server" TargetControlID="Panel1" />

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
C1WizardExtender supports displaying contents without a tabbed interface.
</p>

<p>
To achieve this, just use div tags to create the pages without creating any headers. 
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
