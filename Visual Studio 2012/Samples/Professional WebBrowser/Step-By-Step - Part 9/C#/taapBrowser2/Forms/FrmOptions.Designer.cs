namespace taapBrowser2.Forms
{
    partial class FrmOptions
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnSave = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.customTabControl1 = new System.Windows.Forms.CustomTabControl();
            this.tpDesigner = new System.Windows.Forms.TabPage();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.tbHomePage = new System.Windows.Forms.TextBox();
            this.numericMaxTabLength = new System.Windows.Forms.NumericUpDown();
            this.panel1.SuspendLayout();
            this.customTabControl1.SuspendLayout();
            this.tpDesigner.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericMaxTabLength)).BeginInit();
            this.SuspendLayout();
            // 
            // panel1
            // 
            this.panel1.Controls.Add(this.btnSave);
            this.panel1.Controls.Add(this.btnCancel);
            this.panel1.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panel1.Location = new System.Drawing.Point(0, 165);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(342, 39);
            this.panel1.TabIndex = 0;
            // 
            // btnSave
            // 
            this.btnSave.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnSave.DialogResult = System.Windows.Forms.DialogResult.OK;
            this.btnSave.Location = new System.Drawing.Point(142, 6);
            this.btnSave.Name = "btnSave";
            this.btnSave.Size = new System.Drawing.Size(75, 23);
            this.btnSave.TabIndex = 1;
            this.btnSave.Text = "Save";
            this.btnSave.UseVisualStyleBackColor = true;
            this.btnSave.Click += new System.EventHandler(this.BtnSaveClick);
            // 
            // btnCancel
            // 
            this.btnCancel.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCancel.DialogResult = System.Windows.Forms.DialogResult.Cancel;
            this.btnCancel.Location = new System.Drawing.Point(223, 6);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(101, 23);
            this.btnCancel.TabIndex = 0;
            this.btnCancel.Text = "Reset Defaults";
            this.btnCancel.UseVisualStyleBackColor = true;
            this.btnCancel.Click += new System.EventHandler(this.BtnCancelClick);
            // 
            // customTabControl1
            // 
            this.customTabControl1.Controls.Add(this.tpDesigner);
            // 
            // 
            // 
            this.customTabControl1.DisplayStyleProvider.BorderColor = System.Drawing.SystemColors.ControlDark;
            this.customTabControl1.DisplayStyleProvider.BorderColorHot = System.Drawing.SystemColors.ControlDark;
            this.customTabControl1.DisplayStyleProvider.BorderColorSelected = System.Drawing.Color.FromArgb(((int)(((byte)(127)))), ((int)(((byte)(157)))), ((int)(((byte)(185)))));
            this.customTabControl1.DisplayStyleProvider.CloserColor = System.Drawing.Color.DarkGray;
            this.customTabControl1.DisplayStyleProvider.FocusTrack = true;
            this.customTabControl1.DisplayStyleProvider.HotTrack = true;
            this.customTabControl1.DisplayStyleProvider.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.customTabControl1.DisplayStyleProvider.Opacity = 1F;
            this.customTabControl1.DisplayStyleProvider.Overlap = 0;
            this.customTabControl1.DisplayStyleProvider.Padding = new System.Drawing.Point(6, 3);
            this.customTabControl1.DisplayStyleProvider.Radius = 2;
            this.customTabControl1.DisplayStyleProvider.ShowTabCloser = false;
            this.customTabControl1.DisplayStyleProvider.TextColor = System.Drawing.SystemColors.ControlText;
            this.customTabControl1.DisplayStyleProvider.TextColorDisabled = System.Drawing.SystemColors.ControlDark;
            this.customTabControl1.DisplayStyleProvider.TextColorSelected = System.Drawing.SystemColors.ControlText;
            this.customTabControl1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.customTabControl1.HotTrack = true;
            this.customTabControl1.Location = new System.Drawing.Point(0, 0);
            this.customTabControl1.Name = "customTabControl1";
            this.customTabControl1.SelectedIndex = 0;
            this.customTabControl1.Size = new System.Drawing.Size(342, 165);
            this.customTabControl1.TabIndex = 1;
            // 
            // tpDesigner
            // 
            this.tpDesigner.Controls.Add(this.tbHomePage);
            this.tpDesigner.Controls.Add(this.label2);
            this.tpDesigner.Controls.Add(this.label1);
            this.tpDesigner.Controls.Add(this.numericMaxTabLength);
            this.tpDesigner.Location = new System.Drawing.Point(4, 23);
            this.tpDesigner.Name = "tpDesigner";
            this.tpDesigner.Padding = new System.Windows.Forms.Padding(3);
            this.tpDesigner.Size = new System.Drawing.Size(334, 138);
            this.tpDesigner.TabIndex = 0;
            this.tpDesigner.Text = "Designer";
            this.tpDesigner.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(8, 15);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(85, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Max Tab Length";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(11, 44);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Homepage";
            // 
            // tbHomePage
            // 
            this.tbHomePage.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.tbHomePage.DataBindings.Add(new System.Windows.Forms.Binding("Text", global::taapBrowser2.Properties.Settings.Default, "Homepage", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.tbHomePage.Location = new System.Drawing.Point(76, 41);
            this.tbHomePage.Name = "tbHomePage";
            this.tbHomePage.Size = new System.Drawing.Size(244, 20);
            this.tbHomePage.TabIndex = 3;
            this.tbHomePage.Text = global::taapBrowser2.Properties.Settings.Default.Homepage;
            // 
            // numericMaxTabLength
            // 
            this.numericMaxTabLength.DataBindings.Add(new System.Windows.Forms.Binding("Value", global::taapBrowser2.Properties.Settings.Default, "MaximumTabLength", true, System.Windows.Forms.DataSourceUpdateMode.OnPropertyChanged));
            this.numericMaxTabLength.Location = new System.Drawing.Point(99, 13);
            this.numericMaxTabLength.Maximum = new decimal(new int[] {
            50,
            0,
            0,
            0});
            this.numericMaxTabLength.Minimum = new decimal(new int[] {
            10,
            0,
            0,
            0});
            this.numericMaxTabLength.Name = "numericMaxTabLength";
            this.numericMaxTabLength.Size = new System.Drawing.Size(47, 20);
            this.numericMaxTabLength.TabIndex = 0;
            this.numericMaxTabLength.Value = global::taapBrowser2.Properties.Settings.Default.MaximumTabLength;
            // 
            // FrmOptions
            // 
            this.AcceptButton = this.btnSave;
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.CancelButton = this.btnCancel;
            this.ClientSize = new System.Drawing.Size(342, 204);
            this.Controls.Add(this.customTabControl1);
            this.Controls.Add(this.panel1);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "FrmOptions";
            this.ShowInTaskbar = false;
            this.Text = "Options";
            this.panel1.ResumeLayout(false);
            this.customTabControl1.ResumeLayout(false);
            this.tpDesigner.ResumeLayout(false);
            this.tpDesigner.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericMaxTabLength)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btnSave;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.CustomTabControl customTabControl1;
        private System.Windows.Forms.TabPage tpDesigner;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.NumericUpDown numericMaxTabLength;
        private System.Windows.Forms.TextBox tbHomePage;
        private System.Windows.Forms.Label label2;

    }
}