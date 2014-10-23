<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.master" AutoEventWireup="true"
	CodeFile="Overview.aspx.cs" Inherits="Video_Overview" %>

<%@ Register assembly="C1.Web.Wijmo.Extenders.3" namespace="C1.Web.Wijmo.Extenders.C1Video" tagprefix="cc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
	<div class="container">
		<div class="header">
			<h2>
				Overview</h2>
		</div>
		<div class="main demo">
			<!-- Begin demo markup -->
		<asp:Panel ID="Panel1" runat="server">
			<video controls id="vid1" width="480" height="204">
				<source src="http://cdn.wijmo.com/movies/sintel-trailer.ogv" type='video/ogg; codecs="theora, vorbis"'>
				<source src="http://cdn.wijmo.com/movies/sintel-trailer.mp4" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"'>
			</video>
		</asp:Panel>
		<cc1:C1VideoExtender ID="Panel1_C1VideoExtender" runat="server" 
			TargetControlID="Panel1">

		</cc1:C1VideoExtender>
		<!-- End demo markup -->
		</div>
	</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
	<p>
		C1VideoExtender allows users to play the video in HTML5. 
	</p>
</asp:Content>
