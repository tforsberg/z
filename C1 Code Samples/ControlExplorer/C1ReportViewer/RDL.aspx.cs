using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ReportViewer
{
    public partial class RDL : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cbbRdl_SelectedIndexChanged(object sender, EventArgs args)
        {
            var selectedFileName = cbbRdl.SelectedValue;
            var currentFileName = C1ReportViewer1.FileName;
            if (selectedFileName != currentFileName)
            {
                C1ReportViewer1.FileName = selectedFileName;
                update1.Update();
            }
        }
    }
}