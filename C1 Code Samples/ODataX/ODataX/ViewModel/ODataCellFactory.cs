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
using C1.Silverlight.FlexGrid;
using C1.Silverlight.Data;

namespace ODataX
{
    public class ODataCellFactory : CellFactory
    {
        public override void CreateCellContent(C1FlexGrid grid, Border bdr, CellRange rng)
        {
            var tableLink = grid[rng.Row, rng.Column] as TableLink;
            if (tableLink != null)
            {
                var btn = new HyperlinkButton();
                btn.Tag = tableLink;
                btn.Content = tableLink.Href;
                btn.VerticalAlignment = VerticalAlignment.Center;
                btn.HorizontalAlignment = HorizontalAlignment.Left;
                btn.Click += btn_Click;
                bdr.Child = btn;
            }
            else
            {
                base.CreateCellContent(grid, bdr, rng);
            }
        }

        void btn_Click(object sender, RoutedEventArgs e)
        {
            // get ViewModel
            var btn = sender as HyperlinkButton;
            var flex = C1.Util.Util.GetParentOfType<C1FlexGrid>(btn);
            var vm = flex.DataContext as ViewModel;

            // get current table
            var ds = vm.DataSources.CurrentItem as DataSource;
            var dt = ds.Tables.CurrentItem as DataTable;

            // open child table
            var tl = btn.Tag as TableLink;
            dt.NavigateTo(tl);
        }
    }
}
