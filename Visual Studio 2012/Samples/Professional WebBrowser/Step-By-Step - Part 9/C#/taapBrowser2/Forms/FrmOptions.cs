using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using WeifenLuo.WinFormsUI.Docking;
using taapBrowser2.Classes;

namespace taapBrowser2.Forms
{
    public partial class FrmOptions : DockContent
    {
       

        public FrmOptions()
        {
            InitializeComponent();
        }

       
        private void BtnSaveClick(object sender, EventArgs e)
        {
            UserSettings.Save();
        }

        // Reset all the Settings
        private void BtnCancelClick(object sender, EventArgs e)
        {
            UserSettings.ResetDefaults();
        }
    }
}
