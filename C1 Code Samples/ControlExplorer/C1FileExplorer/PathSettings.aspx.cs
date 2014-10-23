using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1FileExplorer
{
    public partial class PathSettings : System.Web.UI.Page
    {
        static char[] splitters = new char[] { ',', ';' };

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                C1FileExplorer1.ViewPaths = new string[] { "~/C1FileExplorer" };
                C1FileExplorer1.DeletePaths = new string[] { "~/C1FileExplorer/Example" };

                inputViewPaths.Text = string.Join(";", C1FileExplorer1.ViewPaths);
                inputDeletePaths.Text = string.Join(";", C1FileExplorer1.DeletePaths);

                inputInitPath.Text = C1FileExplorer1.InitPath;
                inputSearchPatterns.Text = string.Join(";", C1FileExplorer1.SearchPatterns);
            }
        }

        protected void btnApply_Click(object sender, EventArgs e)
        {
            this.C1FileExplorer1.ViewPaths = inputViewPaths.Text.Split(splitters, StringSplitOptions.RemoveEmptyEntries);
            this.C1FileExplorer1.InitPath = inputInitPath.Text;
            this.C1FileExplorer1.DeletePaths = inputDeletePaths.Text.Split(splitters, StringSplitOptions.RemoveEmptyEntries);
            this.C1FileExplorer1.SearchPatterns = inputSearchPatterns.Text.Split(splitters, StringSplitOptions.RemoveEmptyEntries);
        }
    }
}