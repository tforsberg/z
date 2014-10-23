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

namespace ControlExplorer.C1Carousel
{
    public partial class LoadOnDemand : System.Web.UI.Page
    {
        private const string TEXT = "{0} Vestibulum venenatis faucibus eros, vitae vulputate ipsum tempor ut. Donec ut ligula a metus volutpat sagittis. Duis sodales, lorem nec suscipit imperdiet, sapien metus tempor nibh, dapibus pulvinar lorem lacus molestie lacus. ";

        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack || IsCallback)//
            {
				List<ContentCarousel> list1 = GetDataSource("http://lorempixum.com/200/150/city/{0}");

				List<ContentCarousel> list2 = GetDataSource("http://lorempixum.com/300/200/sports/{0}");

                C1Carousel1.DataSource = list1;
                C1Carousel1.DataBind();

				C1Carousel2.DataSource = list2;
                C1Carousel2.DataBind();
            }
        }

        private List<ContentCarousel> GetDataSource(string urlFormatStr)
        {
            List<ContentCarousel> list = new List<ContentCarousel>();

            for (int i = 1; i < 11; i++)
            {
                list.Add(new ContentCarousel()
                {
                    Content = string.Format(TEXT, string.Format("{0}.The picture one, ", i.ToString())),
                    ImgUrl = string.Format(urlFormatStr, i.ToString()),
                    Caption = string.Format("Pic {0}",i.ToString())
                });
            }
            return list;
        }
    }
}
