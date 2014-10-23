using C1.C1Excel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using C1.Web.Wijmo.Controls.C1Chart;
using ControlExplorer.C1Excel.Data;

namespace ControlExplorer.C1Excel
{
    public partial class LoadingWorkSheets : System.Web.UI.Page
    {
        C1XLBook _xlBook = new C1XLBook();
        CompositeChartSeries cdsTemp;
        CompositeChartSeries cdsPress;
        CompositeChartSeries cdsCond;
        CompositeChartSeries cdsPh;

        protected void Page_Load(object sender, EventArgs e)
        {
            cdsTemp = new CompositeChartSeries();
            cdsPress = new CompositeChartSeries();
            cdsCond = new CompositeChartSeries();
            cdsPh = new CompositeChartSeries();
            LoadChart(GetFilename);
        }

        DrillDataPoints GetChartData(C1XLBook book)
        {
            // Get first sheet
            var sheet = book.Sheets[0];

            // Get location, date, and cell count
            var location = sheet[1, 1].Value as string;
            var date = (DateTime)sheet[2, 1].Value;
            var count = sheet.Rows.Count - 5;
           // label.Text = string.Format("{0}, {1} points", location, count);

            // Get values into arrays for charting
            var drillData = new DrillDataPoints(count);
            for (int r = 0; r < count; r++)
            {
                drillData.Temperature[r] = (double)sheet[r + 5, 1].Value;
                drillData.Pressure[r] = (double)sheet[r + 5, 2].Value;
                drillData.Conductivity[r] = (double)sheet[r + 5, 3].Value;
                drillData.Ph[r] = (double)sheet[r + 5, 4].Value;
                drillData.Depth[r] = r;
            }
            drillData.ScaleValues();

            // Send data to chart
            return drillData;
        }

        private void LoadChart(string filename)
        {
            if (!string.IsNullOrEmpty(filename))
            {
                try
                {
                    _xlBook.Load(AppDomain.CurrentDomain.BaseDirectory + "C1Excel\\Data\\" + filename);
                }
                catch (Exception)
                {
                    Response.Write("Unable to load Excel file: " + filename);
                }
            }
            else
            {
                return;
            }

            // Go get the data from the excel book we just loaded
            var data = GetChartData(_xlBook);
            weatherchart.SeriesList.Clear();
            cdsTemp.Data.Y.AddRange(data.Temperature);
            cdsTemp.Data.X.AddRange(data.Depth);
            cdsTemp.Label = "Temperatue";
            cdsPress.Data.Y.AddRange(data.Pressure);
            cdsPress.Data.X.AddRange(data.Depth);
            cdsPress.Label = "Pressure";
            cdsCond.Data.Y.AddRange(data.Conductivity);
            cdsCond.Data.X.AddRange(data.Depth);
            cdsCond.Label = "Conductivity";
            cdsPh.Data.Y.AddRange(data.Ph);
            cdsPh.Data.X.AddRange(data.Depth);
            cdsPh.Label = "Ph";
            cdsTemp.Type = ChartSeriesType.Bezier;
            cdsPress.Type = ChartSeriesType.Area;
            cdsPh.Type = ChartSeriesType.Spline;
            cdsCond.Type = ChartSeriesType.Line;
            this.weatherchart.SeriesList.Add(cdsTemp);
            this.weatherchart.SeriesList.Add(cdsPress);
            this.weatherchart.SeriesList.Add(cdsCond);
            this.weatherchart.SeriesList.Add(cdsPh);
            
            weatherchart.ShowChartLabels = false;

            weatherchart.Axis.X.UnitMajor = 10;
            weatherchart.Axis.X.Alignment = ChartAxisAlignment.Near;
        }

        private string GetFilename
        {
            get
            {
                return "Houston.xlsx";
            }
        }

      

    }
}