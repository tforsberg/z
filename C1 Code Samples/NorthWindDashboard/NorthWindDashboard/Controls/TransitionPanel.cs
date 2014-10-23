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
    /// Panel that shows one child at a time and provides an animation 
    /// when switching the active child.
    /// </summary>
    public class TransitionPanel : Grid
    {
        ICommand _cmdSwitchPanel;

        //----------------------------------------------------------------------------------
        #region ** ctor

        /// <summary>
        /// Initializes a new instance of a <see cref="TransitionPanel"/>.
        /// </summary>
        public TransitionPanel()
        {
            Loaded += (s, e) =>
                {
                    UpdateChildrenVisibility(SelectedIndex, -1);
                };
        }

        #endregion

        //----------------------------------------------------------------------------------
        #region ** object model

        /// <summary>
        /// Gets or sets the index of the child that is currently visible in the panel.
        /// </summary>
        public int SelectedIndex
        {
            get { return (int)GetValue(SelectedIndexProperty); }
            set { SetValue(SelectedIndexProperty, value); }
        }
        /// <summary>
        /// Identifies the <see cref="ItemsSource"/> dependency property.
        /// </summary>
        public static readonly DependencyProperty SelectedIndexProperty =
            DependencyProperty.Register("SelectedIndex", typeof(int),
                typeof(TransitionPanel), new PropertyMetadata(-1, TransitionPanel.OnSelectedIndexChanged));
        static void OnSelectedIndexChanged(DependencyObject d, DependencyPropertyChangedEventArgs e)
        {
            var tp = (TransitionPanel)d;
            tp.Switch((int)e.NewValue, (int)e.OldValue);
        }
        /// <summary>
        /// Gets or sets the IPanelTransition class that provides the transition effects.
        /// </summary>
        public IPanelTransition Transition
        {
            get { return (IPanelTransition)GetValue(TransitionProperty); }
            set { SetValue(TransitionProperty, value); }
        }
        /// <summary>
        /// Identifies the <see cref="Transition"/> dependency property.
        /// </summary>
        public static readonly DependencyProperty TransitionProperty =
            DependencyProperty.Register("Transition", typeof(IPanelTransition),
                typeof(TransitionPanel), new PropertyMetadata(new ProjectionTransition()));
        /// <summary>
        /// Gets or sets the duration of the transitions.
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
            DependencyProperty.Register("Duration", typeof(double),
                typeof(TransitionPanel), new PropertyMetadata(500.0));
        /// <summary>
        /// Gets an ICommand that can be used to switch panels.
        /// </summary>
        public ICommand SwitchPanelCommand
        {
            get
            {
                if (_cmdSwitchPanel == null)
                {
                    _cmdSwitchPanel = new SwitchPanelCommand(this);
                }
                return _cmdSwitchPanel;
            }
        }
        /// <summary>
        /// Sets the focus to the currently visible child.
        /// </summary>
        /// <returns>True if the focus was set successfully.</returns>
        public bool Focus()
        {
            if (this.SelectedIndex > -1 && this.SelectedIndex < Children.Count)
            {
                var ctl = FindControl(this.Children[this.SelectedIndex]);
                if (ctl != null)
                {
                    return ctl.Focus();
                }
            }
            return false;
        }

        #endregion

        //----------------------------------------------------------------------------------
        #region ** implementation

        void Switch(int newIndex, int oldIndex)
        {
            if (Transition != null)
            {
                // show only the child elements involved in the transition
                UpdateChildrenVisibility(newIndex, oldIndex);

                // apply the transition
                Transition.Switch(GetChild(newIndex), GetChild(oldIndex), Duration);
            }
        }
        void UpdateChildrenVisibility(int newIndex, int oldIndex)
        {
            for (int i = 0; i < Children.Count; i++)
            {
                Children[i].Visibility = i == newIndex || i == oldIndex
                    ? Visibility.Visible
                    : Visibility.Collapsed;
            }
        }
        UIElement GetChild(int index)
        {
            return index > -1 && index < Children.Count ? Children[index] : null;
        }
        Control FindControl(UIElement e)
        {
            var ctl = e as Control;
            if (ctl != null && ctl.IsEnabled && ctl.Visibility == Visibility.Visible)
            {
                return ctl;
            }
            var panel = e as Panel;
            if (panel != null)
            {
                foreach (var child in panel.Children)
                {
                    ctl = FindControl(child);
                    if (ctl != null)
                    {
                        return ctl;
                    }
                }
            }
            return null;
        }

        #endregion

    }
    /// <summary>
    /// Command to switch panels.
    /// </summary>
    internal class SwitchPanelCommand : ICommand
    {
        TransitionPanel _panel;

        public SwitchPanelCommand(TransitionPanel panel)
        {
            _panel = panel;
        }
        public bool CanExecute(object parameter)
        {
            return true;
        }
        public event EventHandler CanExecuteChanged;
        public void Execute(object parameter)
        {
            if (_panel != null)
            {
                _panel.SelectedIndex = (_panel.SelectedIndex + 1) % _panel.Children.Count;
                _panel.Focus();
            }
        }
    }
    /// <summary>
    /// Interface implemented by classes that provide transition effects.
    /// </summary>
    public interface IPanelTransition
    {
        void Switch(UIElement eIn, UIElement eOut, double duration);
    }
    /// <summary>
    /// Provides a projection transition that turns panels in pseudo 3-D.
    /// </summary>
    public class ProjectionTransition : IPanelTransition
    {
        string _property;
        public ProjectionTransition(bool vertical)
        {
            _property = vertical ? "RotationX" : "RotationY";
        }
        public ProjectionTransition() : this(false)
        {
        }
        public void Switch(UIElement eIn, UIElement eOut, double duration)
        {
            // create storyboard
            var sb = new Storyboard();

            // initialize parameters
            var ts = duration / 2;

            // rotate eOut from zero to 90
            if (eOut != null)
            {
                var da = CreateAnimation(eOut, _property, 0, 90, ts, 0);
                sb.Children.Add(da);

                var qe = new QuadraticEase();
                qe.EasingMode = EasingMode.EaseIn;
                da.EasingFunction = qe;
            }

            // rotate eIn from 90 to zero
            if (eIn != null)
            {
                var da = CreateAnimation(eIn, _property, -90, 0, ts, eOut != null ? ts : 0);
                sb.Children.Add(da);

                var qe = new QuadraticEase();
                qe.EasingMode = EasingMode.EaseOut;
                da.EasingFunction = qe;
            }

            // do it
            sb.Begin();
        }
        DoubleAnimation CreateAnimation(UIElement e, string property, double from, double to, double duration, double begin)
        {
            if (e.Projection == null)
            {
                e.Projection = new PlaneProjection();
                e.Projection.GetType().GetProperty(property).SetValue(e.Projection, from, null);
            }

            var da = new DoubleAnimation();
            da.From = from;
            da.To = to;
            da.Duration = TimeSpan.FromMilliseconds(duration);
            da.BeginTime = TimeSpan.FromMilliseconds(begin);
            Storyboard.SetTargetProperty(da, new PropertyPath(property));
            Storyboard.SetTarget(da, e.Projection);

            return da;
        }
    }
    /// <summary>
    /// Provides a rotation transition that spins panels into view.
    /// </summary>
    public class RotationTransition : IPanelTransition
    {
        public void Switch(UIElement eIn, UIElement eOut, double duration)
        {
            // create storyboard
            var sb = new Storyboard();

            // make sure eIn is behind eOut
            if (eIn != null)
            {
                eIn.SetValue(Canvas.ZIndexProperty, 0);
                eIn.RenderTransform = null;
                eIn.Opacity = 1;
            }

            // rotate eOut from zero to 90
            if (eOut != null)
            {
                eOut.SetValue(Canvas.ZIndexProperty, 1);

                var ease = new PowerEase();
                ease.EasingMode = EasingMode.EaseOut;
                ease.Power = 3;

                var rt = new RotateTransform();
                eOut.RenderTransform = rt;
                var da = new DoubleAnimation();
                da.To = 90;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                da.EasingFunction = ease;
                Storyboard.SetTargetProperty(da, new PropertyPath("Angle"));
                Storyboard.SetTarget(da, rt);
                sb.Children.Add(da);

                da = new DoubleAnimation();
                da.From = 1;
                da.To = 0;
                da.BeginTime = TimeSpan.FromMilliseconds(duration * .8);
                da.Duration = TimeSpan.FromMilliseconds(duration * .2);
                da.EasingFunction = ease;
                Storyboard.SetTargetProperty(da, new PropertyPath("Opacity"));
                Storyboard.SetTarget(da, eOut);
                sb.Children.Add(da);
            }

            // do it
            sb.Begin();
        }
    }
    /// <summary>
    /// Provides a scale transition that shrinks panels away from view.
    /// </summary>
    public class ShrinkTransition : IPanelTransition
    {
        public void Switch(UIElement eIn, UIElement eOut, double duration)
        {
            // create storyboard
            var sb = new Storyboard();

            // make sure eIn is behind eOut
            if (eIn != null)
            {
                eIn.SetValue(Canvas.ZIndexProperty, 0);
                eIn.RenderTransform = null;
            }

            // spin and shrink eOut
            if (eOut != null)
            {
                eOut.SetValue(Canvas.ZIndexProperty, 1);

                var rt = new RotateTransform();
                var da = new DoubleAnimation();
                da.From = 0;
                da.To = 270;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                Storyboard.SetTargetProperty(da, new PropertyPath("Angle"));
                Storyboard.SetTarget(da, rt);
                sb.Children.Add(da);

                var st = new ScaleTransform();
                da = new DoubleAnimation();
                da.From = 1;
                da.To = 0;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                Storyboard.SetTargetProperty(da, new PropertyPath("ScaleX"));
                Storyboard.SetTarget(da, st);
                sb.Children.Add(da);

                da = new DoubleAnimation();
                da.From = 1;
                da.To = 0;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                Storyboard.SetTargetProperty(da, new PropertyPath("ScaleY"));
                Storyboard.SetTarget(da, st);
                sb.Children.Add(da);

                var tg = new TransformGroup();
                tg.Children.Add(rt);
                tg.Children.Add(st);

                eOut.RenderTransformOrigin = new Point(.5, .5);
                eOut.RenderTransform = tg;
            }

            // do it
            sb.Begin();
        }
    }
    /// <summary>
    /// Provides a scale transition that grows panels into view.
    /// </summary>
    public class GrowTransition : IPanelTransition
    {
        public void Switch(UIElement eIn, UIElement eOut, double duration)
        {
            // create storyboard
            var sb = new Storyboard();

            // make sure eOut is above eIn
            if (eOut != null)
            {
                eOut.SetValue(Canvas.ZIndexProperty, 0);
                eOut.RenderTransform = null;
            }

            // spin and grow eIn
            if (eIn != null)
            {
                eIn.SetValue(Canvas.ZIndexProperty, 1);

                var rt = new RotateTransform();
                var da = new DoubleAnimation();
                da.From = -270;
                da.To = 0;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                Storyboard.SetTargetProperty(da, new PropertyPath("Angle"));
                Storyboard.SetTarget(da, rt);
                sb.Children.Add(da);

                var st = new ScaleTransform();
                da = new DoubleAnimation();
                da.From = 0;
                da.To = 1;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                Storyboard.SetTargetProperty(da, new PropertyPath("ScaleX"));
                Storyboard.SetTarget(da, st);
                sb.Children.Add(da);

                da = new DoubleAnimation();
                da.From = 0;
                da.To = 1;
                da.Duration = TimeSpan.FromMilliseconds(duration);
                Storyboard.SetTargetProperty(da, new PropertyPath("ScaleY"));
                Storyboard.SetTarget(da, st);
                sb.Children.Add(da);

                var tg = new TransformGroup();
                tg.Children.Add(rt);
                tg.Children.Add(st);

                eIn.RenderTransformOrigin = new Point(.5, .5);
                eIn.RenderTransform = tg;
            }

            // do it
            sb.Begin();
            sb.Completed += (s, e) =>
                {
                    eOut.Visibility = Visibility.Collapsed;
                };
        }
    }
}
