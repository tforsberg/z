<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetSourceCode.aspx.cs"
	Inherits="ControlExplorer.GetSourceCode" %>

<%@ Register Assembly="Wilco.SyntaxHighlighter" Namespace="Wilco.Web.SyntaxHighlighting"
	TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<title></title>
</head>
<body>
	<div id="sourceTab">
		<ul>
			<li><a href="#pageaspx">ASPX</a></li>
			<li><a href="#pagecs">CS</a></li>
		</ul>
		<div id="pageaspx">
			<cc1:SyntaxHighlighter ID="LblASPX" runat="server" Font-Names="Courier New" Mode="Source"
				Language="ASPX" CssClass="syntax">
			</cc1:SyntaxHighlighter>
		</div>
		<div id="pagecs">
			<cc1:SyntaxHighlighter ID="LblCS" runat="server" Font-Names="Courier New" Mode="Source"
				CssClass="syntax">
			</cc1:SyntaxHighlighter>
		</div>
	</div>
</body>
</html>
