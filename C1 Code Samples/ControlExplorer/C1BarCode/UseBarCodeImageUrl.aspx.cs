using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1BarCode
{
    using C1.Web.Wijmo.Controls.C1BarCode;

    public partial class UseBarCodeImageUrl : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                C1BarCode barCode = new C1BarCode();
                barCode.Text = "1234567890";
                barCode.CodeType = WijmoCodeTypeEnum.Code128;

                this.Image1.ImageUrl = barCode.ImageUrl;
            }
        }
    }
}