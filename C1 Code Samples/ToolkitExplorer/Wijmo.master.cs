using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;

namespace ToolkitExplorer
{
    public partial class Wijmo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindNavigation();
            RegisterCallbacks();

        }


        private void BindNavigation()
        {

            System.Xml.Linq.XElement xEle;
            if (Cache["ControlList"] == null)
            {
                xEle = System.Xml.Linq.XElement.Load(Server.MapPath("~/ControlList.xml"));
                Cache["ControlList"] = xEle;
            }
            else
            {
                xEle = (System.Xml.Linq.XElement)Cache["ControlList"];
            }
            IEnumerable<XElement> catalogs = from c in xEle.Elements("Control") select c;

            var relativePaths = Request.AppRelativeCurrentExecutionFilePath.Split('/');

            IEnumerable<XElement> pageList = from control2 in catalogs
                                             where control2.Attribute("name").Value.ToLower() == relativePaths[1].Replace("C1", "").ToLower()
                                             select control2;


            if (pageList != null)
            {
                if (pageList.Count() < 1)
                {
                    var childControls = from c in xEle.Descendants("ChildControl") select c;

                    pageList = from control2 in childControls
                               where control2.Attribute("name").Value.ToLower() == relativePaths[1].Replace("C1", "").ToLower()
                               select control2;
                }
                if (pageList.Count() > 0)
                {

                    this.navigation.Visible = true;
                    this.navigation.Controls.Clear();

                    HtmlGenericControl ulSideMenu = new HtmlGenericControl("ul");
                    ulSideMenu.Attributes["class"] = "sample-list";
                    navigation.Controls.Add(ulSideMenu);

                    foreach (XElement action in pageList.First().Elements("action"))
                    {
                        HtmlGenericControl li = new HtmlGenericControl("li");

                        ulSideMenu.Controls.Add(li);
                        HtmlGenericControl link = new HtmlGenericControl("a");
                        link.InnerHtml = action.Attribute("name").Value;
                        link.Attributes["href"] = ResolveClientUrl(action.Attribute("page").Value);
                        //link.Attributes["href"] = action.Attribute("page").Value.Substring(2);
                        li.Controls.Add(link);


                        if (action.Attribute("page").Value.ToLower() == Request.AppRelativeCurrentExecutionFilePath.ToLower())
                        {
                            li.Attributes["class"] = "demo-config-on";
                            Page.Title = action.Parent.Attribute("name").Value + " - " + action.Attribute("name").Value;
                            WidgetNameLebel.Text = action.Parent.Attribute("name").Value;
                            WidgetSampleLebel.Text = action.Attribute("name").Value;

                        }
                    }
                }
            }
            else
            {
                this.navigation.Visible = false;
            }

            //Build documentation link
			var docPath = "http://helpcentral.componentone.com/nethelp/c1wijmoextenders/#!Documents/c1" + relativePaths[1].ToLower() + "extender.htm";
            if (relativePaths[1].ToLower().Contains("eventscalendar"))
            {
                //fix for evcal
				docPath = "http://helpcentral.componentone.com/nethelp/c1wijmoextenders/#!Documents/c1eventscalendarexte.htm";
            }
			else if (relativePaths[1].ToLower().Contains("formdecorator")) 
			{
				docPath = "http://helpcentral.componentone.com/nethelp/c1wijmoextenders/#!Documents/formdecoratorextende.htm";
			}
            docs.HRef = docPath;

            //Hide theme switcher for chart pages
            if (relativePaths[1].ToLower().Contains("chart") || relativePaths[1].ToLower().Contains("gauge"))
            {
                switcherContainer.Visible = false;
            }
        }

		//private void BuildCodeView()
		//{
		//    string pagePath = Page.MapPath(Request.Url.AbsolutePath);
		//    string codePath = pagePath + ".cs";

		//    LblASPX.Text = File.ReadAllText(pagePath);
		//    LblCS.Text = File.ReadAllText(codePath);
		//}
    }
}