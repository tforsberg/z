using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Media;
using System.Windows.Input;
using System.Windows.Controls;

namespace ODataX
{
    /// <summary>
    /// Represents a control that redistributes space between columns or 
    /// rows of a <see cref="Grid"/> control.
    /// </summary>
    /// <remarks>
    /// This class is similar to the <b>GridSplitter</b> class in the 
    /// Microsoft SDK, and is used here to avoid adding a dependency on 
    /// the SDK assembly.
    /// </remarks>
    public class GridSplitter : Grid
    {
        Grid _parentGrid;
        int _index;
        double _szBefore, _szAfter;
        Point _ptDown;
        static SolidColorBrush _brTransparent = new SolidColorBrush(Colors.Transparent);

        /// <summary>
        /// Initializes a new instance of a <see cref="GridSplitter"/>.
        /// </summary>
        public GridSplitter()
        {
            Background = _brTransparent;
            LayoutUpdated += GridSplitter_LayoutUpdated;
            MouseLeftButtonDown += GridSplitter_MouseLeftButtonDown;
            MouseMove += GridSplitter_MouseMove;
            MouseLeftButtonUp += GridSplitter_MouseLeftButtonUp;
            LostMouseCapture += GridSplitter_LostMouseCapture;
        }

        // after layout, keep track of splitter orientation
        void GridSplitter_LayoutUpdated(object sender, EventArgs e)
        {
            // e.g. this.Height = 6: horizontal splitter, moves vertically
            if (!double.IsNaN(this.Height) && double.IsNaN(this.Width))
            {
                this.Cursor = Cursors.SizeNS;
                return;
            }

            // e.g. this.Width = 6: vertical splitter, moves horizontally
            if (!double.IsNaN(this.Width) && double.IsNaN(this.Height))
            {
                this.Cursor = Cursors.SizeWE;
                return;
            }

            var g = this.Parent as Grid;
            if (g != null)
            {
                // e.g. Row.Height = 6: horizontal splitter, moves vertically
                var row = (int)this.GetValue(Grid.RowProperty);
                if (row > 0 && row < g.RowDefinitions.Count - 1 && g.RowDefinitions[row].Height.IsAbsolute)
                {
                    this.Cursor = Cursors.SizeNS;
                    return;
                }
                    
                // e.g. Column.Width = 6: vertical splitter, moves horizontally
                var col = (int)this.GetValue(Grid.ColumnProperty);
                if (col > 0 && col < g.ColumnDefinitions.Count - 1 && g.ColumnDefinitions[col].Width.IsAbsolute)
                {
                    this.Cursor = Cursors.SizeNS;
                    return;
                }
            }

            // can't figure out the orientation?
            this.Cursor = null;
        }

        // when the user clicks the mouse, start tracking
        void GridSplitter_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            // grid and index of the row/column that contains this splitter
            _parentGrid = this.Parent as Grid;
            _index = -1;

            // capture the mouse, collect tracking info
            if (_parentGrid != null && CaptureMouse())
            {
                _ptDown = e.GetPosition(_parentGrid);
                if (this.Cursor == Cursors.SizeWE)
                {
                    var c = (int)GetValue(Grid.ColumnProperty);
                    _szBefore = _parentGrid.ColumnDefinitions[c - 1].ActualWidth;
                    _szAfter = _parentGrid.ColumnDefinitions[c + 1].ActualWidth;
                    _index = c;
                }
                else if (this.Cursor == Cursors.SizeNS)
                {
                    var r = (int)GetValue(Grid.RowProperty);
                    _szBefore = _parentGrid.RowDefinitions[r - 1].ActualHeight;
                    _szAfter = _parentGrid.RowDefinitions[r + 1].ActualHeight;
                    _index = r;
                }
            }
        }

        // apply delta as the user moves the mouse
        void GridSplitter_MouseMove(object sender, MouseEventArgs e)
        {
            if (_parentGrid != null && _index > 0)
            {
                var pt = e.GetPosition(_parentGrid);
                ApplyDelta(pt.X - _ptDown.X, pt.Y - _ptDown.Y);
            }
        }

        // stop tracking when the user releases the mouse or we lose the capture
        void GridSplitter_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            ReleaseMouseCapture();
        }
        void GridSplitter_LostMouseCapture(object sender, MouseEventArgs e)
        {
            _index = -1;
            _parentGrid = null;
        }

        // apply delta to resize parent grid
        void ApplyDelta(double dx, double dy)
        {
            if (this.Cursor == Cursors.SizeWE)
            {
                var before = _parentGrid.ColumnDefinitions[_index - 1];
                var after = _parentGrid.ColumnDefinitions[_index + 1];
                if (after.Width.IsStar)
                {
                    before.Width = new GridLength(_szBefore + dx, GridUnitType.Star);
                    after.Width = new GridLength(_szAfter - dx, GridUnitType.Star);
                }
                else
                {
                    before.Width = new GridLength(_szBefore + dx);
                    after.Width = new GridLength(_szAfter - dx);
                }
            }
            else if (this.Cursor == Cursors.SizeNS)
            {
                var before = _parentGrid.RowDefinitions[_index - 1];
                var after = _parentGrid.RowDefinitions[_index + 1];
                if (after.Height.IsStar)
                {
                    before.Height = new GridLength(_szBefore + dy, GridUnitType.Star);
                    after.Height = new GridLength(_szAfter - dy, GridUnitType.Star);
                }
                else
                {
                    before.Height = new GridLength(_szBefore + dy);
                    after.Height = new GridLength(_szAfter - dy);
                }
            }
        }
    }
}
