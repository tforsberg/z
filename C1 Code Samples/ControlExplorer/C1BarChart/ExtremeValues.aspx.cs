using System;

public partial class C1BarChart_ExtremeValues : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{
		if (!IsPostBack)
		{
			UpdateYMinMax();
		}
	}

	private void UpdateYMinMax()
	{
		var axisY = C1BarChart1.Axis.Y;

		double max;
		if (!AutoMaxCkb.Checked && double.TryParse(MaxValueTxt.Text, out max))
		{
			axisY.Max = max;
		}
		else
		{
			axisY.Max = null;
		}

		double min;
		if (!AutoMinCkb.Checked && double.TryParse(MinValueTxt.Text, out min))
		{
			axisY.Min = min;
		}
		else
		{
			axisY.Min = null;
		}
	}

	protected void ApplyBtn_Click(object sender, EventArgs e)
	{
		UpdateYMinMax();
		UpdatePanel1.Update();
	}
}