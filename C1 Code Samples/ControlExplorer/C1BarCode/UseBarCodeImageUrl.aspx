<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Wijmo.Master" CodeBehind="UseBarCodeImageUrl.aspx.cs" Inherits="ControlExplorer.C1BarCode.UseBarCodeImageUrl" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1BarCode"
    TagPrefix="wijmo" %>
<asp:Content ContentPlaceHolderID="Head" ID="Content1" runat="server">
</asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" ID="Content2" runat="server">
    
    <div >
        <div> Value in this BarCode is "1234567890"</div>
        <br />
        <asp:Image ID="Image1" runat="server" />
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" Runat="Server">
	    <p>
        <strong>C1BarCode </strong>provides a BarCode image which is encoded according to a special string value.
    </p>
    <p>
        Users can use the BarCode image directly by following code:
		<pre class="controldescription-code">if (!IsPostBack)
{
	C1BarCode barCode = new C1BarCode();
	barCode.Text = "1234567890";
	barCode.CodeType = WijmoCodeTypeEnum.Code128;

	this.Image1.ImageUrl = barCode.ImageUrl;
}</pre>
    </p>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" Runat="Server">
</asp:Content>