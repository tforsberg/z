using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FlipCard_Callback : System.Web.UI.Page
{
    private static Random _rand = new Random();

	protected void Page_Load(object sender, EventArgs e)
	{

	}

    protected void FlipCard1_UpdateContent(object sender, C1.Web.Wijmo.Controls.C1FlipCard.FlipCardEventArgs e)
    {
        // Get current html content through e.Data
        var data = e.Data;

        // Seems we don't use that for now.
        // Set new html content to e.Result.

        string[] symbols = { "Diamond", "Club", "Heart", "Spade" };
        string[] numbers = { "A", "2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K" };
        var symbol = symbols[_rand.Next(0, 3)];
        var number = numbers[_rand.Next(0, 12)];
        e.Result = symbol + "<br/>" + number;
    }	
}