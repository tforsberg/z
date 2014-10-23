using System;
using System.Data;

namespace ControlExplorer.Grid
{
    public partial class CustomFilterOperators : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();

            dt.Columns.Add("StringField");
            dt.Columns.Add("NumberField");

            dt.Rows.Add("a", 0);
            dt.Rows.Add("aba", 1);
            dt.Rows.Add("aabbcc", 2);
            dt.Rows.Add("foobarfoo", 3);
            dt.Rows.Add("foobar", 4);
            dt.Rows.Add("aaabbbaa", 5);

            GridExtender1.Data.DataSource = dt;
        }
    }
}