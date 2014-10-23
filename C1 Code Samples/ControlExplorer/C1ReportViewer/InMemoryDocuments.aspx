<%@ Page Title="" Language="C#" MasterPageFile="~/Wijmo.Master" AutoEventWireup="true" CodeBehind="InMemoryDocuments.aspx.cs" Inherits="ControlExplorer.C1ReportViewer.InMemoryDocument" %>

<%@ Register Assembly="C1.Web.Wijmo.Controls.3" Namespace="C1.Web.Wijmo.Controls.C1ReportViewer" TagPrefix="C1ReportViewer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style="width:720px">
    <C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" FileName="InMemoryBasicTable" Zoom="75%" Height="475px" Width="100%">
    </C1ReportViewer:C1ReportViewer>
</div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Description" runat="server">
    <p>
        The dynamic (in-memory) report sample.</p>
    <p>
        Dynamic report can be created at run time. You can register dynamic report document from code-behind by using the static <strong>C1ReportViewer.RegisterDocument </strong>method.</p>
    <p>
        The <strong>C1ReportViewer.RegisterDocument</strong> method accepts two parameters: the first parameter is the name of the dynamic report document; the second parameter is a delegate, which will be called in order to generate report document</p>
    <p>
        The <strong>FileName</strong> property should be set to the name of the dynamic report that is used as first parameter for the <strong>C1ReportViewer.RegisterDocument</strong> method.</p>
    <p>
        The following is a sample code how to register and display the dynamic report document:</p>
    <pre class="controldescription-code">
ASPX code:
-------------
	&lt;C1ReportViewer:C1ReportViewer runat="server" ID="C1ReportViewer1" 
		FileName="InMemoryBasicTable" Zoom="75%" Height="475px" Width="100%"&gt;
	&lt;/C1ReportViewer:C1ReportViewer&gt; 
ASPX.CS code:
-------------
	public partial class InMemoryDocument : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			C1ReportViewer.RegisterDocument("InMemoryBasicTable",
						BasicTable.MakeDoc);
		}
	}

	/// &lt;summary&gt;
	/// BasicTable in-memory document.
	/// &lt;/summary&gt;
	public class BasicTable
	{
		static public C1PrintDocument MakeDoc()
		{
			C1PrintDocument doc = C1ReportViewer.CreateC1PrintDocument();
			RenderText rtxt1 = new RenderText(doc);
			rtxt1.Text = "Some text goes here";
			rtxt1.Style.Font = new Font(rtxt1.Style.Font.FontFamily, 14);
			rtxt1.Style.Padding.Bottom = new C1.C1Preview.Unit("5mm");
			doc.Body.Children.Add(rtxt1);
			return doc;
		}
	}
</pre>
    <strong>Note</strong>:&nbsp; You can register several dynamic reports under different names and switch between these reports by changing the <strong>FileName</strong> property on the server side or the client side.
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ControlOptions" runat="server">
</asp:Content>
