using C1.Web.Wijmo.Controls.C1Chart;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ControlExplorer.C1ScatterChart
{
    public partial class Origin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                PrepareOptions();
        }

        private void PrepareOptions()
        {
            var coordinates = new []{ 
                new {Latitude= -6.6003, Longitude= 154.8109 },
                new{ Latitude= 18.6364, Longitude= 145.2596 },
                new { Latitude= 77.1576, Longitude= 59.5431 },
                new{ Latitude= -16.0907, Longitude= 168.417 },
                new{ Latitude= -37.4779, Longitude= -73.7132 },
                new{ Latitude= -22.3357, Longitude= 171.5891 },
                new{ Latitude= -1.7906, Longitude= 138.6322 },
                new { Latitude= 13.9832, Longitude= -92.0492 },
                new { Latitude= 62.0401, Longitude= -150.5026 },
                new { Latitude= 31.747, Longitude= 76.0954 },
                new { Latitude= 23.73864, Longitude= -73.0425 },
                new { Latitude= 53.5235, Longitude= -163.656 },
                new { Latitude= 14.1968, Longitude= 93.0794 },
                new { Latitude= 44.5736, Longitude= -129.6263 },
                new { Latitude= -19.0698, Longitude= 169.3928 },
                new { Latitude= 26.3966, Longitude= 93.6705 },
                new { Latitude= 26.6053, Longitude= 128.9131 },
                new { Latitude= 23.33537, Longitude= 89.6659 },
                new { Latitude= -15.2379, Longitude= -174.9825 },
                new { Latitude= 34.732, Longitude= 24.907 },
                new{ Latitude= -57.7216, Longitude= -25.2586 },
                new { Latitude= -35.3534, Longitude= -72.8385 },
                new { Latitude= -6.5142, Longitude= 145.9331 },
                new { Latitude= 41.0279, Longitude= 143.1955 },
                new{ Latitude= 4.1835, Longitude= 126.5818 },
                new { Latitude= -18.05, Longitude= -69.0994 },
                new { Latitude= 22.02200, Longitude= -73.0346 },
                new { Latitude= -33.1344, Longitude= -176.7905 },
                new{ Latitude= 30.3284, Longitude= 140.3675 },
                new{ Latitude= 30.7049, Longitude= 141.5523 },
                new{ Latitude= -6.063, Longitude= 146.5122 },
                new { Latitude= -3.7014, Longitude= 140.2867 },
                new { Latitude= 36.594, Longitude= 27.5124 },
                new { Latitude= -3.6341, Longitude= 140.3296 },
                new { Latitude= 28.65177, Longitude= -40.4791 },
                new { Latitude= 36.7109, Longitude= 141.1474 },
                new { Latitude= -3.7336, Longitude= 140.207 },
                new { Latitude= 14.3189, Longitude= 93.1447 },
                new { Latitude= 39.7744, Longitude= 75.4501 },
                new { Latitude= 41.1331, Longitude= -127.321 },
                new { Latitude= -55.3358, Longitude= -28.426 },
                new { Latitude= -37.5198, Longitude= 176.4955 },
                new { Latitude= 58.7996, Longitude= 149.1842 },
                new { Latitude= -57.8741, Longitude= -25.7113 },
                new { Latitude= -18.5562, Longitude= -175.4453 },
                new { Latitude= 28.89860, Longitude= 92.8679 },
                new { Latitude= 26.0212, Longitude= 128.3591 },
                new{ Latitude= 26.0296, Longitude= 128.4044 },
                new{ Latitude= -17.8997, Longitude= -178.5269 },
                new{ Latitude= 26.0834, Longitude= 128.4265 },
                new { Latitude= 15.47260, Longitude= 123.3577 },
                new { Latitude= 37.6665, Longitude= 21.2943 },
                new { Latitude= -19.2369, Longitude= -172.5179 },
                new { Latitude= 38.332, Longitude= 142.7084 },
                new { Latitude= 18.4298, Longitude= -69.2189 },
                new { Latitude= 18.85050, Longitude= 67.0158 },
                new { Latitude= 35.5787, Longitude= 88.2794 },
                new { Latitude= 11.84026, Longitude= 92.8079 },
                new { Latitude= -23.654, Longitude= -112.8086 },
                new{ Latitude= 38.5159, Longitude= 93.4779 },
                new{ Latitude= 51.8132, Longitude= 98.8893 },
                new{ Latitude= -52.8979, Longitude= 27.5707 },
                new { Latitude= 35.9449, Longitude= 140.1241 },
                new{ Latitude= -5.0771, Longitude= 152.1161 },
                new{ Latitude= 55.5174, Longitude= -162.2645 },
                new { Latitude= 44.6862, Longitude= 124.0826 },
                new { Latitude= 23.6635, Longitude= 121.4875 },
                new { Latitude= -5.885, Longitude= 148.7996 },
                new { Latitude= -8.0055, Longitude= 107.8368 },
                new { Latitude= -7.18, Longitude= 120.8211 },
                new { Latitude= -24.0389, Longitude= -66.7325 },
                new{ Latitude= 44.1975, Longitude= 148.1701 },
                new{ Latitude= -49.5402, Longitude= 117.3437 },
                new { Latitude= 53.5738, Longitude= -163.6987 },
                new { Latitude= 15.3714, Longitude= 146.1102 },
                new { Latitude= -20.7337, Longitude= 168.5044 },
                new{ Latitude= -19.2447, Longitude= -172.3905 },
                new { Latitude= -19.2283, Longitude= -172.6304 },
                new { Latitude= -19.1815, Longitude= -172.6644 },
                new { Latitude= -24.3679, Longitude= -67.9324 },
                new { Latitude= 2.155, Longitude= 92.4728 },
                new { Latitude= -11.7382, Longitude= 166.6981 },
                new { Latitude= -23.5664, Longitude= -112.6109 },
                new { Latitude= -17.1246, Longitude= -70.0386 },
                new { Latitude= 36.6554, Longitude= 71.0538 },
                new { Latitude= 14.6884, Longitude= -90.9153 },
                new { Latitude= -18.5119, Longitude= -176.5967 },
                new { Latitude= 48.6576, Longitude= 139.1972 },
                new { Latitude= -1.5403, Longitude= 135.0778 },
                new  { Latitude= 36.7381, Longitude= 71.2583 },
                new { Latitude= -33.7964, Longitude= -178.4857 },
                new { Latitude= -5.5687, Longitude= 105.4131 },
                new { Latitude= -8.8615, Longitude= 31.3003 },
                new { Latitude= 44.6292, Longitude= 148.109 },
                new { Latitude= 23.55329, Longitude= 124.1864 },
                new { Latitude= 13.2502, Longitude= -88.72 },
                new { Latitude= -52.9451, Longitude= 18.5107 },
                new { Latitude= -6.6306, Longitude= 128.2232 },
                new { Latitude= 36.6017, Longitude= 145.1569 },
                new { Latitude= -8.2584, Longitude= 146.8998 },
                new { Latitude= -20.7396, Longitude= -178.4655 }
            };
            var series = new ScatterChartSeries();
            var valueX = new List<double?>();
            var valueY = new List<double?>();
            foreach(var d in coordinates)
            {
                valueX.Add(d.Longitude);
                valueY.Add(d.Latitude);
            }
            series.Data.X.AddRange(valueX.ToArray<double?>());
            series.Data.Y.AddRange(valueY.ToArray<double?>());
            series.Label="Earthquakes";
            series.LegendEntry = true;
            series.Visible = true;
            series.MarkerType = MarkerType.Circle;
            this.C1ScatterChart1.SeriesList.Add(series);
        }
    }
}