using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1GridView
{
	public partial class CellRowFormatting : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected string GetCountryImage(string country) 
		{
			string url = "http://www.geonames.org/flags/m/";
			switch (country)
			{
				case "USA": return url + "us.png";
				case "UK": return url + "uk.png";
				case "Germany": return url + "de.png";
				case "Italy": return url + "it.png";
				case "Japan": return url + "jp.png";
				case "Brazil": return url + "br.png";
				case "Canada": return url + "ca.png";
				case "Switzerland": return url + "ch.png";
				case "France": return url + "fr.png";
				case "Denmark": return url + "dk.png";
			}
			return "";
		}
	}
}