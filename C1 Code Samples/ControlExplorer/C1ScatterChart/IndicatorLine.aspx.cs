using C1.Web.Wijmo.Controls.C1Chart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ScatterChart
{
    public partial class IndicatorLine : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                PrepareOptions();
            }
        }
        private void PrepareOptions()
        {
            var valuesX = new List<double?>() { 569.99, 329.00, 302.27, 309.99, 289.99, 293.71, 370.33, 339.99, 382.64,
                                    399.99, 219.99, 219.99, 208.88, 189.29, 199.99, 288.42, 227.00, 280.39,
                                    177.97, 202.99, 312.00, 186.13, 379.95, 399.00, 249.99, 285.00 };
            var valuesY = new List<double?>() { 12095, 10141, 9972, 9578, 9421, 9003, 8875, 8467, 8310, 7528, 7509, 7108,
                                    6992, 6577, 6450, 6370, 6234, 5972, 5889, 5787, 5683, 5681, 5456,
                                    5181, 5099, 5023 };
            //serieslist Intel
            var series = new ScatterChartSeries();
            this.C1ScatterChart1.SeriesList.Add(series);
            series.MarkerType = MarkerType.Circle;
            series.Data.X.AddRange(valuesX.ToArray<double?>());
            series.Data.Y.AddRange(valuesY.ToArray<double?>());
            series.Label = "Intel";
            series.LegendEntry = true;
            series.Visible = true;

            //series AMD
            valuesX = new List<double?>() {199.99, 159.99, 149.79, 139.99, 114.99, 459.00, 119.99, 170.00, 299.00, 109.99, 125.00, 109.98,
                                    215.00, 179.99, 249.95, 59.98};
            valuesY = new List<double?>() { 9081, 8130, 7727, 6602, 6406, 5711, 5420, 5055, 4912, 4693, 4286, 4057, 4017,
                                    3740, 3359, 1741};

            series = new ScatterChartSeries();
            this.C1ScatterChart1.SeriesList.Add(series);
            series.MarkerType = MarkerType.Diamond;
            series.Data.X.AddRange(valuesX.ToArray<double?>());
            series.Data.Y.AddRange(valuesY.ToArray<double?>());
            series.Label = "AMD";
            series.LegendEntry = true;
            series.Visible = true;
        }
    }
}