namespace taapBrowser2.Forms
{
    partial class FrmBrowsers
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

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmBrowsers));
            this.BrowserTabs = new System.Windows.Forms.CustomTabControl();
            this.ilDefault = new System.Windows.Forms.ImageList(this.components);
            this.SuspendLayout();
            // 
            // BrowserTabs
            // 
            this.BrowserTabs.DisplayStyle = System.Windows.Forms.TabStyle.IE8;
            // 
            // 
            // 
            this.BrowserTabs.DisplayStyleProvider.BorderColor = System.Drawing.SystemColors.ControlDark;
            this.BrowserTabs.DisplayStyleProvider.BorderColorHot = System.Drawing.SystemColors.ControlDark;
            this.BrowserTabs.DisplayStyleProvider.BorderColorSelected = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(157)))), ((int)(((byte)(185)))));
            this.BrowserTabs.DisplayStyleProvider.CloserColor = System.Drawing.Color.DarkGray;
            this.BrowserTabs.DisplayStyleProvider.CloserColorActive = System.Drawing.Color.Red;
            this.BrowserTabs.DisplayStyleProvider.FocusTrack = false;
            this.BrowserTabs.DisplayStyleProvider.HotTrack = true;
            this.BrowserTabs.DisplayStyleProvider.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.BrowserTabs.DisplayStyleProvider.Opacity = 1F;
            this.BrowserTabs.DisplayStyleProvider.Overlap = 0;
            this.BrowserTabs.DisplayStyleProvider.Padding = new System.Drawing.Point(6, 5);
            this.BrowserTabs.DisplayStyleProvider.Radius = 3;
            this.BrowserTabs.DisplayStyleProvider.ShowTabCloser = true;
            this.BrowserTabs.DisplayStyleProvider.TextColor = System.Drawing.SystemColors.ControlText;
            this.BrowserTabs.DisplayStyleProvider.TextColorDisabled = System.Drawing.SystemColors.ControlDark;
            this.BrowserTabs.DisplayStyleProvider.TextColorSelected = System.Drawing.SystemColors.ControlText;
            this.BrowserTabs.Dock = System.Windows.Forms.DockStyle.Fill;
            this.BrowserTabs.HotTrack = true;
            this.BrowserTabs.ImageList = this.ilDefault;
            this.BrowserTabs.Location = new System.Drawing.Point(0, 0);
            this.BrowserTabs.Name = "BrowserTabs";
            this.BrowserTabs.SelectedIndex = 0;
            this.BrowserTabs.Size = new System.Drawing.Size(284, 261);
            this.BrowserTabs.TabIndex = 0;
            this.BrowserTabs.TabClosing += new System.EventHandler<System.Windows.Forms.TabControlCancelEventArgs>(this.BrowserTabs_TabClosing);
            this.BrowserTabs.SelectedIndexChanged += new System.EventHandler(this.BrowserTabs_SelectedIndexChanged);
            // 
            // ilDefault
            // 
            this.ilDefault.ImageStream = ((System.Windows.Forms.ImageListStreamer)(resources.GetObject("ilDefault.ImageStream")));
            this.ilDefault.TransparentColor = System.Drawing.Color.Transparent;
            this.ilDefault.Images.SetKeyName(0, "new-tab.png");
            this.ilDefault.Images.SetKeyName(1, "Document.png");
            // 
            // FrmBrowsers
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(284, 261);
            this.Controls.Add(this.BrowserTabs);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.Name = "FrmBrowsers";
            this.Text = "FrmBrowsers";
            this.Load += new System.EventHandler(this.FrmBrowsers_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.CustomTabControl BrowserTabs;
        private System.Windows.Forms.ImageList ilDefault;
    }
}