<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Simple.aspx.cs" Inherits="Editor_Simple" %>

<%@ Register Assembly="C1.Web.Wijmo.Extenders.3" Namespace="C1.Web.Wijmo.Extenders.C1Editor"
	TagPrefix="wijmo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div>
		<asp:TextBox ID="TextBox1" runat="server"  Height="530" TextMode="MultiLine" 
			Width="760">
<h1>
				Mobile Web</h1>
                <p>
                The Mobile Web refers to the use of Internet-connected applications, or browser-based access to the Internet from a mobile device, such as a smartphone or tablet computer, connected to a wireless network.
</p>
<p>
Traditionally, access to the Web has been via fixed-line services. However, the Web is becoming more accessible by portable and wireless devices and in 2008 mobile access to the Internet exceeded desktop computer-based access for the first time (source: International Telecommunications Union, Oct 2009). The shift to mobile Web access has been accelerating with the rise since 2007 of larger multitouch smartphones, and of multitouch tablet computers since 2010. Both platforms provide better Internet access and browser- or application-based user Web experiences than previous generations of mobile devices have done.
</p>
<p>
The distinction between mobile Web applications and native applications is anticipated to become increasingly blurred, as mobile browsers gain direct access to the hardware of mobile devices (including accelerometers and GPS chips), and the speed and abilities of browser-based applications improve. Persistent storage and access to sophisticated user interface graphics functions may further reduce the need for the development of platform-specific native applications.</p>
			</asp:TextBox>
		<wijmo:C1EditorExtender ID="EditorExtender1" runat="server" TargetControlID="TextBox1"  Mode="Simple"/>

	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		Using the <strong>Mode</strong> property, you can provide an alternate toolbar that takes less space than the default Ribbon UI.
	</p>
</asp:Content>


