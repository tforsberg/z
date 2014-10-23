using C1.Web.Wijmo.Controls.C1Gauge;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1RadialGauge
{
	public partial class Position : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

        protected void applyOption_Click(object sender, EventArgs e)
        {
            double pl, po, lo;
            double.TryParse(p_length.Text, out pl);
            double.TryParse(p_offset.Text, out po);
            double.TryParse(l_offset.Text, out lo);
            Gauge1.Pointer.Length = pl == 0 ? 1 : pl;
            Gauge1.Pointer.Offset = po == 0 ? 1 : po;
            Gauge1.Labels.Offset = lo==0 ? 1 : lo;
            var tick = new GaugeTick();
            double t, rs, re;
            double.TryParse(t_offset.Text, out t);
            double.TryParse(rs_distance.Text, out rs);
            double.TryParse(re_distance.Text, out re);
            tick.Offset = t == 0 ? 1 : t;
            tick.Position = (C1.Web.Wijmo.Controls.C1Gauge.Position)Enum.Parse(typeof(C1.Web.Wijmo.Controls.C1Gauge.Position), t_position.SelectedValue,true);
            Gauge1.TickMajor.Offset = tick.Offset;
            Gauge1.TickMajor.Position = tick.Position;
            Gauge1.TickMinor.Offset = tick.Offset;
            Gauge1.TickMinor.Position = tick.Position;
            var range = Gauge1.Ranges[0];
            range.StartDistance = rs == 0 ? 1 : rs;
            range.EndDistance = re == 0 ? 1 : re;
            update1.Update();
        }
	}
}