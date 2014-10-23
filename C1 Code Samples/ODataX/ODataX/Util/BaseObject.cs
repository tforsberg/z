using System;
using System.Collections.Generic;
using System.ComponentModel;

namespace ODataX
{
    public class BaseObject : 
        INotifyPropertyChanged,
        IEditableObject
    {
        // ** INotifyPropertyChanged
        public event PropertyChangedEventHandler PropertyChanged;
        protected virtual void OnPropertyChanged(string propName)
        {
            if (PropertyChanged != null)
                PropertyChanged(this, new PropertyChangedEventArgs(propName));
        }
        protected bool SetValue<T>(ref T field, T value, string propertyName)
        {
            if (!EqualityComparer<T>.Default.Equals(field, value))
            {
                field = value;
                OnPropertyChanged(propertyName);
                return true;
            }
            return false;
        }

        // ** IEditableObject
        Dictionary<string, object> _dct;
        public void BeginEdit()
        {
            _dct = new Dictionary<string, object>();
            foreach (var pi in this.GetType().GetProperties())
            {
                if (pi.CanRead && pi.CanWrite)
                {
                    _dct[pi.Name] = pi.GetValue(this, null);
                }
            }
        }
        public void CancelEdit()
        {
            if (_dct != null)
            {
                foreach (var pi in this.GetType().GetProperties())
                {
                    if (pi.CanRead && pi.CanWrite)
                    {
                        pi.SetValue(this, _dct[pi.Name], null);
                    }
                }
            }
        }
        public void EndEdit()
        {
            _dct = null;
        }
    }
}
