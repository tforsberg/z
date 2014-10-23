using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;

public partial class Sparkline_MultipleSeries : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var data1 = new[] 
        { 
            new { Name="a",Score=73 ,Mood=66},
            new { Name="b",Score=95 ,Mood=50},
            new { Name="c",Score=89 ,Mood=65},
            new { Name="d",Score=66 ,Mood=70},
            new { Name="e",Score=50 ,Mood=43},
            new { Name="f",Score=65 ,Mood=65},
            new { Name="g",Score=70 ,Mood=27},
            new { Name="h",Score=43 ,Mood=77},
            new { Name="i",Score=65 ,Mood=58},
            new { Name="j",Score=27 ,Mood=73},
            new { Name="k",Score=77 ,Mood=95},
            new { Name="l",Score=58 ,Mood=89}
        };

        Sparkline1.DataSource = data1;
		Sparkline1.DataBind();
    }
}