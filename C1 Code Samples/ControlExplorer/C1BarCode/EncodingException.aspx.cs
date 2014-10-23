using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1BarCode
{
    using C1.Web.Wijmo.Controls.C1BarCode;
    using C1.Web.Wijmo.Controls.C1ComboBox;
    
    public partial class EncodingException : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
			if (!IsPostBack)
			{
				UpdateBarCode();
			}
        }

		private void UpdateBarCode()
		{
			WijmoCodeTypeEnum codeType = (WijmoCodeTypeEnum)BarCodeTypeDdl.SelectedIndex;
			C1BarCode1.CodeType = codeType;
			C1BarCode1.Text = ValueTxt.Text;
			Exception exc = C1BarCode1.EncodingException;

			ServerSideLogger.Content = exc == null ? "" : exc.Message;
		}

		protected void ApplyBtn_Click(object sender, EventArgs e)
        {
			UpdateBarCode();
			UpdatePanel1.Update();
        }
    }
}