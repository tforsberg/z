using System;
using System.IO;
using System.Windows.Forms;
using taapBrowser2.Forms;
using WeifenLuo.WinFormsUI.Docking;

namespace taapBrowser2
{
	public partial class Form1 : Form
	{
		FrmConsoleWindow consoleWindow;
		FrmOptions options;
		FrmBrowsers browsers;


		public Form1()
		{
			InitializeComponent();
			 browsers = new FrmBrowsers();
			browsers.NewMessage += BrowsersNewMessage;


			browsers.Show(dockPanel);

			consoleWindow = new FrmConsoleWindow();

			consoleWindow.Show(dockPanel, DockState.DockBottom);


		}

		void BrowsersNewMessage(object sender, string message, int browserNumber)
		{
			if (consoleWindow != null) consoleWindow.Message(message, browserNumber);
		}

		private void DesignerToolStripMenuItemClick(object sender, EventArgs e)
		{
			if (options == null)
			{
				options = new FrmOptions();
				options.Show(dockPanel, DockState.DockLeft);
			}
			else
			{
				options.Show(dockPanel, DockState.DockLeft);
			}

		}

		/// <summary>
		/// Save out the history list for this session.
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>
		private void Form1_FormClosing(object sender, FormClosingEventArgs e)
		{
			SaveHistory();
			Properties.Settings.Default.HistoryList.Clear();
		}

		private void SaveHistory()
		{

			string path = Application.StartupPath;
			path = Path.Combine(path, "history");
			FileStream fs = null;
			StreamWriter sw = null;
			string filename = DateTime.Now.ToString().Replace(".", "").Replace("\\", "").Replace("/", "");
			try
			{
				fs = new FileStream(Path.Combine(path, filename), FileMode.CreateNew, FileAccess.Write, FileShare.Read);
				sw = new StreamWriter(fs);

				foreach (string item in browsers.HistoryList)
				{
					sw.WriteLine(item);
				}

				sw.Close();
				fs.Close();
				consoleWindow.Message("History Saved", -1);
			}
			catch (Exception ex)
			{
				consoleWindow.Message(ex.Message, -1);
			}

			if (sw != null) sw.Close();
			if (fs != null) fs.Close();
		}

	}
}
