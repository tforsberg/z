namespace taapBrowser2.Controls
{
    partial class ctrlBrowser
    {
        /// <summary> 
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary> 
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Component Designer generated code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.toolStripContainer1 = new System.Windows.Forms.ToolStripContainer();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripProgressBar1 = new System.Windows.Forms.ToolStripProgressBar();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lbStatus = new System.Windows.Forms.ToolStripStatusLabel();
            this.BrowserControl = new Awesomium.Windows.Forms.WebControl(this.components);
            this.AddressBar = new System.Windows.Forms.ToolStrip();
            this.btnBack = new System.Windows.Forms.ToolStripButton();
            this.btnForward = new System.Windows.Forms.ToolStripButton();
            this.btnSecure = new System.Windows.Forms.ToolStripButton();
            this.tbAddressBar = new Awesomium.Windows.Forms.ToolStripAddressBox();
            this.btnReload = new System.Windows.Forms.ToolStripButton();
            this.btnFavourites = new System.Windows.Forms.ToolStripButton();
            this.btnSearchProvider = new System.Windows.Forms.ToolStripSplitButton();
            this.googleToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.tbSearchBox = new System.Windows.Forms.ToolStripTextBox();
            this.btnSearch = new System.Windows.Forms.ToolStripButton();
            this.btnHome = new System.Windows.Forms.ToolStripButton();
            this.btnMenu = new System.Windows.Forms.ToolStripDropDownButton();
            this.SessionProvider1 = new Awesomium.Windows.Forms.WebSessionProvider(this.components);
            this.toolStripContainer1.BottomToolStripPanel.SuspendLayout();
            this.toolStripContainer1.ContentPanel.SuspendLayout();
            this.toolStripContainer1.TopToolStripPanel.SuspendLayout();
            this.toolStripContainer1.SuspendLayout();
            this.statusStrip1.SuspendLayout();
            this.AddressBar.SuspendLayout();
            this.SuspendLayout();
            // 
            // toolStripContainer1
            // 
            // 
            // toolStripContainer1.BottomToolStripPanel
            // 
            this.toolStripContainer1.BottomToolStripPanel.Controls.Add(this.statusStrip1);
            // 
            // toolStripContainer1.ContentPanel
            // 
            this.toolStripContainer1.ContentPanel.Controls.Add(this.BrowserControl);
            this.toolStripContainer1.ContentPanel.Size = new System.Drawing.Size(969, 701);
            this.toolStripContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.toolStripContainer1.Location = new System.Drawing.Point(0, 0);
            this.toolStripContainer1.Name = "toolStripContainer1";
            this.toolStripContainer1.Size = new System.Drawing.Size(969, 748);
            this.toolStripContainer1.TabIndex = 1;
            this.toolStripContainer1.Text = "toolStripContainer1";
            // 
            // toolStripContainer1.TopToolStripPanel
            // 
            this.toolStripContainer1.TopToolStripPanel.Controls.Add(this.AddressBar);
            // 
            // statusStrip1
            // 
            this.statusStrip1.Dock = System.Windows.Forms.DockStyle.None;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripProgressBar1,
            this.toolStripStatusLabel1,
            this.lbStatus});
            this.statusStrip1.Location = new System.Drawing.Point(0, 0);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(969, 22);
            this.statusStrip1.TabIndex = 0;
            // 
            // toolStripProgressBar1
            // 
            this.toolStripProgressBar1.Name = "toolStripProgressBar1";
            this.toolStripProgressBar1.Size = new System.Drawing.Size(100, 16);
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(39, 17);
            this.toolStripStatusLabel1.Text = "Status";
            // 
            // lbStatus
            // 
            this.lbStatus.Name = "lbStatus";
            this.lbStatus.Size = new System.Drawing.Size(813, 17);
            this.lbStatus.Spring = true;
            this.lbStatus.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            // 
            // BrowserControl
            // 
            this.BrowserControl.Dock = System.Windows.Forms.DockStyle.Fill;
            this.BrowserControl.Location = new System.Drawing.Point(0, 0);
            this.BrowserControl.Size = new System.Drawing.Size(969, 701);
            this.BrowserControl.Source = new System.Uri("about:blank", System.UriKind.Absolute);
            this.BrowserControl.TabIndex = 0;
            // 
            // AddressBar
            // 
            this.AddressBar.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.AddressBar.Dock = System.Windows.Forms.DockStyle.None;
            this.AddressBar.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btnBack,
            this.btnForward,
            this.btnSecure,
            this.tbAddressBar,
            this.btnReload,
            this.btnFavourites,
            this.btnSearchProvider,
            this.tbSearchBox,
            this.btnSearch,
            this.btnHome,
            this.btnMenu});
            this.AddressBar.Location = new System.Drawing.Point(0, 0);
            this.AddressBar.Name = "AddressBar";
            this.AddressBar.ShowItemToolTips = false;
            this.AddressBar.Size = new System.Drawing.Size(969, 25);
            this.AddressBar.Stretch = true;
            this.AddressBar.TabIndex = 0;
            this.AddressBar.SizeChanged += new System.EventHandler(this.AddressBar_SizeChanged);
            // 
            // btnBack
            // 
            this.btnBack.AutoSize = false;
            this.btnBack.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnBack.Image = global::taapBrowser2.Properties.Resources.Alarm_Arrow_Left_icon;
            this.btnBack.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(23, 22);
            this.btnBack.Text = "toolStripButton1";
            this.btnBack.Click += new System.EventHandler(this.BtnBackClick);
            // 
            // btnForward
            // 
            this.btnForward.AutoSize = false;
            this.btnForward.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnForward.Image = global::taapBrowser2.Properties.Resources.Arrow_Right;
            this.btnForward.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnForward.Name = "btnForward";
            this.btnForward.Size = new System.Drawing.Size(23, 22);
            this.btnForward.Text = "toolStripButton2";
            this.btnForward.Click += new System.EventHandler(this.BtnForwardClick);
            // 
            // btnSecure
            // 
            this.btnSecure.AutoSize = false;
            this.btnSecure.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnSecure.Image = global::taapBrowser2.Properties.Resources.Green_check_box_with_check_mark_289x250;
            this.btnSecure.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnSecure.Name = "btnSecure";
            this.btnSecure.Size = new System.Drawing.Size(23, 22);
            this.btnSecure.Text = "toolStripButton3";
            this.btnSecure.Click += new System.EventHandler(this.BtnSecureClick);
            // 
            // tbAddressBar
            // 
            this.tbAddressBar.AutoSize = false;
            this.tbAddressBar.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.tbAddressBar.Name = "tbAddressBar";
            this.tbAddressBar.Size = new System.Drawing.Size(460, 25);
            this.tbAddressBar.URL = null;
            this.tbAddressBar.WebControl = this.BrowserControl;
            // 
            // btnReload
            // 
            this.btnReload.AutoSize = false;
            this.btnReload.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnReload.Image = global::taapBrowser2.Properties.Resources.refresh;
            this.btnReload.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnReload.Name = "btnReload";
            this.btnReload.Size = new System.Drawing.Size(23, 22);
            this.btnReload.Text = "toolStripButton5";
            this.btnReload.Click += new System.EventHandler(this.BtnReloadClick);
            // 
            // btnFavourites
            // 
            this.btnFavourites.AutoSize = false;
            this.btnFavourites.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnFavourites.Image = global::taapBrowser2.Properties.Resources.add_to_favourites;
            this.btnFavourites.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnFavourites.Name = "btnFavourites";
            this.btnFavourites.Size = new System.Drawing.Size(23, 22);
            this.btnFavourites.Text = "toolStripButton4";
            this.btnFavourites.Click += new System.EventHandler(this.BtnFavouritesClick);
            // 
            // btnSearchProvider
            // 
            this.btnSearchProvider.AutoSize = false;
            this.btnSearchProvider.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnSearchProvider.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.googleToolStripMenuItem});
            this.btnSearchProvider.Image = global::taapBrowser2.Properties.Resources.social_google_box_250x2501;
            this.btnSearchProvider.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnSearchProvider.Name = "btnSearchProvider";
            this.btnSearchProvider.Size = new System.Drawing.Size(32, 22);
            this.btnSearchProvider.Text = "toolStripButton6";
            // 
            // googleToolStripMenuItem
            // 
            this.googleToolStripMenuItem.Image = global::taapBrowser2.Properties.Resources.social_google_box_250x2501;
            this.googleToolStripMenuItem.Name = "googleToolStripMenuItem";
            this.googleToolStripMenuItem.Size = new System.Drawing.Size(112, 22);
            this.googleToolStripMenuItem.Text = "Google";
            // 
            // tbSearchBox
            // 
            this.tbSearchBox.AutoSize = false;
            this.tbSearchBox.Name = "tbSearchBox";
            this.tbSearchBox.Size = new System.Drawing.Size(100, 25);
            this.tbSearchBox.KeyUp += new System.Windows.Forms.KeyEventHandler(this.TbSearchBoxKeyUp);
            // 
            // btnSearch
            // 
            this.btnSearch.AutoSize = false;
            this.btnSearch.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnSearch.Image = global::taapBrowser2.Properties.Resources.Search_Search_icon;
            this.btnSearch.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(23, 22);
            this.btnSearch.Text = "toolStripButton7";
            this.btnSearch.Click += new System.EventHandler(this.BtnSearchClick);
            // 
            // btnHome
            // 
            this.btnHome.AutoSize = false;
            this.btnHome.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnHome.Image = global::taapBrowser2.Properties.Resources.homeenergy;
            this.btnHome.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnHome.Name = "btnHome";
            this.btnHome.Size = new System.Drawing.Size(23, 22);
            this.btnHome.Text = "toolStripButton8";
            this.btnHome.Click += new System.EventHandler(this.BtnHomeClick);
            // 
            // btnMenu
            // 
            this.btnMenu.AutoSize = false;
            this.btnMenu.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.btnMenu.Image = global::taapBrowser2.Properties.Resources.menu;
            this.btnMenu.ImageTransparentColor = System.Drawing.Color.Magenta;
            this.btnMenu.Name = "btnMenu";
            this.btnMenu.Size = new System.Drawing.Size(29, 22);
            this.btnMenu.Text = "toolStripDropDownButton1";
            // 
            // ctrlBrowser
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.Controls.Add(this.toolStripContainer1);
            this.Name = "ctrlBrowser";
            this.Size = new System.Drawing.Size(969, 748);
            this.toolStripContainer1.BottomToolStripPanel.ResumeLayout(false);
            this.toolStripContainer1.BottomToolStripPanel.PerformLayout();
            this.toolStripContainer1.ContentPanel.ResumeLayout(false);
            this.toolStripContainer1.TopToolStripPanel.ResumeLayout(false);
            this.toolStripContainer1.TopToolStripPanel.PerformLayout();
            this.toolStripContainer1.ResumeLayout(false);
            this.toolStripContainer1.PerformLayout();
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.AddressBar.ResumeLayout(false);
            this.AddressBar.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ToolStripContainer toolStripContainer1;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.ToolStripProgressBar toolStripProgressBar1;
        private Awesomium.Windows.Forms.WebControl BrowserControl;
        private System.Windows.Forms.ToolStrip AddressBar;
        private System.Windows.Forms.ToolStripButton btnBack;
        private System.Windows.Forms.ToolStripButton btnForward;
        private System.Windows.Forms.ToolStripButton btnSecure;
        private Awesomium.Windows.Forms.ToolStripAddressBox tbAddressBar;
        private System.Windows.Forms.ToolStripButton btnReload;
        private System.Windows.Forms.ToolStripButton btnFavourites;
        private System.Windows.Forms.ToolStripSplitButton btnSearchProvider;
        private System.Windows.Forms.ToolStripMenuItem googleToolStripMenuItem;
        private System.Windows.Forms.ToolStripTextBox tbSearchBox;
        private System.Windows.Forms.ToolStripButton btnSearch;
        private System.Windows.Forms.ToolStripButton btnHome;
        private System.Windows.Forms.ToolStripDropDownButton btnMenu;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.Windows.Forms.ToolStripStatusLabel lbStatus;
        private Awesomium.Windows.Forms.WebSessionProvider SessionProvider1;
    }
}
