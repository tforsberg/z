using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace ControlExplorer
{
	public partial class Default : System.Web.UI.Page
	{

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadData();
			}
		}

		private void LoadData()
		{
            BindFavoriteControls();
            BindNewFeatures();
		}

        private void BindFavoriteControls()
        {
            ControlData data = new ControlData();

            RptFavoriteControls.DataSource = data.GetFavoriteControls();
            RptFavoriteControls.DataBind();
        }

        private void BindNewFeatures()
        {
            FeatureData data = new FeatureData();

            RptWhatsNew.DataSource = data.GetWhatsNewFeatures();
            RptWhatsNew.DataBind();
        }
	}
}