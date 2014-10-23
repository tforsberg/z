<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="EncodingException.aspx.cs" Inherits="ControlExplorer.C1BarCode.EncodingException" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BarCode" TagPrefix="wijmo" %>
<%@ Register Src="~/ServerSideLogger.ascx" TagPrefix="uc1" TagName="ServerSideLogger" %>

<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
    
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server"><asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
			<ContentTemplate>
        <br />
        <wijmo:C1BarCode ID="C1BarCode1" runat="server" AutoSize="true" CssClass="serversidelogger-before"/>
		<uc1:ServerSideLogger runat="server" id="ServerSideLogger" Title="The Encoding Exception Message:"/>
        <br />
			</ContentTemplate>
		</asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
    <p>
        <strong>C1BarCode </strong>provides a BarCode image which is encoded according to a special string value.
    </p>
    <p>
        Most encodings have limitations that determine what type of text it can represent. For example,
         some are numeric-only and some require text of a specific length.
    </p>
    <p>
        If the value of the "Text" property cannot be represented using the current
         "CodeType", then no bar code will be generated and the control will remain blank.
    </p>
    <p>
        In this case, the <b>EncodingException</b> property returns details about the exception
         that prevented the bar code from being generated.
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
	<asp:UpdatePanel ID="UpdatePanel2" runat="server">
			<ContentTemplate>
				<div class="settingcontainer">
<div class="settingcontent">
<ul>
	<li class="fullwidth">
		<label>Choose the barcode type:</label>
        <asp:DropDownList ID="BarCodeTypeDdl" runat="server">
                <asp:ListItem Text="Code39" Value="Code39" Selected="true" />
                <asp:ListItem Text="Code93" Value="Code93" />
                <asp:ListItem Text="Code128" Value="Code128" />
                <asp:ListItem Text="CodeI2of5" Value="CodeI2of5" />
                <asp:ListItem Text="Codabar" Value="Codabar" />
                <asp:ListItem Text="PostNet" Value="PostNet" />
                <asp:ListItem Text="Ean13" Value="Ean13" />
                <asp:ListItem Text="Ean8" Value="Ean8" />
                <asp:ListItem Text="UpcA" Value="UpcA" />
                <asp:ListItem Text="UpcE" Value="UpcE" />
        </asp:DropDownList>
		</li>
		<li class="fullwidth autoheight">
			<label>Input the Text you want to encode:</label>
		</li>
		<li><asp:TextBox ID="ValueTxt" TextMode="MultiLine" runat="server" Text="1234567890"></asp:TextBox>
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
