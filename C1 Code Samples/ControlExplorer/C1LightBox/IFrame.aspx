<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="IFrame.aspx.cs" Inherits="ControlExplorer.C1LightBox.IFrame" %>
<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1LightBox" TagPrefix="wijmo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

<wijmo:C1LightBox ID="C1LightBox1" runat="server" Player="Iframe" MaxWidth="960" MaxHeight="600">
	<Items>
		<wijmo:C1LightBoxItem ID="LightBoxItem2" Title="ComponentOne" Text="ComponentOne WebSite"
			ImageUrl="~/C1LightBox/images/small/componentone.png" 
			LinkUrl="http://www.componentone.com" />
		<wijmo:C1LightBoxItem ID="C1LightBoxItem3" Title="Microsoft" Text="Microsoft WebSite"
			ImageUrl="~/C1LightBox/images/small/microsoft.png" 
			LinkUrl="http://www.microsoft.com" />
	</Items>
</wijmo:C1LightBox>


</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">

<p>
<strong>C1LightBox</strong> supports displaying the content of URL in an iframe.
</p>

<p>
This is enabled by setting the <b>Player</b> property to Iframe.
</p>

<p>
In this sample, LightBox hosts the Yahoo, ComponentOne and Microsoft websites.
</p>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
