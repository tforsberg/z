using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using taapBrowser2.Properties;

namespace taapBrowser2.Classes
{
    class UserSettings
    {


        /// <summary>
        /// Save The User Settings
        /// </summary>
        public static void Save()
        {
            // Seems that the save operation is not completing when closing down.. So trying Async
            Task.Factory.StartNew(() => SaveAsync()); 
        }

        private static void SaveAsync()
        {
            Settings.Default.Save();
        }

        private static void ResetDefaultsAsync()
        {
            Settings.Default.MaximumTabLength = (decimal)Settings.Default.Properties["MaximumTabLength"].DefaultValue;
            Settings.Default.Homepage = Settings.Default.Properties["Homepage"].DefaultValue as string;
        }

        public static void ResetDefaults()
        {
            Task.Factory.StartNew(() => ResetDefaultsAsync());
        }
        
    }
}
