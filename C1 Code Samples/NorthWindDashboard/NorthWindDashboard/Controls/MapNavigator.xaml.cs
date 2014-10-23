using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using ESRI.ArcGIS.Client;
using ESRI.ArcGIS.Client.Geometry;

namespace NorthWindDashboard
{
    /// <summary>
    /// Provides a navigation UI for the ESRI map control.
    /// </summary>
    /// <remarks>
    /// <para>This is a simplified version of the Navigation control in the ESRI.Client.Toolkit 
    /// assembly.</para>
    /// 
    /// </para>By using this control instead of the one in the ESRI.Client.Toolkit assembly, you
    /// may be able to remove the following dependencies from your project:</para>
    /// 
    /// <list type="bullet">
    /// <item>ESRI.ArcGIS.Client.Toolkit.dll (423k)</item>
    /// <item>System.Windows.Controls.dll (365k)</item>
    /// <item>System.Windows.Controls.Data.dll (465k)</item>
    /// <item>System.Windows.Controls.Data.Input.dll (62k)</item>
    /// </list>
    /// 
    /// <para>Since these files are compressed, the reduction in xap file size is about 420k.</para>
    /// </remarks>
    public partial class MapNavigator : UserControl
    {
        Envelope _homeExtent = null;

        /// <summary>
        /// Initializes a new instance of a <see cref="MapNavigator"/>.
        /// </summary>
        public MapNavigator()
        {
            InitializeComponent();
            Opacity = 0.5;

            // bind Foreground and FontSize properties to child controls
            // (after the control has loaded!)
            Loaded += (s, e) =>
                {
                    var bForeground = new System.Windows.Data.Binding("Foreground") { Source = this };
                    var bFontSize = new System.Windows.Data.Binding("FontSize") { Source = this };
                    foreach (HyperlinkButton btn in LayoutRoot.Children)
                    {
                        btn.SetBinding(HyperlinkButton.ForegroundProperty, bForeground);
                        btn.SetBinding(HyperlinkButton.FontSizeProperty, bFontSize);
                    }
                };
        }
        /// <summary>
        /// Gets or sets the map control being navigated.
        /// </summary>
        public Map Map
        {
            get { return (Map)GetValue(MapProperty); }
            set { SetValue(MapProperty, value); }
        }
        /// <summary>
        /// Identifies the <see cref="Map"/> dependency property.
        /// </summary>
        public static readonly DependencyProperty MapProperty =
            DependencyProperty.Register(
                "Map", typeof(Map), typeof(MapNavigator),
                new PropertyMetadata(OnMapPropertyChanged));
        static void OnMapPropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var map = (Map)e.NewValue;
            var nav = (MapNavigator)d;
            nav._homeExtent = map != null ? map.Extent : null;
        }
        /// <summary>
        /// Adjust opacity when mouse enters the control.
        /// </summary>
        protected override void OnMouseEnter(MouseEventArgs e)
        {
            Opacity = 1;
            base.OnMouseEnter(e);
        }
        /// <summary>
        /// Adjust opacity when mouse leaves the control.
        /// </summary>
        protected override void OnMouseLeave(MouseEventArgs e)
        {
            Opacity = 0.5;
            base.OnMouseLeave(e);
        }

        // event handlers
        void _btnZoomIn_Click(object sender, RoutedEventArgs e)
        {
            if (Map != null)
            {
                Map.Focus();
                Map.Zoom(Map.ZoomFactor);
            }
        }
        void _btnZoomExtent_Click(object sender, RoutedEventArgs e)
        {
            if (Map != null)
            {
                Map.Focus();
                var extent = _homeExtent != null ? _homeExtent : Map.Layers.GetFullExtent();
                Map.ZoomTo(extent);
            }
        }
        void _btnZoomOut_Click(object sender, RoutedEventArgs e)
        {
            if (Map != null)
            {
                Map.Focus();
                Map.Zoom(1.0 / Map.ZoomFactor);
            }
        }
        void _btnPanUp_Click(object sender, RoutedEventArgs e)
        {
            PanTo(0, -1);
        }
        void _btnPanLeft_Click(object sender, RoutedEventArgs e)
        {
            PanTo(-1, 0);
        }
        void _btnPanRight_Click(object sender, RoutedEventArgs e)
        {
            PanTo(+1, 0);
        }
        void _btnPanDown_Click(object sender, RoutedEventArgs e)
        {
            PanTo(0, +1);
        }
        void PanTo(int dx, int dy)
        {
            if (Map != null)
            {
                Map.Focus();
                var extent = Map.Extent;
                if (extent != null)
                {
                    var panFactor = 0.25;
                    var center = extent.GetCenter();
                    var x = center.X + panFactor * extent.Width * dx;
                    var y = center.Y + panFactor * extent.Height * dy;
                    var geometry = new MapPoint(x, y);
                    Map.PanTo(geometry);
                }
            }
        }
    }
}
