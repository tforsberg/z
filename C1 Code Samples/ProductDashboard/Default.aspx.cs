using C1.Web.Wijmo.Controls.C1Chart;
using C1.Web.Wijmo.Controls.C1GridView;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
   protected void Page_Load(object sender, EventArgs e)
    {
        PouplateMonth();
        PopulateProducts();

       if (!this.IsPostBack)
        {
            monthcombo.SelectedIndex = 0;
            productcombo.SelectedIndex = 0;
            DrawCharts();
            this.DrawGauge();
        }

    }

    /// <summary>
    /// Create summary data of all products revenue and units sold
    /// </summary>
    private void CreateSummary()
    {
        //Scale Sales Summary data

        this.C1RadialGauge1.Value = SalesOrderReport.CategoryRevenue[0].Amount / 1000000;
        this.C1RadialGauge2.Value = SalesOrderReport.CategoryRevenue[1].Amount / 1000000;
        this.C1RadialGauge3.Value = SalesOrderReport.CategoryRevenue[2].Amount / 1000000;
        this.sonysales.Text = "";
        this.mssales.Text = "";
         this.NVideaSales.Text="";
        this.sonysales.Text = " SONY: " +  SalesOrderReport.CategoryRevenue[0].Amount.ToString("C");
        this.mssales.Text = "MS: " + SalesOrderReport.CategoryRevenue[1].Amount.ToString("C");
        this.NVideaSales.Text = "NVIDEA: " +SalesOrderReport.CategoryRevenue[2].Amount.ToString("C");

        // Unit Sold summary
        C1ChartBinding unitLine = new C1ChartBinding();
        unitLine.XField = "Product";
        unitLine.YField = "Units";
        unitsummarychart.Type = LineChartType.Area;
                
        unitsummarychart.ShowChartLabels = false;
        unitsummarychart.DataBindings.Add(unitLine);
        unitsummarychart.DataSource = SalesOrderReport.CategoryRevenue;
        unitsummarychart.DataBind();
        unitsummarychart.SeriesList[0].FitType = LineChartFitType.Spline;
        unitsummarychart.AutoResize = true;
       
        #region Styles
        ChartStyleFill chartfill = new ChartStyleFill();
        chartfill.Color = Color.Beige;
        ChartStyle chstyle = new ChartStyle();
        chstyle.Fill.Color = Color.FromName("#ff9900"); ;
        chstyle.Fill.Type = ChartStyleFillType.Default;
       
        this.unitsummarychart.SeriesStyles.Add(chstyle);
       
        #endregion

    }

    /// <summary>
    /// Create chart showing orderstatus for product
    /// </summary>
    private void CreateOrderRatioChart()
    {
        this.orderRatioChart.DataBindings.Clear();
        C1PieChartBinding pieseries = new C1PieChartBinding();
        pieseries.OffsetField = "InOrder";
        pieseries.DataField = "Value";
        pieseries.LabelField = "Key";
        //orderRatioChart.Header.Text = " Monthly Order Ratio";
        this.orderRatioChart.DataBindings.Add(pieseries);
        orderRatioChart.InnerRadius = 20;
        this.orderRatioChart.DataSource = SalesOrderReport.OrderSatusRatio;
        this.orderRatioChart.DataBind();

       
        #region Styles
        ChartStyleFill chartfillstyle = new ChartStyleFill();
        chartfillstyle.Type = ChartStyleFillType.Default;
        chartfillstyle.Color = Color.FromName("#ff9900");
        ChartStyleFill chartfillstyle2 = new ChartStyleFill();
        chartfillstyle2.Type = ChartStyleFillType.Default;
        chartfillstyle2.Color = Color.FromName("#FFCC66");
        ChartStyleFill chartfillstyle3 = new ChartStyleFill();
        chartfillstyle3.Type = ChartStyleFillType.Default;
        chartfillstyle3.Color = Color.FromName("#3399FF");
        ChartStyleFill chartfillstyle4 = new ChartStyleFill();
        chartfillstyle4.Type = ChartStyleFillType.Default;
        chartfillstyle4.Color = Color.FromName("#ff6600");
        this.orderRatioChart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle });
        this.orderRatioChart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle2 });
        this.orderRatioChart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle3 });
        this.orderRatioChart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle4 });
        this.orderRatioChart.SeriesList[2].Offset = 15;
        #endregion
    }

    /// <summary>
    /// Create chart for Existing customer vs New customer
    /// </summary>
    private void CreateNewCustomerChart()
    {
        C1BarChart1.SeriesList.Clear();
        C1BarChart1.DataBindings.Clear();

        C1ChartBinding bar = new C1ChartBinding();
        bar.XField = "NewProduct";
        bar.XFieldType = ChartDataXFieldType.String;
        bar.YField = "NewCustomer";
        bar.YFieldType = ChartDataYFieldType.Number;
     
        C1ChartBinding bar1 = new C1ChartBinding();
        bar1.XField = "OldProduct";
        bar1.XFieldType = ChartDataXFieldType.String;
        bar1.YField = "OldCustomer";
        bar1.YFieldType = ChartDataYFieldType.Number;
        this.C1BarChart1.Shadow = true;

        this.C1BarChart1.Axis.X.TextStyle = new ChartStyle { Fill = new ChartStyleFill { Color = Color.BlueViolet } };
        this.C1BarChart1.DataBindings.Add(bar);
        this.C1BarChart1.DataBindings.Add(bar1); 
        this.C1BarChart1.DataSource = SalesOrderReport.CustomerRatio;
        this.C1BarChart1.DataBind();
        this.C1BarChart1.SeriesStyles[0].Fill = new ChartStyleFill { Color = Color.FromName("#ff9900"),Type=ChartStyleFillType.Default };
        this.C1BarChart1.ClusterRadius = 12;
       
        #region Styles
        ChartStyleFill chartfill = new ChartStyleFill();
        chartfill.Color = Color.Beige;

        ChartStyleFill chartfillstyle = new ChartStyleFill();
        chartfillstyle.Type = ChartStyleFillType.Default;
        chartfillstyle.Color = Color.FromName("#ff9900");

        ChartStyle chstyle = new ChartStyle();
        chstyle.Fill.Color = Color.FromName("#ff9900");
        ChartStyle chstyle1 = new ChartStyle();
        chstyle1.Fill.Color = Color.FromName("#ff0000");
                
        #endregion

    }

    /// <summary>
    /// Createvenue and unit sold chart for selected product.
    /// </summary>
    private void ProductSalesChart()
    {
        this.productsaleschart.DataBindings.Clear();
        this.productsaleschart.SeriesList.Clear();
        this.productsaleschart.YAxes.Clear();


        CompositeChartSeries seriesrevenue = new CompositeChartSeries();
        seriesrevenue.Data.X.AddRange(SalesOrderReport.ProductsRevenue.Select(x => x.Day).ToArray());
        seriesrevenue.Data.Y.AddRange(SalesOrderReport.ProductsRevenue.Select(x => x.Amount).ToArray());
        
        seriesrevenue.Type = ChartSeriesType.Bezier;
     
        seriesrevenue.Label = "Revenue[In Hundered Thousand]";
        seriesrevenue.MarkerStyle.Fill.Color = Color.LightCoral;
        CompositeChartYAxis y = new CompositeChartYAxis();
        y.Text = "Revenue";
        y.TextStyle.Fill.Type = ChartStyleFillType.Default;
       
        y.AxisStyle.Fill.Type = ChartStyleFillType.Default;
       
        CompositeChartYAxis y1 = new CompositeChartYAxis();
        y1.Compass = ChartCompass.East;
        y1.GridMajor.Visible=false;
        y1.TextStyle.Fill.Type = ChartStyleFillType.Default;
       
        y1.AxisStyle.Fill.Type = ChartStyleFillType.Default;
       
        y1.Text = "Units";
        CompositeChartSeries seriesunit = new CompositeChartSeries();
        seriesunit.Data.X.AddRange(SalesOrderReport.ProductsRevenue.Select(x => x.Day).ToArray());
        seriesunit.Data.Y.AddRange(SalesOrderReport.ProductsRevenue.Select(x => x.Units).ToArray());
        seriesunit.Type = ChartSeriesType.Scatter;
        seriesunit.Label = "Units";
             
        productsaleschart.Axis.X.Text = "Days";
        productsaleschart.ShowChartLabels = false;
        this.productsaleschart.SeriesList.Add(seriesrevenue);
        this.productsaleschart.SeriesList.Add(seriesunit);
       this.productsaleschart.Legend.Compass = ChartCompass.North;
       productsaleschart.YAxes.Add(y);
       productsaleschart.YAxes.Add(y1);
       this.productsaleschart.SeriesList[1].YAxis = 1;
     
        this.productsaleschart.AutoResize = true;
       
        #region Styles
        ChartStyleFill chartstyle = new ChartStyleFill();
        chartstyle.Type = ChartStyleFillType.Default;
        chartstyle.Color = Color.Beige;

        ChartStyleFill chartfillstyle = new ChartStyleFill();
        chartfillstyle.Color = Color.FromName("#FFCC66");
        ChartStyleFill chartfillstyle1 = new ChartStyleFill();
        chartfillstyle1.Color = Color.FromName("#FF0000");
        chartfillstyle.Type = ChartStyleFillType.Default;
      
        this.productsaleschart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle, StrokeWidth = 3,Stroke=Color.FromName("#FF9900") });
        this.productsaleschart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle1,Stroke=Color.Red });
       
       
        #endregion

    }

    
    /// <summary>
    /// Create sales percentage ratio chart for each product in that month.
    /// </summary>
    private void SaleRatioChart()
    {
        this.salesratiochart.DataBindings.Clear();
        this.salesratiochart.SeriesList.Clear();
        C1BubbleChartBinding bubbleseries = new C1BubbleChartBinding();

        bubbleseries.YField = "SalesRatio";
        bubbleseries.YFieldType = ChartDataYFieldType.Number;
        bubbleseries.XField = "Product";
        bubbleseries.Y1Field = "Units";
        bubbleseries.XFieldType = ChartDataXFieldType.String;
               
        this.salesratiochart.DataBindings.Add(bubbleseries);
        this.salesratiochart.DataSource = SalesOrderReport.SalesRatio;
        this.salesratiochart.DataBind();

        #region Styles
        ChartStyleFill chartfillstyle = new ChartStyleFill();
        chartfillstyle.Type = ChartStyleFillType.Default;
        chartfillstyle.Color = Color.FromName("#ff9900");
        this.salesratiochart.SeriesStyles.Add(new ChartStyle { Fill = chartfillstyle });
        #endregion
    }

    /// <summary>
    /// Poulates month combobox
    /// </summary>
    private void PouplateMonth()
    {
        if (!this.IsPostBack)
        {
            var cl = new CultureInfo("en-US");
            List<string> monthsList = new List<string>();
            monthsList.AddRange(cl.DateTimeFormat.MonthNames.Take(12));
            monthcombo.DataSource = monthsList;
            monthcombo.DataBind();
        }
    }
    
    /// <summary>
    /// Populate combobox product
    /// </summary>
    private void PopulateProducts()
    {
        if (!this.IsPostBack)
        {
            productcombo.Items.Add(new C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBoxItem("Xbox"));
            productcombo.Items.Add(new C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBoxItem("Play Station"));
            productcombo.Items.Add(new C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBoxItem("Nvidea Shield"));
        }
    }

    protected void monthcombo_SelectedIndexChanged(object sender, C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBoxEventArgs args)
    {

        DrawCharts();
        this.DrawGauge();

    }

    protected void productcombo_SelectedIndexChanged(object sender, C1.Web.Wijmo.Controls.C1ComboBox.C1ComboBoxEventArgs args)
    {

        DrawCharts();
        this.DrawGauge();
        if (args.NewSelectedIndex == 0)
        {
            this.imgproduct.ImageUrl = "~/Images/xboximages.png";
        }
        else if (args.NewSelectedIndex == 1)
        {
            this.imgproduct.ImageUrl = "~/Images/Playstationimages.png";
        }
        else
        {
            this.imgproduct.ImageUrl = "~/Images/Nvidiaimages.png";
        }

    }

    private void DrawCharts()
    {
        SalesOrderReport.SelectedMonth = monthcombo.SelectedIndex + 1;
        SalesOrderReport.SelectedProduct = productcombo.SelectedItem.Text;

        CreateOrderRatioChart();
        CreateNewCustomerChart();
        SaleRatioChart();
        ProductSalesChart();
        CreateSummary();
    }

    /// <summary>
    /// Draws gauge with selected product revenue
    /// </summary>
    private void DrawGauge()
    {
        //sclale revenue data
        this.salesgauge.TickMajor.Interval = 5;
        this.salesgauge.Max = SalesOrderReport.TotalSales / 1000000;
        this.salesgauge.Value = SalesOrderReport.SelectedProductSales / 1000000;
        this.salesLabel.Text = "";
        this.salesLabel.Text = " REVENUE: "+SalesOrderReport.SelectedProductSales.ToString("C");
    }
      
}


