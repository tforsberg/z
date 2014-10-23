using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Sparkline_SeriesAndBind : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        object[] data = 
        { 
            new { Name = "Januray", Score = 73 }, 
            new { Name = "February", Score = 95 }, 
            new { Name = "March", Score = 89 },
            new { Name = "April", Score = 66 }, 
            new { Name = "May", Score = 50 }, 
            new { Name = "June", Score = 65 },
            new { Name = "July", Score = 70 }, 
            new { Name = "August", Score = 43 }, 
            new { Name = "September", Score = 65 },
            new { Name = "October", Score = 27 }, 
            new { Name = "November", Score = 77 }, 
            new { Name = "December", Score = 58 } 
        };

        Sparkline1.DataSource = data;
        Sparkline1.DataBind();
    }
}