﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using WeifenLuo.WinFormsUI.Docking;

namespace taapBrowser.Forms
{
    public partial class FrmBrowser : DockContent
    {

        #region Threading Delegates
        private delegate void UpdateButtonImageDelegate();
        #endregion

        #region Settings
        private int tabIconSize = 25;
        #endregion

        /// <summary>
        /// Initialise the Browser Control
        /// </summary>
        public FrmBrowser()
        {
            InitializeComponent();

            this.AddressBar.Height = 30;
            this.LoadStyles(); // Load the AddressBar Styles
            this.ResizeTheAddressBar();
        }

        #region Styles

        /// <summary>
        /// Load the AddressBar Styles
        /// </summary>
        private void LoadStyles()
        {
            try
            {
                
                LoadBackButton();

                LoadForwardButton();

                LoadStatusButton();

                LoadFavouritesButton();

                LoadRefreshButton();

                LoadSearchProviderButton();

                LoadSearchButton();

                LoadHomeButton();
            }
            catch (Exception)
            {

                throw;
            }

        }

        /// <summary>
        /// Load the User's Back button image or if none selected - the Default.
        /// </summary>
        private void LoadBackButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadBackButton), null);
            }
            else
            {
                this.btnBack.Image = ScaleImage(global::taapBrowser.Properties.Resources.Alarm_Arrow_Left_icon, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's Forward button image or if none selected - the Default.
        /// </summary>
        private void LoadForwardButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadForwardButton), null);
            }
            else
            {
                this.btnForward.Image = ScaleImage(global::taapBrowser.Properties.Resources.Arrow_Right, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's Security button image or if none selected - the Default.
        /// </summary>
        private void LoadStatusButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadStatusButton), null);
            }
            else
            {
                this.btnSecure.Image = ScaleImage(global::taapBrowser.Properties.Resources.Green_check_box_with_check_mark_289x250, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's Favourites button image or if none selected - the Default.
        /// </summary>
        private void LoadFavouritesButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadFavouritesButton), null);
            }
            else
            {
                this.btnFavourites.Image = ScaleImage(global::taapBrowser.Properties.Resources.add_to_favourites, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's reload button image or if none selected - the Default.
        /// </summary>
        private void LoadRefreshButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadRefreshButton), null);
            }
            else
            {
                this.btnReload.Image = ScaleImage(global::taapBrowser.Properties.Resources.refresh, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's Search provider button image or if none selected - the Default.
        /// </summary>
        private void LoadSearchProviderButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadSearchProviderButton), null);
            }
            else
            {
                this.btnSearchProvider.Image = ScaleImage(global::taapBrowser.Properties.Resources.social_google_box_250x2501, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's Search button image or if none selected - the Default.
        /// </summary>
        private void LoadSearchButton()
        {
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadSearchButton), null);
            }
            else
            {
                this.btnSearch.Image = ScaleImage(global::taapBrowser.Properties.Resources.Search_Search_icon, tabIconSize, tabIconSize);
            }
        }

        /// <summary>
        /// Load the User's Home button image or if none selected - the Default.
        /// </summary>
        private void LoadHomeButton()
        {
            
            if (AddressBar.InvokeRequired)
            {
                AddressBar.Invoke(new UpdateButtonImageDelegate(LoadHomeButton), null);
            }
            else
            {
                this.btnHome.Image = ScaleImage(global::taapBrowser.Properties.Resources.homeenergy, tabIconSize, tabIconSize);
            }
        }

        #endregion



        #region Utilities

        /// <summary>
        /// Allows the application to scale images so that they are suitable for the AddressBar
        /// </summary>
        /// <param name="image">
        /// Image: The Image to scale
        /// </param>
        /// <param name="maxWidth">
        /// Int: The Width to scale this image to.
        /// </param>
        /// <param name="maxHeight">
        /// Int: The Width to Scale this image to
        /// </param>
        /// <returns></returns>
        private static Image ScaleImage(Image image, int maxWidth, int maxHeight)
        {
            var ratioX = (double)maxWidth / image.Width;
            var ratioY = (double)maxHeight / image.Height;
            var ratio = Math.Min(ratioX, ratioY);

            var newWidth = (int)(image.Width * ratio);
            var newHeight = (int)(image.Height * ratio);

            var newImage = new Bitmap(newWidth, newHeight);
            Graphics.FromImage(newImage).DrawImage(image, 0, 0, newWidth, newHeight);
            return newImage;
        }

        /// <summary>
        /// Resizes the address bar so that the URL input area takes up as much room as possible horizontally.
        /// </summary>
        private void ResizeTheAddressBar()
        {
            int wid = this.GetAddressBarControlsWidth();
            if (this.AddressBar.Size.Width - wid != this.tbAddressBox.Size.Width)
            {
                this.tbAddressBox.Size = new Size((this.AddressBar.Size.Width - (wid + 100)), this.tbAddressBox.Size.Height);
            }
        }

        /// <summary>
        /// Calculates the current width of the AddressBar
        /// </summary>
        /// <returns>
        /// int: The current width of the AddressBar
        /// </returns>
        private int GetAddressBarControlsWidth()
        {
            int width = 0;

            ToolStripItemCollection tsic = AddressBar.Items;

            foreach (ToolStripItem item in tsic)
            {
                if (item.Name != "tbAddressBox")
                {
                    width += item.Width;
                    width += item.Margin.Horizontal;
                }
            }
            return width;
        }

        #endregion

        private void FrmBrowser_Resize(object sender, EventArgs e)
        {

             this.AddressBar.Height = tabIconSize;
             this.ResizeTheAddressBar();
             this.AddressBar.Refresh();
        }

        private void FrmBrowser_FormClosing(object sender, FormClosingEventArgs e)
        {
            try
            {
Browser.Dispose();
            }
            catch (Exception)
            {
                
                throw;
            }
            
        }
    }
}
