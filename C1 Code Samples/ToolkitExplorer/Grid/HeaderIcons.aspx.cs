using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.Grid
{
    public partial class HeaderIcons : System.Web.UI.Page
    {
        protected void Page_Init(object sender, EventArgs e)
        {
            demo.RowCreated += new GridViewRowEventHandler(demo_RowCreated);
        }

        void demo_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.TableSection = TableRowSection.TableHeader;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}