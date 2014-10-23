using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sparkline_NegativeValues : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
        var data = new List<double> { 33, 11, 15, 26, 16, 27, 37, -13, -27, -8, -3, 17, 0, 22, -13, -29, 19, 8 };
        Sparkline1.SeriesList[0].Data = data;
		Sparkline2.SeriesList[0].Data = data;
	}	
}