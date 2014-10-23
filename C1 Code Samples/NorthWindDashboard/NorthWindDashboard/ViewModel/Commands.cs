using System;
using System.Net;
using System.Linq;
using System.Windows;
using System.Windows.Input;
using System.Windows.Data;
using System.ComponentModel;
using System.Collections;
using System.Collections.Generic;
using System.Collections.ObjectModel;

namespace NorthWindDashboard
{
    /// <summary>
    /// Class that implements the ICommand interface to select the current quarter.
    /// </summary>
    public class SelectQuarter : ICommand
    {
        ViewModel _model;
        int _offset;

        public SelectQuarter(ViewModel model, int offset)
        {
            // save data to navigate quarters in the model
            _model = model;
            _offset = offset;

            // enable/disable command when the current quarter changes
            _model.Quarters.CurrentChanged += Quarters_CurrentChanged;
            Quarters_CurrentChanged(this, EventArgs.Empty);
        }
        void Quarters_CurrentChanged(object sender, EventArgs e)
        {
            if (CanExecuteChanged != null)
                CanExecuteChanged(this, e);
        }
        public event EventHandler CanExecuteChanged;
        public bool CanExecute(object parameter)
        {
            // check whether we can navigate back/forth
            var q = _model.Quarters;
            return
                _offset < 0 ? q.CurrentPosition > 0 :
                _offset > 0 ? q.CurrentPosition < ((IList)q.SourceCollection).Count - 1 :
                false;
        }
        public void Execute(object parameter)
        {
            var q = _model.Quarters;
            switch (_offset)
            {
                case -1:
                    q.MoveCurrentToPrevious();
                    break;
                case +1:
                    q.MoveCurrentToNext();
                    break;
                case int.MinValue:
                    q.MoveCurrentToFirst();
                    break;
                case int.MaxValue:
                    q.MoveCurrentToLast();
                    break;
            }
        }
    }
}
