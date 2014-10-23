using System;
using System.ComponentModel;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Shapes;

namespace ODataX
{
    public partial class ModalDialog : UserControl
    {
        // ** ctor
        public ModalDialog() : this("Caption", null, null)
        {
        }
        public ModalDialog(string caption, FrameworkElement content, object dataContext)
        {
            InitializeComponent();

            DataContext = dataContext;
            _tbCaption.Text = caption;
            _content.Child = content;
            _btnOK.Click += _btnOK_Click;
            _btnCancel.Click += _btnCancel_Click;
            _tbClose.MouseLeftButtonDown += _btnCancel_Click;

            // start editing data object
            var eo = DataContext as IEditableObject;
            if (eo != null)
            {
                eo.BeginEdit();
            }
        }

        // ** object model
        public void ShowDialog(MessageBoxButton buttons)
        {
            _btnCancel.Visibility = buttons == MessageBoxButton.OKCancel
                ? Visibility.Visible
                : Visibility.Collapsed;
            var root = ((UserControl)Application.Current.RootVisual).Content as Panel;
            root.Children.Add(this);
        }
        public event EventHandler<CancelEventArgs> Closed;

        // ** implementation
        void _btnOK_Click(object sender, RoutedEventArgs e)
        {
            // finish editing data object
            var eo = DataContext as IEditableObject;
            if (eo != null)
            {
                eo.EndEdit();
            }

            // fire close dialog event
            CloseDialog(false);
        }
        void _btnCancel_Click(object sender, RoutedEventArgs e)
        {
            // cancel editing data object
            var eo = DataContext as IEditableObject;
            if (eo != null)
            {
                eo.CancelEdit();
            }

            // fire close dialog event
            CloseDialog(true);
        }
        void CloseDialog(bool cancel)
        {
            var root = ((UserControl)Application.Current.RootVisual).Content as Panel;
            root.Children.Remove(this);
            if (Closed != null)
            {
                Closed(this, new CancelEventArgs(cancel));
            }
        }
    }
}
