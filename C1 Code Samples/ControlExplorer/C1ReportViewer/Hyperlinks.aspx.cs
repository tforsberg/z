using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using C1.C1Preview;

namespace ControlExplorer.C1ReportViewer
{

	using C1.Web.Wijmo.Controls.C1ReportViewer;
	using System.Drawing;

	public partial class Hyperlinks : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			C1ReportViewer.RegisterDocument("Hyperlinks", HyperlinksDoc.MakeDoc);
		}
	}

	public class HyperlinksDoc
	{
		static public C1PrintDocument MakeDoc()
		{
			C1PrintDocument doc = C1ReportViewer.CreateC1PrintDocument();

			doc.Style.FontSize += 2;

			// setup a page header with links to first|prev|next|last pages:
			RenderTable rtnav = new RenderTable();
			// suppress different display of visited hyperlinks for page navigator:
			rtnav.Style.VisitedHyperlinkAttrs = rtnav.Style.HyperlinkAttrs;
			// space things out
			rtnav.Style.Spacing.Bottom = "5mm";
			// add navigator links
			rtnav.Cells[0, 0].Text = "First page";
			rtnav.Cells[0, 0].RenderObject.Hyperlink = new C1Hyperlink(
				new C1LinkTargetPage(PageJumpTypeEnum.First), "Go to first page");
			rtnav.Cells[0, 1].Text = "Previous page";
			rtnav.Cells[0, 1].RenderObject.Hyperlink = new C1Hyperlink(
				new C1LinkTargetPage(PageJumpTypeEnum.Previous), "Go to previous page");
			rtnav.Cells[0, 2].Text = "Next page";
			rtnav.Cells[0, 2].RenderObject.Hyperlink = new C1Hyperlink(
				new C1LinkTargetPage(PageJumpTypeEnum.Next), "Go to next page");
			rtnav.Cells[0, 3].Text = "Last page";
			rtnav.Cells[0, 3].RenderObject.Hyperlink = new C1Hyperlink(
				new C1LinkTargetPage(PageJumpTypeEnum.Last), "Go to last page");
			doc.PageLayout.PageHeader = rtnav;

			// make the body of the document

			// make an anchor
			RenderText rt1 = new RenderText("This is text with anchor1.");
			// the name ("anchor1") will be used to jump to this link:
			rt1.Anchors.Add(new C1Anchor("anchor1"));
			rt1.Hyperlink = new C1Hyperlink(new C1LinkTargetPage(PageJumpTypeEnum.Last),
				"Go to the last page of the document");
			doc.Body.Children.Add(rt1);

			// add a link to open doc2:
			/*
			RenderText rt2 = new RenderText("Click here to open 'StylesInTables' document.");
			rt2.Hyperlink = new C1Hyperlink(new C1LinkTargetFile(
				"javascript:window.changeReport('','StylesInTables')"));
			doc.Body.Children.Add(rt2);
			*/

			// add filler
			for (int i = 0; i < 500; ++i)
				doc.Body.Children.Add(new RenderText(string.Format("... filler {0} ...", i)));

			// add hyperlink to anchor1
			RenderText rt3 = new RenderText("Click here to go to anchor1.");
			rt3.Hyperlink = new C1Hyperlink(new C1LinkTargetAnchor("anchor1"),
				"This is status text when the mouse hovers over link to anchor1");
			doc.Body.Children.Add(rt3);

			// to jump to a render object, an anchor is really not needed:
			RenderText rt4 = new RenderText("Click here to go to the middle of document.");
			rt4.Hyperlink = new C1Hyperlink(doc.Body.Children[doc.Body.Children.Count / 2]);
			rt4.Hyperlink.StatusText = "Go to the approximate middle of the document";
			doc.Body.Children.Add(rt4);

			// add image with hyperlink to a URL
			RenderImage ri1 = new RenderImage(Image.FromFile(HttpContext.Current.Server.MapPath("~/C1ReportViewer/Images/google.gif")));
			ri1.Hyperlink = new C1Hyperlink(new C1LinkTargetFile("http://www.google.com"),
				" Go googling... (Use Ctrl+Click in order to open link in a new window");
			doc.Body.Children.Add(ri1);


			RenderText rt5 = new RenderText("alert 'Hello'.");
			rt5.Hyperlink = new C1Hyperlink(new C1LinkTargetFile("javascript:alert('Hello')"));
			rt5.Hyperlink.StatusText = "Show 'Hello' message.";
			doc.Body.Children.Add(rt5);

			RenderText rt6 = new RenderText("printWithPreview");
			rt6.Hyperlink = new C1Hyperlink(new C1LinkTargetFile("exec:printWithPreview()"));
			rt6.Hyperlink.StatusText = "Preview and print report.";
			doc.Body.Children.Add(rt6);


			return doc;
		}
	}

}