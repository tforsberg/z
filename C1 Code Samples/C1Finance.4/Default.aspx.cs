using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            TxtDateFrom.Date = DateTime.Now.Date.AddMonths(-1);
            TxtDateTo.Date = DateTime.Now.Date;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
 
    protected void C1GridView1_SelectedIndexChanging(object sender, C1.Web.Wijmo.Controls.C1GridView.C1GridViewSelectEventArgs e)
    {
        if (C1GridView1.SelectedRow != null)
        {
            string smbl = C1GridView1.Rows[e.NewSelectedIndex].Cells[2].Text;
            ObjectDataSource2.SelectParameters["Symbol"].DefaultValue = smbl;
        }
    }
}
