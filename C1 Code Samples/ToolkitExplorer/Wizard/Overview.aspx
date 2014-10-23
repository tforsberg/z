<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true" CodeFile="Overview.aspx.cs" Inherits="Wizard_Overview" %>
<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Wizard" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <asp:Panel ID="Panel1" runat="server">

        <ul>
			<li>
				<h1>
					Step 1</h1>
				This is the first step</li>
			<li>
				<h1>
					Step 2</h1>
				This is the second step</li>
			<li>
				<h1>
					Step 3</h1>
				This is the third step</li>
			<li>
				<h1>
					Step 4</h1>
				This is the fourth step</li>
			<li>
				<h1>
					Step 5</h1>
				This is the fifth step</li>
			<li>
				<h1>
					Step 6</h1>
				This is the sixth step</li>
			<li>
				<h1>
					Step 7</h1>
				This is the seventh step</li>
			<li>
				<h1>
					Step 8</h1>
				This is the eighth step</li>
			<li>
				<h1>
					Step 9</h1>
				This is the nineth step</li>
		</ul>
		<div style="height:300px">
			<p>
				Proin elit arcu, rutrum commodo, vehicula tempus, commodo a, risus. Curabitur nec
				arcu. Donec sollicitudin mi sit amet mauris. Nam elementum quam ullamcorper ante.
				Etiam aliquet massa et lorem. Mauris dapibus lacus auctor risus. Aenean tempor ullamcorper
				leo. Vivamus sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
				tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et mauris vel
				pede varius sollicitudin. Sed ut dolor nec orci tincidunt interdum. Phasellus ipsum.
				Nunc tristique tempus lectus.</p>
		</div>
		<div style="height:300px">
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
		<div style="height:300px">
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
		<div style="height:300px">
			<h4>
				Studio Enterprise</h4>
			<p>
				Seven platforms, hundreds of controls, one studio. Build awesome desktop, Web, and
				mobile apps with our tools for WinForms, WPF, ASP.NET, Silverlight, iPhone, Mobile,
				and ActiveX.</p>
		</div>
		<div style="height:300px">
			<h4>
				Studio for WinForms</h4>
			<p>
				Over 65 .NET controls, including the ones you can't get anywhere else. Studio for
				WinForms can handle anything, from a grid with a million rows to a chart with unlimited
				points.</p>
		</div>
		<div style="height:300px">
			<h4>
				Studio for WPF</h4>
			<p>
				Studio for WPF offers everything from advanced data binding to rich data visualizations
				included in grids, schedulers, charts, reports, and more.</p>
		</div>
		<div style="height:300px">
			<h4>
				Studio for ASP.NET AJAX</h4>
			<p>
				Do more with less code. Over 45 styled, supercharged, and easy-to-use controls built
				on Web standards including AJAX, CSS, and XHTML.</p>
		</div>
		<div style="height:300px">
			<h4>
				Studio for Silverlight</h4>
			<p>
				Industrial strength Silverlight controls you cannot find anywhere else. Download
				ComponentOne Studio? for Silverlight, play, and watch the Web shine.</p>
		</div>
		<div style="height:300px">
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
	The WizardExtender is used to display sections of content on separate, navigable pages so you can save screen real estate or simplify input tasks by creating a series of forms. 
	</p>
	<p>		
	The samples in this section will help get you started with the WizardExtender.
	</p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
