using System;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;
using System.Globalization;
using C1.Silverlight.FlexGrid;

namespace NorthWindDashboard
{
    /// <summary>
    /// Grid that turns columns into charts when you double-click.
    /// </summary>
    public class ChartingGrid : C1FlexGrid
    {
        // ** fields
        Column _chartColumn;
        GridLength _saveWidth;
        double _columnMax, _columnMin;

        // ** ctor

        /// <summary>
        /// Initializes a new instance of a <see cref="ChartingGrid"/>.
        /// </summary>
        public ChartingGrid()
        {
            // make charts zero-based
            ZeroBased = true;

            // default colors for chart bars
            FillPositive = new SolidColorBrush(Color.FromArgb(0xff, 0, 0, 0xcf));
            FillNegative = new SolidColorBrush(Color.FromArgb(0xff, 0xcf, 0, 0));

            // hook up custom cell factory
            CellFactory = new ChartingCellFactory();
        }

        // ** object model

        /// <summary>
        /// Gets or sets the column that is currently being charted.
        /// </summary>
        public Column ChartColumn
        {
            get { return _chartColumn; }
            set
            {
                if (value == null)
                {
                    var sel = Selection;
                    _chartColumn.Width = _saveWidth;
                    _chartColumn = null;
                    for (int i = Columns.Frozen; i < Columns.Count; i++)
                    {
                        Columns[i].Visible = true;
                    }
                    Selection = sel;
                }
                else
                {
                    // save chart column
                    _chartColumn = value;

                    // expand chart column to take over the grid minus the frozen columns
                    _saveWidth = _chartColumn.Width;
                    _chartColumn.Width = new GridLength(Columns.Count - Columns.Frozen, GridUnitType.Star);

                    // show chart column, hide others
                    for (int i = Columns.Frozen; i < Columns.Count; i++)
                    {
                        Columns[i].Visible = i == _chartColumn.Index;
                    }
                }
            }
        }
        /// <summary>
        /// Gets or sets the brush used to show positive values.
        /// </summary>
        public Brush FillPositive 
        { 
            get { return (Brush)GetValue(FillPositiveProperty); }
            set { SetValue(FillPositiveProperty, value); }
        }
        public static readonly DependencyProperty FillPositiveProperty =
            DependencyProperty.Register(
                "FillPositive", typeof(Brush), typeof(ChartingGrid),
                new PropertyMetadata(new SolidColorBrush(Colors.Green), OnPropertyChanged));
        /// <summary>
        /// Gets or sets the brush used to show negative values.
        /// </summary>
        public Brush FillNegative
        {
            get { return (Brush)GetValue(FillNegativeProperty); }
            set { SetValue(FillNegativeProperty, value); }
        }
        public static readonly DependencyProperty FillNegativeProperty =
            DependencyProperty.Register(
                "FillNegative", typeof(Brush), typeof(ChartingGrid),
                new PropertyMetadata(new SolidColorBrush(Colors.Green), OnPropertyChanged));
        /// <summary>
        /// Gets or sets whether charts should start from zero or from the minimum value.
        /// </summary>
        public bool ZeroBased
        {
            get { return (bool)GetValue(ZeroBasedProperty); }
            set { SetValue(ZeroBasedProperty, value); }
        }
        public static readonly DependencyProperty ZeroBasedProperty =
            DependencyProperty.Register(
                "ZeroBased", typeof(bool), typeof(ChartingGrid),
                new PropertyMetadata(true, OnPropertyChanged));
        /// <summary>
        /// Gets the maximum value in the column currently being charted.
        /// </summary>
        public double ChartMaxValue
        {
            get { return _columnMax; }
        }
        /// <summary>
        /// Gets the minimum value in the column currently being charted.
        /// </summary>
        public double ChartMinValue
        {
            get { return _columnMin; }
        }
        /// <summary>
        /// Overridden to toggle charts on double-click.
        /// </summary>
        protected override void OnDoubleClick(MouseButtonEventArgs e)
        {
            var ht = HitTest(e);
            if (_chartColumn != null)
            {
                // turn charting off
                ChartColumn = null;
            }
            else
            {
                if (ht.Column >= this.FrozenColumns)
                {
                    UpdateChartRange(ht.Column);
                    if (_columnMax > _columnMin)
                    {
                        // turn charting on
                        ChartColumn = Columns[ht.Column];
                    }
                }
            }
        }
        /// <summary>
        /// Overridden to udpate chart ranges on data refreshes.
        /// </summary>
        protected override void OnLoadedRows(EventArgs e)
        {
            // update chart range when data is refreshed
            if (_chartColumn != null)
            {
                UpdateChartRange(_chartColumn.Index);
            }
            base.OnLoadedRows(e);
        }

        // update chart range
        void UpdateChartRange(int column)
        {
            var rng = new CellRange(0, column, Rows.Count - 1, column);
            _columnMax = (double)GetAggregate(Aggregate.Maximum, rng);
            _columnMin = (double)GetAggregate(Aggregate.Minimum, rng);
        }

        // update grid when properties change
        static void OnPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            ((ChartingGrid)d).Invalidate();
        }
    }
    /// <summary>
    /// Cell factory that knows how to render bar charts.
    /// </summary>
    class ChartingCellFactory : CellFactory
    {
        public override void CreateCellContent(C1FlexGrid grid, Border bdr, CellRange range)
        {
            // check that this is a ChartingGrid
            var cg = grid as ChartingGrid;
            if (cg != null)
            {
                // check that this is the chart column
                var c = cg.Columns[range.Column];
                if (c == cg.ChartColumn)
                {
                    try
                    {
                        // get the value
                        var val = (double)Convert.ChangeType(cg[range.Row, range.Column], typeof(double), CultureInfo.InvariantCulture);

                        // get the range (min, zero, max)
                        var max = cg.ChartMaxValue;
                        var min = cg.ChartMinValue;
                        var zero = min;
                        if (cg.ZeroBased)
                        {
                            zero = 0;
                            if (min > 0) min = 0;
                        }

                        // build grid to show chart bar
                        var g = new Grid();
                        g.ColumnDefinitions.Add(new ColumnDefinition());
                        g.ColumnDefinitions.Add(new ColumnDefinition());
                        g.ColumnDefinitions[0].Width = new GridLength(zero - min, GridUnitType.Star);
                        g.ColumnDefinitions[1].Width = new GridLength(max - zero, GridUnitType.Star);

                        // add content to grid
                        var rc = new Rectangle();
                        rc.Margin = new Thickness(0, 2, 0, 2);
                        var st = new ScaleTransform();
                        st.ScaleY = .8;
                        rc.RenderTransform = st;
                        if (val > zero)
                        {
                            // positive bar
                            rc.Fill = cg.FillPositive;
                            rc.RenderTransformOrigin = new Point(0, 0.5);
                            st.ScaleX = (val - zero) / (max - zero);
                            rc.SetValue(Grid.ColumnProperty, 1);
                        }
                        else
                        {
                            // negative bar
                            rc.Fill = cg.FillNegative;
                            rc.RenderTransformOrigin = new Point(1, 0.5);
                            st.ScaleX = (zero - val) / (zero - min);
                        }
                        g.Children.Add(rc);

                        // add grid to cell and be done
                        bdr.Child = g;
                        return;
                    }
                    catch { }
                }
            }

            // allow base class
            base.CreateCellContent(grid, bdr, range);
        }
    }
}
