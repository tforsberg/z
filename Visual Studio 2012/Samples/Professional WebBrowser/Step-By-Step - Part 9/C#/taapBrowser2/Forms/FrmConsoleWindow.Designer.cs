namespace taapBrowser2.Forms
{
    partial class FrmConsoleWindow
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
            this.rtbConOut = new System.Windows.Forms.RichTextBox();
            this.SuspendLayout();
            // 
            // rtbConOut
            // 
            this.rtbConOut.BackColor = System.Drawing.Color.Black;
            this.rtbConOut.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.rtbConOut.Dock = System.Windows.Forms.DockStyle.Fill;
            this.rtbConOut.ForeColor = System.Drawing.SystemColors.Info;
            this.rtbConOut.Location = new System.Drawing.Point(0, 0);
            this.rtbConOut.Name = "rtbConOut";
            this.rtbConOut.ShowSelectionMargin = true;
            this.rtbConOut.Size = new System.Drawing.Size(733, 252);
            this.rtbConOut.TabIndex = 0;
            this.rtbConOut.Text = "";
            // 
            // ConsoleWindow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(733, 252);
            this.Controls.Add(this.rtbConOut);
            this.Name = "ConsoleWindow";
            this.Text = "Console Window";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.RichTextBox rtbConOut;
    }
}