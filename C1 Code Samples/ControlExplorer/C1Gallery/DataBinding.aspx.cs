using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;
using System.Collections.Generic;

namespace ControlExplorer.C1Gallery
{
    public partial class DataBinding : System.Web.UI.Page
    {
        private const string TEXT = "{0} Vestibulum venenatis faucibus eros, vitae vulputate ipsum tempor ut. Donec ut ligula a metus volutpat sagittis. Duis sodales, lorem nec suscipit imperdiet, sapien metus tempor nibh, dapibus pulvinar lorem lacus molestie lacus. ";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack || IsCallback)
            {
                bind();
                CheckBox1.Checked = C1Gallery1.LoadOnDemand;
            }
        }

        private void bind()
        {
			List<ContentGallery> list1 = GetDataSource("http://lorempixum.com/200/150/sports/{0}",
				"http://lorempixum.com/750/300/sports/{0}");

            C1Gallery1.DataSource = list1;
            C1Gallery1.DataImageUrlField = "ImgUrl";
            C1Gallery1.DataLinkUrlField = "LinkUrl";
            C1Gallery1.DataCaptionField = "Caption";
            C1Gallery1.DataBind();
        }

        private List<ContentGallery> GetDataSource(string urlFormatStr, string linkFormatStr)
        {
            List<ContentGallery> list = new List<ContentGallery>();

            for (int i = 1; i < 11; i++)
            {
                list.Add(new ContentGallery()
                {
                    Content = string.Format(TEXT, string.Format("{0}.The picture one, ", i.ToString())),
                    LinkUrl = string.Format(linkFormatStr, i.ToString()),
                    ImgUrl = string.Format(urlFormatStr, i.ToString()),
                    Caption = string.Format("Pic {0}", i.ToString())
                });
            }
            return list;
        }

        protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
        {
            C1Gallery1.LoadOnDemand = CheckBox1.Checked;
            bind();
        }
    }

    public class ContentGallery
    {
        public string Content
        { get; set; }

        public string ImgUrl
        { get; set; }

        public string LinkUrl
        { get; set; }

        public string Caption
        { get; set; }
    }
}
