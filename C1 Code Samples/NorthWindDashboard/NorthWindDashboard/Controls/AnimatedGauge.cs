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

namespace NorthWindDashboard
{
    /// <summary>
    /// Extends the C1RadialGauge to provide an animation when the Value
    /// shown on the gauge changes.
    /// </summary>
    public class AnimatedGauge : C1.Silverlight.Gauge.C1RadialGauge
    {
        /// <summary>
        /// Gets or sets the target for the control's Value property.
        /// </summary>
        public double AnimatedValue
        {
            get { return (double)GetValue(AnimatedValueProperty); }
            set { SetValue(AnimatedValueProperty, value); }
        }
        /// <summary>
        /// Identifies the <see cref="AnimatedValue"/> dependency property.
        /// </summary>
        public static readonly DependencyProperty AnimatedValueProperty =
            DependencyProperty.Register(
                "AnimatedValue", typeof(double), typeof(AnimatedGauge),
                new PropertyMetadata(OnTargetValuePropertyChanged));
        static void OnTargetValuePropertyChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            // get animated gauge
            var ag = (AnimatedGauge)d;

            // create animation
            var da = new DoubleAnimation();
            da.To = (double)e.NewValue;
            da.Duration = new Duration(TimeSpan.FromMilliseconds(ag.Duration));
            Storyboard.SetTargetProperty(da, new PropertyPath("Value"));
            Storyboard.SetTarget(da, d);

            // apply easing function
            var ef = ag.EasingFunction;
            if (ef == null)
            {
                var ee = new ElasticEase();
                ee.Oscillations = 1;
                ee.Springiness = 3;
                ef = ee;
            }
            da.EasingFunction = ef;

            // play animation
            var sb = new Storyboard();
            sb.Children.Add(da);
            sb.Begin();
        }
        /// <summary>
        /// Gets or sets the easing function that animates the gauge pointer.
        /// </summary>
        public IEasingFunction EasingFunction
        {
            get { return (IEasingFunction)GetValue(EasingFunctionProperty); }
            set { SetValue(EasingFunctionProperty, value); }
        }
        /// <summary>
        /// Identifies the <see cref="EasingFunction"/> dependency property.
        /// </summary>
        public static readonly DependencyProperty EasingFunctionProperty =
            DependencyProperty.Register(
                "EasingFunction", typeof(IEasingFunction), typeof(AnimatedGauge),
                new PropertyMetadata(null));
        /// <summary>
        /// Gets or sets the duration of the animation, in milliseconds.
        /// </summary>
        public double Duration
        {
            get { return (double)GetValue(DurationProperty); }
            set { SetValue(DurationProperty, value); }
        }
        /// <summary>
        /// Identifies the <see cref="Duration"/> dependency property.
        /// </summary>
        public static readonly DependencyProperty DurationProperty =
            DependencyProperty.Register(
                "Duration", typeof(double), typeof(AnimatedGauge),
                new PropertyMetadata(250.0));
    }
}
