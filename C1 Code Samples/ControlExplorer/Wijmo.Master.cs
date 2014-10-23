using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.IO;
using C1.Web.Wijmo.Controls.C1TreeView;

namespace ControlExplorer
{
    public partial class Wijmo : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindNavigation();
            RegisterCallbacks();
        }

        protected override void OnPreRender(EventArgs e)
        {
            RemoveUselessPane(this.Description, 1);
            RemoveUselessPane(this.ControlOptions, 0);

            base.OnPreRender(e);
        }

        private void RemoveUselessPane(ContentPlaceHolder cph, int index)
        {
            var needRemovePane = cph.Controls.Count == 0;

            if (cph.Controls.Count == 1 && (cph.Controls[0] is LiteralControl))
            {
                var lc = cph.Controls[0] as LiteralControl;

                if (string.IsNullOrEmpty(lc.Text.Trim(new char[] { '\r', '\n', '\t', ' ' })))
                {
                    needRemovePane = true;
                }
            }

            if (needRemovePane)
            {
                this.C1Accordion1.Panes.RemoveAt(index);
            }
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

            NavTreeView.Nodes.Clear();

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
                    BuildTreeViewNode<C1.Web.Wijmo.Controls.C1TreeView.C1TreeView>(NavTreeView, pageList);
                }
            }
            else
            {
                this.NavTreeView.Visible = false;
            }

            //Build documentation link
            var docPath = "http://helpcentral.componentone.com/nethelp/" + relativePaths[1].ToLower() + "wijmo/";
            if (relativePaths[1].ToLower().Contains("eventscalendar"))
            {
                //fix for evcal
                docPath = "http://helpcentral.componentone.com/nethelp/c1evcalwijmo/";
            }
			else if (relativePaths[1].ToLower().Contains("c1input")) {
				docPath = "http://helpcentral.componentone.com/nethelp/c1inputwijmo/";
			}
            docs.HRef = docPath;

            //Hide theme switcher for chart pages
            if (relativePaths[1].ToLower().Contains("chart") || relativePaths[1].ToLower().Contains("gauge"))
            {
                switcherContainer.Visible = false;
            }
        }
        private void BuildTreeViewNode<T>(T node, IEnumerable<XElement> actionList) where T : IC1TreeViewNodeCollectionOwner
        {
            foreach (XElement action in actionList.First().Elements("action"))
            {
                C1TreeViewNode n = new C1TreeViewNode();
                node.Nodes.Add(n);

                var page = action.Attribute("page");
                var name = action.Attribute("name");

                if (name != null)
                {
                    n.Text = name.Value;
                }

                if (page != null)
                {
                    n.Url = page.Value;

                    //Highlight treeview node.
                    if (page.Value.ToLower() == Request.AppRelativeCurrentExecutionFilePath.ToLower())
                    {
                        if (node is C1TreeViewNode)
                        {
                            (node as C1TreeViewNode).Expanded = true;
                        }

                        n.Selected = true;

                        var parent = action.Parent;
                        var ctrlName = string.Empty;
                        var title = n.Text; //action.name

                        do
                        {
                            var parentName = parent.Attribute("name");

                            if (parentName != null)
                            {
                                title = parentName.Value + " - " + title;

                                if (parent.Name.LocalName.ToLower().Equals("control"))
                                {
                                    ctrlName = parentName.Value;
                                    break;
                                }
                            }

                            parent = parent.Parent;

                        } while (parent != null);

                        Page.Title = title;
                        ControlName.InnerText = ctrlName;
                        ControlSampleLabel.Text = name.Value;
                    }
                }

                var subActions = action.Elements("subactions");

                if (subActions.Count() > 0)
                {
                    BuildTreeViewNode<C1TreeViewNode>(n, subActions);
                }
            }
        }
    }
}