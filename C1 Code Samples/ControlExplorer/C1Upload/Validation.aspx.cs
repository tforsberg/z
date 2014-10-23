using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Upload
{
    public partial class Validation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void c1Upload1_ValidatingFile(object sender, C1.Web.Wijmo.Controls.C1Upload.ValidateFileEventArgs e)
        {
            if (e.IsValid)
                this.TextBox1.Text += e.UploadedFile.FileName + Environment.NewLine;
            else
                this.TextBox2.Text += e.UploadedFile.FileName + Environment.NewLine;
        }
	}
}