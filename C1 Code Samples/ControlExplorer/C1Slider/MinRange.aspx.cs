using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1Slider
{
    public partial class MinRange : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnGetValue_Click(object sender, EventArgs e)
        {
            string text=string.Empty;
            foreach (int item in slider1.Values)
            {
                text += item.ToString() + ",";
            }
            if (text.LastIndexOf(",") == text.Length-1)
            {
                text = text.Remove(text.Length - 1);
            }
            msg.Text = text;
        }
    }
}