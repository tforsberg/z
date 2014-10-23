using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Upload
{
    public partial class CustomValidation : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
            
		}

        private void ValidateExtension(C1.Web.Wijmo.Controls.C1Upload.ValidateFileEventArgs e, string ext)
        {
            if (e.IsValid) return;

            if (string.Compare(e.UploadedFile.Extension, ext, true) == 0)
                e.IsValid = true;
        }


        protected void c1Upload1_ValidatingFile(object sender, C1.Web.Wijmo.Controls.C1Upload.ValidateFileEventArgs e)
        {
            e.IsValid = false;

            if (Chk_JPG.Checked)
            {
                this.ValidateExtension(e, "JPG");
            }

            if (Chk_PNG.Checked)
            {
                this.ValidateExtension(e, "PNG");
            }

            if (Chk_GIF.Checked)
            {
                this.ValidateExtension(e, "GIF");
            }

            if (Chk_BMP.Checked)
            {
                this.ValidateExtension(e, "BMP");
            }

            if (Chk_DOC.Checked)
            {
                this.ValidateExtension(e, "DOC");
            }

            if (Chk_TXT.Checked)
            {
                this.ValidateExtension(e, "TXT");
            }

            if (Chk_ZIP.Checked)
            {
                this.ValidateExtension(e, "ZIP");
            }

            if (Chk_RAR.Checked)
            {
                this.ValidateExtension(e, "RAR");
            }
        }
	}
}